<%-- 
    Document   : exameFisico
    Created on : 22/dez/2015, 16:54:51
    Author     : Ruben
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exame Fisico</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="sessaoUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="sessaoUtente" property="*"/>
        
        <jsp:directive.page import="consultas.exameFisicoBean"/>
        <jsp:useBean id="utenteEF" scope="page" class="consultas.exameFisicoBean"/>
        <jsp:setProperty name="utenteEF" property="*"/>
    </head>
    <body>
        <center>
        <h1>Exame Fisico</h1>
        <h2>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h2>
        <h2>Utente: <jsp:getProperty name="sessaoUtente" property="nome"/></h2>
        <form method="POST">
        <h3>Acuidade Visual</h3>
        <select name="acuidadevisual" size="3">
            <option value=0> Perservada </option>
            <option value=1> Diminuida </option>
        </select>
        <h2>Pé Diabético</h2>
        <h3>Sensibilidade</h3>
        <select name="pesensibilidade" size="3">
            <option value=0> não alterada</option>
            <option value=1> à vibração</option>
            <option value=2> ao toque por monofilamente</option>
            <option value=3> sem sensibilidade</option>
        </select>
        <h3>Temperatura</h3>
        <select name="petemp" size="3">
            <option value=0> Normotérmico</option>
            <option value=1> Frio</option>
            <option value=2> Quente</option>
        </select>
        <h3>Pulso Periferico</h3>
        <select name="pepulsoperif" size="3">
            <option value=0> presente em ambos os pés</option>
            <option value=1> presente só pé esquerdo</option>
            <option value=2> presente só pé direito</option>
        </select>
        <h3>Integridade Cutanea</h3>
        <select name="peintegridade" size="3">
            <option value=0> Intacta</option>
            <option value=1> ulcera activa grau 0</option>
            <option value=2> ulcera activa grau 1</option>
            <option value=3> ulcera activa grau 2</option>
            <option value=4> ulcera activa grau 3</option>
            <option value=5> ulcera activa grau 4</option>
            <option value=6> ulcera activa grau 5</option>
        </select>
        <br><input type="submit" value="Submeter" name="op" />
        <br><br>
        <input type="submit" value="Finalizar Consulta" name="op" />
        <input type="submit" value="HomeUser" name="op" />
        <input type="submit" value="Sair" name="op" />
        </form>
        </center>
     <% 
              if ((request.getParameter("op") != null) ) { 
                 if (request.getParameter("op").equals("Submeter")){ 
                    
                    java.util.Date datacons = new java.util.Date();
                    java.sql.Date dataconsulta = new java.sql.Date(datacons.getTime());
                    utenteEF.setDataConsulta(dataconsulta);
                    
                    utenteEF.setUsername(sessaoUser.getUsername());
                    utenteEF.setUtenteNumber(sessaoUtente.getUtenteNumber());
                    
//tem de estar dentro do if porque sempre que é chamada cria um registo
                    if (utenteEF.setDBRecord() == true ){
                        %>    
                             <script> alert("Consulta Gravada");</script> 
                        <%    
                    }
                     else {  
                            %>
                                 <script> alert("Registo nao foi criado! Contacte administrador");</script> 
                            <%
                        }
                    
                }
                if (request.getParameter("op").equals("Finalizar Consulta")){ 
                    response.sendRedirect("consultas2.jsp");
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
