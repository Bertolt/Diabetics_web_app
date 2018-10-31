<%-- 
    Document   : homeUser
    Created on : 12/dez/2015, 16:22:52
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome </title>
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("ref.jsp");%>
    </head>
    <body>
         
         
         <form method="post"  action="homeUser.jsp">
             <center>
             <h1>Olá <jsp:getProperty name="sessaoUser" property="username"/></h1>
        <table border="1">
            <thead>
                <tr>
                    <th> Gestao de Utentes</th>
                    <th> Consultas </th>
                    <th> Log Out</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="submit" value="Gestao de Utentes" name="op" />  </td>
                    <td><input type="submit" value="Consultas" name="op" /> </td>
                    <td><input type="submit" value="Sair" name="op" /> </td>
                </tr>
            </tbody>
        </table>
 </form>
        </center>
          <% 
              if ((request.getParameter("op") != null) ) { 
                 if (request.getParameter("op").equals("Gestao de Utentes")){ 
                  
                    response.sendRedirect("gestaoUtente.jsp");
                }
                 if (request.getParameter("op").equals("Consultas")){ 
                  
                    response.sendRedirect("consultas.jsp");
                }
                 if (request.getParameter("op").equals("Sair")){ 
                     sessaoUser.reset();
                    response.sendRedirect("inicio.jsp");
                }
            }
         %>
    </body>
</html>
