<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="service.UserService"%>
<%
	request.setCharacterEncoding("gbk");
	String name=request.getParameter("uname");
	String password=request.getParameter("password");
	String isSave[]=request.getParameterValues("isSave");
	if("".equals(name) || name==null){
		
		request.setAttribute("err","用户名不能为空");
		request.getRequestDispatcher("index.jsp").forward(request,response);
		//提示用户输入用户名,跳转index.jsp
		return;
	}
	if("".equals(password) || password==null){
		request.setAttribute("err","密码不能为空");
		request.getRequestDispatcher("index.jsp").forward(request,response);
		//提示用户输入用户名,跳转index.jsp
		return;
	}
	UserService service = new UserService();
	String result=service.login(name,password);
	if(result.length()==0){
		//登陆成功,跳转到main.jsp
		//response.sendRedirect("main.jsp");

		//跳转之前，将用户信息写入session
		session.setAttribute("uname",name);
		//跳转
		request.getRequestDispatcher("main.jsp").forward(request,response);
		
	}
	else{
		//提示用户名或密码错误，跳回index.jsp
		request.setAttribute("err",result);
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}
	
	//..........
	
%>