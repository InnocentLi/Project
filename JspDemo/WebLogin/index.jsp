<%@ page language="java" import="java.util.*" import="javax.servlet.*" pageEncoding="utf-8"%>
<h1>JSP测试</h1>
<hr/>
<meta charset="UTF-8">
<%
String cookieName = "uname";
String cookieName1="password";
   String cookieValue="";
   String cookieValue1="";
   Cookie cookies[] = request.getCookies();
   if (cookies != null){ 				
      for(int i=0; i < cookies.length; i++){
         if (cookies[i].getName().equals(cookieName)){
              cookieValue=cookies[i].getValue();
              
         }
         if (cookies[i].getName().equals(cookieName1)){
              cookieValue1=cookies[i].getValue();
             
         }
		}
	}
%>

<center>
<%
	String message = (String)request.getAttribute("err");
	if(message!=null){
		//写出
		out.print("<font color=\"red\">"+message+"</font>");
	}
	
 %>
<table>
<form action="login.jsp" method="post">
	<tr>
		<td align="right">
			用户名:
		</td>
		<td>
			<input type="text" name="uname" value="<%=cookieValue%>"  style="width:160;height=20"/>
		</td>
	</tr>
	<tr>
		<td align="right">
			密码:
		</td>
		<td>
			<input type="password" name="password" value="<%=cookieValue1%>"  style="width:160;height=20"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="checkbox" name="isSave" value="saveUName"/>保存用户名
			<input type="checkbox" name="isSave" value="savePassword"/>保存密码
			
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="登陆"/>
			<input type="button" value="注册" onClick="window.location='registerform.jsp'"/>
			<input type="reset" value="重置"/>
		</td>
	</tr>
</form>
</table>
</center>
