<%-- 
    Document   : homeAdmin
    Created on : 22/dez/2015, 20:18:17
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:directive.page import="loginUser.loginUserAdminBean"/>
	<jsp:useBean id="sessaoAdmin" scope="session" class="loginUser.loginUserAdminBean"/>
        <% if (sessaoAdmin.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
    </head>
    <body>
       <form method="post"  action="homeAdmin.jsp">
             <h1>Olá <jsp:getProperty name="sessaoAdmin" property="username"/></h1>
        <table border="1">
            <thead>
                <tr>
                    <th> Pedidos de Utilizador</th>
                    <th> Adicionar Administrador </th>
                    <th> Pesquisar Utilizador </th>
                    <th> Log Out</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="submit" value="Listar" name="op" />  </td>
                    <td><input type="submit" value="Adicionar" name="op" /> </td>
                    <td><input type="submit" value="Pesquisar" name="op" /> </td>
                    <td><input type="submit" value="Sair" name="op" /> </td>
                </tr>
            </tbody>
        </table>
        </form>
          <% 
              if ((request.getParameter("op") != null) ) { 
                 if (request.getParameter("op").equals("Listar")){ 
                  
                    response.sendRedirect("listaPedido.jsp");
                }
                 if (request.getParameter("op").equals("Adicionar")){ 
                  
                    response.sendRedirect("adicionarAdmin.jsp");
                }
                 if (request.getParameter("op").equals("Pesquisar")){ 
                  
                    response.sendRedirect("pesquisaUser.jsp");
                }
                 if (request.getParameter("op").equals("Sair")){ 
                     sessaoAdmin.reset();
                    response.sendRedirect("inicio.jsp");
                }
            }
         %>
    </body>
</html>
