<%-- 
    Document   : ref
    Created on : 22/dez/2015, 17:05:41
    Author     : Ruben
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Referenciacao</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="sessaoUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="sessaoUtente" property="*"/>
        <% if (sessaoUtente.getAlta() == 0) response.sendRedirect("consultas.jsp");%>
        
        <jsp:directive.page import="consultas.ReferenciacaoBean"/>
        <jsp:useBean id="referenciacaoUtente" scope="page" class="consultas.ReferenciacaoBean"/>
        <jsp:setProperty name="referenciacaoUtente" property="*"/>
    </head>
    
    <body>
        <center>
        
        <h1>Referenciação para Consulta de Especialidade</h1>
        <h2>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h2>
        <h2>Utente: <jsp:getProperty name="sessaoUtente" property="nome"/></h2>
        <form method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th>Especialidade</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Cardiologia</td>
                        <td><input type="checkbox" name="cardio" value="true" /></td>
                    </tr>
                    <tr>
                        <td>Cirurgia Vascular</td>
                        <td><input type="checkbox" name="vascular" value="true" /></td>
                        
                    </tr>
                    <tr>
                        <td>Oftalmologia</td>
                        <td><input type="checkbox" name="oftal" value="true" /></td>
                        
                    </tr>
                    <tr>
                        <td>Nefrologia</td>
                        <td><input type="checkbox" name="nefro" value="true" /></td>
                    </tr>
                    <tr>
                        <td>Fisioterapia</td>
                        <td><input type="checkbox" name="fisio" value="true" /></td>
                        
                    </tr>
                    <tr>
                        <td>Terapeuta Ocupacional</td>
                        <td><input type="checkbox" name="ot" value="true" /></td>
                        
                    </tr>
                    <tr>
                        <td>Consulta Antitabagismo</td>
                        <td><input type="checkbox" name="tabag" value="true" /></td>
                        
                    </tr>
                     </tbody>
            </table>
            <br>  
            <input type="submit" value="Referenciar!" name="op" />
            <br><br><br>
            <input type="submit" value="Home" name="op" />
            <input type="submit" value="Voltar" name="op" />
            <input type="submit" value="Sair" name="op" /> 
        </form>
        </center>
         <% 
              if ((request.getParameter("op") != null) ) { 
                 
                if (request.getParameter("op").equals("Referenciar!")){
                java.util.Date dataref = new java.util.Date();
                java.sql.Date datarefrenciacao = new java.sql.Date(dataref.getTime());
                referenciacaoUtente.setDataReferencia(datarefrenciacao);
                
                referenciacaoUtente.setUsername(sessaoUser.getUsername());
                referenciacaoUtente.setUtenteNumber(sessaoUtente.getUtenteNumber());
                
                if ( referenciacaoUtente.setDBRecord() == true ){
                        %>    
                             <script> window.confirm("Referenciação Gravada");</script> 
                        <%    
                    }
                     else {  
                            %>
                                 <script> window.confirm("Registo nao foi criado! Contacte administrador");</script> 
                            <%
                        }
                }
                 if (request.getParameter("op").equals("Home")){
                    sessaoUtente.reset();
                    response.sendRedirect("homeUser.jsp");
                }
                if (request.getParameter("op").equals("Voltar")){ 
                    response.sendRedirect("consultas2.jsp");
                }
                if (request.getParameter("op").equals("Sair")){ 
                    sessaoUser.reset();
                    response.sendRedirect("inicio.jsp");
                }
            }
         %>
    </body>
</html>
