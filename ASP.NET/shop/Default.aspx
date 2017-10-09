<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        *{margin:0;border:0;list-style:none;}
        .center{
            text-align:center
        }
        .auto-style1 {
            margin-top: 0;
        }
        #logo{
            width:363px;
            height:121px;
            margin:0 auto;
            text-align:center;
            
        }
        .logo{
            display:flex;
        }

        .auto-style2 {
            height: 251px;
        }
        #my {
            width:1190px;
            margin:258px auto 0 auto;
            float:left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            
    </div>
      
       <div class="center">   <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="280px" BorderColor="#FF3300" BorderWidth="1px" Font-Size="Large" OnTextChanged="TextBox1_TextChanged" Wrap="False"></asp:TextBox>    
           <asp:Button ID="Button1" runat="server" BackColor="#FF3300" BorderColor="White" CssClass="auto-style1" Font-Names="Arial Black" Font-Size="Large" ForeColor="White" Height="29px" OnClick="Button1_Click" Text="搜索" Width="67px" />
        </div>
         
        <div id="logo" class="auto-style2"> 
          
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/apple.jpg" OnClick="ImageButton1_Click" />
            <br />
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img/samsung.png" OnClick="ImageButton2_Click" />
            <br />
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/img/xiaomi.png" OnClick="ImageButton3_Click" />
          
         </div>

      <div id="my" runat="server">
          <%=strHTML%>                                                                           <!--razor -->                                                                  
      </div>
  
         
    </form>
      
</body>
</html>
