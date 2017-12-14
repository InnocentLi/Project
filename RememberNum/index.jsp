<%@ page pageEncoding="UTF-8"%>
<%@page import="aa.ReaderAndWriter"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>j2ee--test2</title>
</head>
<body>
<h1>九九乘法口诀表</h1>

<%
	for(int i=1;i<=9;i++) {
	for(int j=1;j<=i;j++) {
%>
				<%=j%>x<%=i%>=<%=i*j%>
			<%
				}
			%>
			<br>
		<%
			}
		%>

<h1>网络计数器</h1>

<h3>您好，你是本网站第
<%
ReaderAndWriter RW = new ReaderAndWriter();
String count;
if(!(count = RW.reader()).isEmpty()) {
    int num = Integer.parseInt(count)+1;
    count = String.valueOf(num);
    RW.writer(""+num);
}
else {
	RW.writer(""+1);
	count = "1";
}
for(int i=0; i<count.length(); i++) {
		out.print("<img src=./images/"+count.charAt(i)+".GIF>");
}
%>
个访问者</h3>
</body>
</html>
