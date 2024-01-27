#include <iostream>
#include <Winsock2.h>
#include <iphlpapi.h>
#include <WS2tcpip.h>
#include <thread>

#pragma comment(lib, "iphlpapi.lib")
#pragma comment(lib, "Ws2_32.lib")

typedef HANDLE(WINAPI* Fn_IcmpCreateFile)();
typedef BOOL(WINAPI* Fn_IcmpCloseHandle)(HANDLE);

typedef DWORD(WINAPI* Fn_IcmpSendEcho)(
        HANDLE                   IcmpHandle,
        IPAddr                   DestinationAddress,
        LPVOID                   RequestData,
        WORD                     RequestSize,
        PIP_OPTION_INFORMATION   RequestOptions,
        LPVOID                   ReplyBuffer,
        DWORD                    ReplySize,
        DWORD                    Timeout
);
#define DEFAULT_PING_TIMEOUT    3000

class IcmpAsyncSender {
public:
    IcmpAsyncSender() {
        hIphlpapi_ = LoadLibrary(TEXT("iphlpapi.dll"));
        if (hIphlpapi_ != nullptr) {
            IcmpCreateFile_ = (Fn_IcmpCreateFile)GetProcAddress(hIphlpapi_, "IcmpCreateFile");
            IcmpCloseHandle_ = (Fn_IcmpCloseHandle)GetProcAddress(hIphlpapi_, "IcmpCloseHandle");
            IcmpSendEcho_ = (Fn_IcmpSendEcho)GetProcAddress(hIphlpapi_, "IcmpSendEcho");
        }

        if (WSAStartup(MAKEWORD(2, 2), &wsaData_) != 0) {
            std::cerr << "WSAStartup failed." << std::endl;
        }

        icmp_file_ = IcmpCreateFile_();
        if (icmp_file_ == INVALID_HANDLE_VALUE) {
            std::cerr << "Failed to create ICMP handle." << std::endl;
        }
    }

    ~IcmpAsyncSender() {
        if (hIphlpapi_ != nullptr) {
            FreeLibrary(hIphlpapi_);
        }

        if (icmp_file_ != INVALID_HANDLE_VALUE) {
            IcmpCloseHandle_(icmp_file_);
        }

        WSACleanup();
    }

    bool IsInitialized() const {
        return IcmpCreateFile_ != nullptr && IcmpCloseHandle_ != nullptr && IcmpSendEcho_ != nullptr && icmp_file_ != INVALID_HANDLE_VALUE;
    }

    void StartAsyncIcmpThread(const std::string& destinationIP, int maxHops) {
        if (!IsInitialized()) {
            return;
        }

        icmp_thread_ = std::thread(&IcmpAsyncSender::IcmpThread, this, destinationIP, maxHops);
    }

    void StopAsyncIcmpThread() {
        if (icmp_thread_.joinable()) {
            icmp_thread_.join();
        }
    }

private:
    HMODULE hIphlpapi_;
    Fn_IcmpCreateFile IcmpCreateFile_;
    Fn_IcmpCloseHandle IcmpCloseHandle_;
    Fn_IcmpSendEcho IcmpSendEcho_;
    HANDLE icmp_file_;
    WSADATA wsaData_{};
    std::thread icmp_thread_;
    std::thread listener_thread_;

    void IcmpThread(const std::string& destinationIP, int maxHops) {
        StartAsyncIcmpListener();

        for (int ttl = 1; ttl <= maxHops; ++ttl) {
            AsyncSendMtr(destinationIP, ttl);
        }

        StopAsyncIcmpListener();
    }

    void StartAsyncIcmpListener() {
        listener_thread_ = std::thread(&IcmpAsyncSender::IcmpListenerThread, this);
    }

    void StopAsyncIcmpListener() {
        if (listener_thread_.joinable()) {
            listener_thread_.join();
        }
    }

    void IcmpListenerThread() {
        SOCKET icmpSocket = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP);

        if (icmpSocket == INVALID_SOCKET) {
            std::cerr << "Failed to create ICMP socket." << std::endl;
            return;
        }

        SOCKADDR_IN fromAddr;
        int fromAddrLen = sizeof(fromAddr);

        const int bufferSize = 4096;
        char buffer[bufferSize];

        while (true) {
            int bytesReceived = recvfrom(icmpSocket, buffer, bufferSize, 0, (SOCKADDR*)&fromAddr, &fromAddrLen);

            if (bytesReceived == SOCKET_ERROR) {
                std::cerr << "Error receiving ICMP packet: " << WSAGetLastError() << std::endl;
                break;
            }

            char ipString[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, &fromAddr.sin_addr, ipString, INET_ADDRSTRLEN);
            std::cout << "Received ICMP packet from: " << ipString << std::endl;
        }

        closesocket(icmpSocket);
    }

    DWORD String2IPv4(const std::string& ipString) {
        DWORD ipAddress = 0;

        if (WSAStartup(MAKEWORD(2, 2), &wsaData_) != 0) {
            std::cerr << "Failed to initialize Winsock." << std::endl;
            return 0;
        }

        struct sockaddr_in sa;
        if (inet_pton(AF_INET, ipString.c_str(), &(sa.sin_addr)) != 1) {
            std::cerr << "Error converting string to IPv4 address." << std::endl;
        }
        else {
            ipAddress = sa.sin_addr.S_un.S_addr;
        }

        WSACleanup();

        return ipAddress;
    }

    void AsyncSendMtr(const std::string& destinationIP, int ttl) {
        IP_OPTION_INFORMATION option = { 0 };
        option.Ttl = static_cast<BYTE>(ttl);

        const int data_size = 32;
        LPVOID data = new char[data_size];

        DWORD reply_buffer_length = sizeof(ICMP_ECHO_REPLY) + data_size;
        LPVOID reply_buffer = new char[reply_buffer_length];

        DWORD ret_val = IcmpSendEcho_(icmp_file_,
                                      String2IPv4(destinationIP),
                                      data,
                                      static_cast<WORD>(data_size),
                                      &option,
                                      reply_buffer,
                                      reply_buffer_length,
                                      DEFAULT_PING_TIMEOUT);

        if (ret_val > 0) {
            auto* echo_reply = reinterpret_cast<ICMP_ECHO_REPLY*>(reply_buffer);
            char ipString[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, &echo_reply->Address, ipString, INET_ADDRSTRLEN);
            std::cout << "TTL: " << static_cast<int>(ttl) << " Source IP: " << ipString << std::endl;
        }

        delete[] data;
        delete[] reply_buffer;
    }
};

int main() {
    IcmpAsyncSender icmpSender;

    if (icmpSender.IsInitialized()) {
        icmpSender.StartAsyncIcmpThread("182.61.200.6", 30);
        icmpSender.StopAsyncIcmpThread();
    }
    else {
        std::cerr << "初始化失败。" << std::endl;
    }

    return 0;
}
