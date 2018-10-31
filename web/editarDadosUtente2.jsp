<%-- 
    Document   : editarDadosUtente2
    Created on : 7/jan/2016, 19:39:40
    Author     : Ruben
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editarDadosUtente2</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="sessaoUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="sessaoUtente" property="*"/>
        
    </head>
    <body>
        <center>
        <h1>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h1>
        
        <h2>Edição dos dados do Utente: <jsp:getProperty name="sessaoUtente" property="nome"/></h2>
        <form method="POST">
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        
                        <th colspan="2"> Introduza os dados do Utente</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> Nome: </td>
                        <td><input type="text" name="nome" value=""/></td>
                       
                    </tr>
                    <tr>
                        <td>Morada: </td>
                        <td><input type="text" name="morada" value=""/></td>
                        
                    </tr>
                    <tr>
                        <td>Telefone</td>
                        <td><input type="tel" name="telefone" value=""/></td>
                        
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" value=""/></td>
                        
                    </tr>
                    
                </tbody>
            </table>
        
        <br><input type="submit" value="Submeter" name="op" />
        <input type="submit" value="Sair" name="op" />
        <input type="submit" value="HomeUser" name="op" />
        </form>
        </center>
        <%   
        if (request.getParameter("nome") != null ) { 
            
            if (request.getParameter("op").equals("Submeter")){
                if (sessaoUtente.editarDados() == true ){  
                        %>
                             <script> alert("Dados Actualizados");</script> 
                        <%
                        sessaoUtente.resetDados();    
                    }else{
                         %>
                            <script> alert("Dados nao actualizados");</script> 
                    <%
                           }
            }
            if (request.getParameter("op").equals("HomeUser")){
                sessaoUtente.reset();
                response.sendRedirect("homeUser.jsp");
            }
            if (request.getParameter("op").equals("Sair")){ 
                    sessaoUser.reset();
                    response.sendRedirect("inicio.jsp");
                }
        } 
        %>
    </body>
</html>
