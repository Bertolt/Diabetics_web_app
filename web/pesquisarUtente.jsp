<%-- 
    Document   : pesquisarUtente
    Created on : 3/jan/2016, 16:47:09
    Author     : Ruben
if (request.getParameter("op").equals("Pesquisar")){ 
                
                String dob = request.getParameter("dob");
                SimpleDateFormat formato = new SimpleDateFormat ("yyyy-MM-dd");
                java.util.Date ddn = formato.parse(dob);
                java.sql.Date data_nasc = new java.sql.Date(ddn.getTime());
                pesquisaUtente.setDataNasc(data_nasc);
                
                pesquisaUtente.getDBRecords();
                response.sendRedirect("resultadoPesquisa.jsp");       
            }
            if (request.getParameter("op").equals("Voltar")){
                response.sendRedirect("gestaoUtente.jsp");
            }
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>pesquisarUtente</title>
        
        <%@ page import="registoUtente.registoUtenteBean"%>
        
         <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="pesquisaUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="pesquisaUtente" property="*"/>
    </head>
    <body>
    <center>
        <h1>Pesquisar Utente</h1>
        <h1>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h1>
        <form method="GET">
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th></th>
                        <th colspan="2"> Introduza Dados Gerais do Utente</th>
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
                        <td><input type="number" name="telefone" value=""/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" value=""/></td>
                    </tr>
                    <tr>
                        <td> Data de Nascimento</td>
                        <td> <input type="date" name="dob"></td>
                    </tr>
                   
                </tbody>
            </table>
        
        <br><input type="submit" value="Pesquisar" name="op" />
        <input type="submit" value="Voltar" name="op" />
        <input type="submit" value="HomeUser" name="op" />
        <input type="submit" value="Sair" name="op" />
        </form>
    </center>
        <%   
        if ( request.getParameter("nome") != null ) { 
            if (request.getParameter("op").equals("Pesquisar")){ 
                
                if(request.getParameter("dob") != ""){
                String dob = request.getParameter("dob");
                SimpleDateFormat formato = new SimpleDateFormat ("yyyy-MM-dd");
                java.util.Date ddn = formato.parse(dob);
                java.sql.Date datanasc = new java.sql.Date(ddn.getTime());
                pesquisaUtente.setDataNasc(datanasc);
                }
                //pesquisaUtente.getDBRecords();
                response.sendRedirect("resultadoPesquisa.jsp");       
            }
            if (request.getParameter("op").equals("Voltar")){
                response.sendRedirect("gestaoUtente.jsp");
            }
            if (request.getParameter("op").equals("Sair")){
                    sessaoUser.reset();
                    response.sendRedirect("inicio.jsp");
                }
            if (request.getParameter("op").equals("HomeUser")){
                response.sendRedirect("homeUser.jsp");
            }
        } 
        %>
    </body>
</html>
