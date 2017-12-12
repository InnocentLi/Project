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
    out.print("比之前数大 <a href=\"index.jsp\">再试一次</a>");
    
  }
  if(x<randomNum)
  {
    out.print("比之前数小<a href=\"index.jsp\">再试一次</a>");
  }
  if(x==randomNum)
  {
  out.print("回答正确 <a href=\"index.jsp\">再试一次</a>");
  session.setAttribute("randomNumber",null);
  }
 %>
