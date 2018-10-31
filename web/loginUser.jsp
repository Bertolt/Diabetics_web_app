<%-- 
    Document   : index
    Created on : 8/dez/2015, 19:23:30
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example</title>
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
	<jsp:setProperty name="sessaoUser" property="*"/>
    </head>
    <body>
        <form method="post" action="loginUser.jsp">
            <center>
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Faça o login aqui</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" name="op" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">Não está registado? <a href="regUser.jsp">Registe-se aqui</a></td>
                    </tr>
                   
                </tbody>
            </table>
            </center>
        </form>
       <%
         if ((request.getParameter("username") != null) && (request.getParameter ("password") != null) ) { 
             if (request.getParameter("op").equals("Login")){ 
                 if (sessaoUser.verificaCredenciais() == true ){  
                    response.sendRedirect("homeUser.jsp");
                }
                 if (sessaoUser.verificaCredenciais() == false ){  %>
                     <script> alert("Password ou Username errados");</script> 
            <%    }
            }
        }
       %>
    </body>
</html>
