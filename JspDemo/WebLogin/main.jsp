<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String name=(String)session.getAttribute("uname");
	
	if(name==null){
		response.sendRedirect("index.jsp");
	}
	else{
		out.print("<h1>��ӭ"+name+"���ʱ�վ</h1>");
		
	}
 %>
 <form action="listallfriend.jsp" method="post">
 	<input type="submit" value="�г����к���">
 </form>"
  
