<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
    <%  
    String CookieNAME = "";  
    String CookiePASSWORD = "";  
    Cookie[] CookieArray = request.getCookies();  
    if (CookieArray != null){  
        for (int i = 0;i < CookieArray.length;i ++){  
            if (CookieArray[i].getName().equals("CookieNAME")){  
                CookieNAME = CookieArray[i].getValue();  
            }  
            else if (CookieArray[i].getName().equals("CookiePASSWORD")){  
                CookiePASSWORD = CookieArray[i].getValue();  
            }  
        }  
    }  
      
     %>  
<center>
<form name=myform action="MyJsp.jsp" method="post" >
    <table>
    <tr>
      <td align="right" >用户名称:</td> 
      <td><input type=text name="name" value="<%=CookieNAME%>"/></td>
    </tr>
    
    <tr> 
      <td align="right" >密码:</td>
      <td><input type=password name="password" value="<%=CookiePASSWORD%>"/></td>
    </tr>
    
    <tr>  
      <td colspan="2" align="center"><input type="checkbox" name="nameCheckBox" value="true">自动记录名称</td>  
    </tr>  
    
    <tr>  
      <td colspan="2" align="center"><input type="checkbox" name="passwordCheckBox" value="true">自动记录密码</td>  
    </tr>  
    <tr>  
      <td colspan="2" align="center"><input type="submit" value="登录"> <input type="reset" value="重置"></td>  
    </tr>  
    </table>
</form>
</center>
