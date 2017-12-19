<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<h1>JSP测试</h1>
<hr/>

<center>
<%
	String message = (String)request.getAttribute("err");
	if(message!=null){
		//写出
		out.print("<font color=\"red\">"+message+"</font>");
	}
	
 %>
<table>
<form action="register.jsp" method="post">
	<tr>
		<td align="right">
			用户名:
		</td>
		<td>
			<input type="text" name="uname"  style="width:160;height=20"/>
		</td>
	</tr>
	<tr>
		<td align="right">
			密码:
		</td>
		<td>
			<input type="password" name="password1" style="width:160;height=20"/>
		</td>
	</tr>
	<tr>
		<td align="right">
			密码确认:
		</td>
		<td>
			<input type="password" name="password2" style="width:160;height=20"/>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="submit" value="注册"/>
			<input type="reset" value="重置"/>
		</td>
	</tr>
</form>
</table>
</center>