<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.DBConnectionPool"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<h1>�ҵĺ���¼</h1>
<hr/>
<%
	Connection con = DBConnectionPool.getInstance().getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from myfriend");
	DBConnectionPool.getInstance().release(con);
	out.print("<form  method=\"post\">");
	out.print("<table width='100%' border='1'>");
	out.print("<th>�޸�</th><th>ɾ��</th><th>����</th><th>�Ա�</th><th>����</th><th>qq</th><th>�绰</th><th>EMail</th><th>��ַ</th>");
	while(rs.next()){
		int id=rs.getInt("id");
		String name=rs.getString("name");
		String sex=rs.getString("sex");
		int age=rs.getInt("age");
		String qq=rs.getString("qq");
		String telephone=rs.getString("telephone");
		String email=rs.getString("email");
		String address=rs.getString("address");
		out.print("<tr>");
		out.print("<td><input type=\"radio\"></td>");
		out.print("<td><input type=\"checkbox\"></td>");
		out.print("<td>"+name+"</td>");
		out.print("<td>"+(sex.equals("M")?"��":"Ů")+"</td>");
		out.print("<td>"+age+"</td>");
		out.print("<td>"+qq+"</td>");
		out.print("<td>"+(telephone.length()==0?"&nbsp;":telephone)+"</td>");
		out.print("<td>"+email+"</td>");
		out.print("<td>"+address+"</td>");
		out.print("</tr>");
	}
	out.print("</table>");
	out.print("</form>");
 %>
 
