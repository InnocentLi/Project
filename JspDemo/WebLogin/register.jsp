<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="service.UserService"%>
<%@page import="util.DBConnectionPool"%>
<%
	request.setCharacterEncoding("gbk");
	String name=request.getParameter("uname");
	String password1=request.getParameter("password1");
	String password2=request.getParameter("password2");
	if("".equals(name) || name==null){
		
		request.setAttribute("err","用户名不能为空");
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		//提示用户输入用户名,跳转index.jsp
		return;
	}
	if("".equals(password1) || password1==null){
		request.setAttribute("err","密码不能为空");
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		//提示用户输入用户名,跳转index.jsp
		return;
	}
	if("".equals(password2) || password2==null){
		request.setAttribute("err","密码确认不能为空");
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		//提示用户输入用户名,跳转index.jsp
		return;
	}
	if(!password1.equals(password2)){
		request.setAttribute("err","两次密码不一致");
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		//提示用户输入用户名,跳转index.jsp
		return;
	}
	//DBConnectionPool pool=new DBConnectionPool();
	UserService service = new UserService();
	String result = service.register(name,password1);
	if(result.length()!=0){
		request.setAttribute("err",result);
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		
	}else{
		
		//注册成功，登陆成功,跳转到main.jsp
		//response.sendRedirect("main.jsp");

		
		//跳转之前，将用户信息写入session
		session.setAttribute("uname",name);
		//跳转
		request.getRequestDispatcher("main.jsp").forward(request,response);
		
	}
	
	
	//..........
	
%>