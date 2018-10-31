<%-- 
    Document   : consultas2
    Created on : 4/jan/2016, 1:57:51
    Author     : Ruben

--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>consultas2</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="sessaoUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="sessaoUtente" property="*"/>
        <% if (sessaoUtente.getAlta() == 0) response.sendRedirect("consultas.jsp");%>
   
    </head>
    <body>
        <center>
        <h2>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h1>
        <h1>Consultas</h1>
        <h2>Utente: <jsp:getProperty name="sessaoUtente" property="nome"/></h2>
        <h3>Consultas:</h3>
        <form method="POST">
            <input type="submit" value="Primeira Consulta" name="op" /> 
            <input type="submit" value="Nova Consulta" name="op" />  
            <input type="submit" value="Marcar uma consulta" name="op" />
            <input type="submit" value="Referenciar" name="op" />
            <br><br><br>
            <h3>Evolução Utente:</h3>
            <input type="submit" value="Mostrar Anamnese do Utente" name="op" />
            <input type="submit" value="Mostrar Evolução Sinais Vitais" name="op" />
            <input type="submit" value="Mostrar EvoluçãoTestes rapidos" name="op" />
            <input type="submit" value="Mostrar Evolução Exame Fisico" name="op" />
            <br>
            <br><br><input type="submit" value="Voltar" name="op" />
            <input type="submit" value="Home" name="op" />
            <input type="submit" value="Sair" name="op" /> 
        </form>
        </center>
        <% 
              if ((request.getParameter("op") != null) ) { 
                 
                if (request.getParameter("op").equals("Marcar uma consulta")){
                    response.sendRedirect("marcarConsulta.jsp");
                }
                 if (request.getParameter("op").equals("Primeira Consulta")){ 
                    response.sendRedirect("primeiraConsulta.jsp");
                }
                 if (request.getParameter("op").equals("Nova Consulta")){ 
                    response.sendRedirect("sinaisVitais.jsp");
                }
                if (request.getParameter("op").equals("Referenciar")){ 
                    response.sendRedirect("ref.jsp");
                }
                if (request.getParameter("op").equals("Mostrar Anamnese do Utente")){
                    response.sendRedirect("resultadoAnamnese.jsp");
                }
                if (request.getParameter("op").equals("Mostrar Evolução Sinais Vitais")){ 
                    response.sendRedirect("resultadoEvolucao.jsp");
                }
                if (request.getParameter("op").equals("Mostrar EvoluçãoTestes rapidos")){ 
                    response.sendRedirect("resultadoEvolucao.jsp");
                }
                if (request.getParameter("op").equals("Mostrar Evolução Exame Fisico")){ 
                    response.sendRedirect("resultadoEvolucao.jsp");
                }
                if (request.getParameter("op").equals("Voltar")){ 
                    sessaoUtente.reset();
                    response.sendRedirect("consultas.jsp");
                }
                if (request.getParameter("op").equals("Sair")){
                    sessaoUser.reset();
                    response.sendRedirect("inicio.jsp");
                }
                if (request.getParameter("op").equals("Home")){ 
                    sessaoUtente.reset();
                    response.sendRedirect("homeUser.jsp");
                }
            }
         %>
        
    </body>
</html>
