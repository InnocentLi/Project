<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String name=(String)session.getAttribute("uname");
	
	if(name==null){
		response.sendRedirect("index.jsp");
	}
	else{
		out.print("<h1>欢迎"+name+"访问本站</h1>");
		
	}
 %>
 <form action="listallfriend.jsp" method="post">
 	<input type="submit" value="列出所有好友">
 </form>"
  
