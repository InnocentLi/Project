<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="service.UserService"%>
<%@page import="util.DBConnectionPool"%>
<%
	request.setCharacterEncoding("gbk");
	String name=request.getParameter("uname");
	String password1=request.getParameter("password1");
	String password2=request.getParameter("password2");
	if("".equals(name) || name==null){
		
		request.setAttribute("err","�û�������Ϊ��");
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		//��ʾ�û������û���,��תindex.jsp
		return;
	}
	if("".equals(password1) || password1==null){
		request.setAttribute("err","���벻��Ϊ��");
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		//��ʾ�û������û���,��תindex.jsp
		return;
	}
	if("".equals(password2) || password2==null){
		request.setAttribute("err","����ȷ�ϲ���Ϊ��");
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		//��ʾ�û������û���,��תindex.jsp
		return;
	}
	if(!password1.equals(password2)){
		request.setAttribute("err","�������벻һ��");
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		//��ʾ�û������û���,��תindex.jsp
		return;
	}
	//DBConnectionPool pool=new DBConnectionPool();
	UserService service = new UserService();
	String result = service.register(name,password1);
	if(result.length()!=0){
		request.setAttribute("err",result);
		request.getRequestDispatcher("registerform.jsp").forward(request,response);
		
	}else{
		
		//ע��ɹ�����½�ɹ�,��ת��main.jsp
		//response.sendRedirect("main.jsp");

		
		//��ת֮ǰ�����û���Ϣд��session
		session.setAttribute("uname",name);
		//��ת
		request.getRequestDispatcher("main.jsp").forward(request,response);
		
	}
	
	
	//..........
	
%>