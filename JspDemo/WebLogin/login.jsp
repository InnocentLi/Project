<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="service.UserService"%>
<%
	request.setCharacterEncoding("gbk");
	String name=request.getParameter("uname");
	String password=request.getParameter("password");
	String isSave[]=request.getParameterValues("isSave");
	if("".equals(name) || name==null){
		
		request.setAttribute("err","�û�������Ϊ��");
		request.getRequestDispatcher("index.jsp").forward(request,response);
		//��ʾ�û������û���,��תindex.jsp
		return;
	}
	if("".equals(password) || password==null){
		request.setAttribute("err","���벻��Ϊ��");
		request.getRequestDispatcher("index.jsp").forward(request,response);
		//��ʾ�û������û���,��תindex.jsp
		return;
	}
	UserService service = new UserService();
	String result=service.login(name,password);
	if(result.length()==0){
		//��½�ɹ�,��ת��main.jsp
		//response.sendRedirect("main.jsp");

		//��ת֮ǰ�����û���Ϣд��session
		session.setAttribute("uname",name);
		//��ת
		request.getRequestDispatcher("main.jsp").forward(request,response);
		
	}
	else{
		//��ʾ�û����������������index.jsp
		request.setAttribute("err",result);
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}
	
	//..........
	
%>