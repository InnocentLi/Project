<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<h1>JSP����</h1>
<hr/>

<center>
<%
	String message = (String)request.getAttribute("err");
	if(message!=null){
		//д��
		out.print("<font color=\"red\">"+message+"</font>");
	}
	
 %>
<table>
<form action="register.jsp" method="post">
	<tr>
		<td align="right">
			�û���:
		</td>
		<td>
			<input type="text" name="uname"  style="width:160;height=20"/>
		</td>
	</tr>
	<tr>
		<td align="right">
			����:
		</td>
		<td>
			<input type="password" name="password1" style="width:160;height=20"/>
		</td>
	</tr>
	<tr>
		<td align="right">
			����ȷ��:
		</td>
		<td>
			<input type="password" name="password2" style="width:160;height=20"/>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="submit" value="ע��"/>
			<input type="reset" value="����"/>
		</td>
	</tr>
</form>
</table>
</center>