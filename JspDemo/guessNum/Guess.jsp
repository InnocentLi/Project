<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%  
  int x=Integer.parseInt(request.getParameter("number"));
  if(session.getAttribute("randomNumber")==null)
  {
  int num=(int)(Math.random()*100);
  session.setAttribute("randomNumber",new Integer(num));
  System.out.println(num);
  }
  Integer y=(Integer)(session.getAttribute("randomNumber"));
  int randomNum=y.intValue();
  if(x>randomNum)
  {
    out.print("大了 <a href=\"index.jsp\">再试一次</a>");
    
  }
  if(x<randomNum)
  {
    out.print("小了<a href=\"index.jsp\">再试一次</a>");
  }
  if(x==randomNum)
  {
  out.print("对了 <a href=\"index.jsp\">再试一次</a>");
  session.setAttribute("randomNumber",null);
  }
 %>
