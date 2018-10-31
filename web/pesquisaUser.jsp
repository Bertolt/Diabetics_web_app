<%-- 
    Document   : pesquisaUser
    Created on : 9/jan/2016, 19:59:55
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:directive.page import="loginUser.loginUserAdminBean"/>
	<jsp:useBean id="sessaoAdmin" scope="session" class="loginUser.loginUserAdminBean"/>
        <% if (sessaoAdmin.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUser.registoUserBean"/>
        <jsp:useBean id="pesquisaUser" scope="session" class="registoUser.registoUserBean"/>
        <jsp:setProperty name="pesquisaUser" property="*"/>
    </head>
    <body>
        <center>
        <h1>Pesquisar utilizador</h1>
        <h1>Utilizador: <jsp:getProperty name="sessaoAdmin" property="username"/></h1>
        <form method="GET">
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th></th>
                        <th colspan="2"> Introduza Dados Gerais do Utilizador</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> Nome: </td>
                        <td><input type="text" name="nome" value=""/></td>
                    </tr>
                    <tr>
                        <td> Numero: </td>
                        <td><input type="number" name="usernumber" value=""/></td>
                    </tr>
                    <tr>
                        <td>Morada: </td>
                        <td><input type="text" name="morada" value=""/></td>
                    </tr>
                    <tr>
                        <td>Telefone</td>
                        <td><input type="text" name="telefone" value=""/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" value=""/></td>
                    </tr>
                                  
                </tbody>
            </table>
        
        <br><input type="submit" value="Pesquisar" name="op" />
        <input type="submit" value="Voltar" name="op" />
        <input type="submit" value="Sair" name="op" />
        </form>
    </center>
         <%  
            if ((request.getParameter("op") != null) ) {      
                if (request.getParameter("op").equals("Pesquisar")){ 
                    response.sendRedirect("listaUser.jsp");    
                }
                if (request.getParameter("op").equals("Voltar")){
                    response.sendRedirect("homeAdmin.jsp");
                }

                if (request.getParameter("op").equals("Sair")){
                    response.sendRedirect("inicio.jsp");
                }
            }
        %>
    </body>
</html>
