<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<center>
<%
    final String Name = "abc";  
    final String PassWord = "123";
    String name=request.getParameter("name");
    String password=request.getParameter("password");
    if (name.equals(Name)){
      if(password.equals(PassWord)){
         out.print("登陆成功");
         String remembername=request.getParameter("nameCheckBox");
         String rememberpassword=request.getParameter("passwordCheckBox");
         if (remembername != null && remembername.equals("true")){
           Cookie CookieNAME=new Cookie("CookieNAME",Name);
           CookieNAME.setMaxAge(7 * 24 * 60 * 60);
           response.addCookie(CookieNAME); 
         }
         else if (remembername == null || remembername.equals("false")){
           Cookie CookieNAME=new Cookie("CookieNAME",null);
           CookieNAME.setMaxAge(7 * 24 * 60 * 60);
           response.addCookie(CookieNAME); 
         }
         if (rememberpassword != null && rememberpassword.equals("true")){
         Cookie CookiePASSWORD=new Cookie("CookiePASSWORD",PassWord);
         CookiePASSWORD.setMaxAge(7 * 24 * 60 * 60);
         response.addCookie(CookiePASSWORD); 
         }
         else if (rememberpassword == null || rememberpassword.equals("false")){
           Cookie CookiePASSWORD=new Cookie("CookiePASSWORD",null);
           CookiePASSWORD.setMaxAge(7 * 24 * 60 * 60);
           response.addCookie(CookiePASSWORD); 
         }
         
         }
        else{  
            out.print("密码不正确</br>");
            }
    }
    else{  
          out.print("账号不正确</br>");
        }
%>
 <a href="index.jsp">重新登录</a> 
</center>
