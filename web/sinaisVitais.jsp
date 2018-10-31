<%-- 
    Document   : sv
    Created on : 13/dez/2015, 20:06:48
    Author     : Ruben
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sinais Vitais</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="sessaoUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="sessaoUtente" property="*"/>
        
        <jsp:directive.page import="consultas.primeiraConsultaBean"/>
        <jsp:useBean id="utenteSV" scope="page" class="consultas.sinaisVitaisBean"/>
        <jsp:setProperty name="utenteSV" property="*"/>
    </head>
    <body>
        <center>
        <h1>Sinais Vitais</h1>
        
        <h2>Utilizador <jsp:getProperty name="sessaoUser" property="username"/></h2>
        <h2>Utente <jsp:getProperty name="sessaoUtente" property="nome"/></h2>
        <form method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th>Sinal Vital</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Pulso</td>
                        <td><input type="number" name="pulso" min="35" max="250" step="1" value="80"></td>
                        <td>(bpm)</td>
                    </tr>
                    <tr>
                        <td>Pressão Arterial</td>
                        <td><input type="number" name="parterial" min="35" max="250" step="1" value="120"></td>
                        <td>(mmHg)</td>
                    </tr>
                    <tr>
                        <td>Frequencia Respiratoria</td>
                        <td><input type="number" name="rresp" min="8" max="50" step="1" value="20"></td>
                        <td>(cpm)</td>
                    </tr>
                    <tr>
                        <td>Temperatura</td>
                        <td><input type="number" name="temp" min="32" max="45" step="1" value="37"></td>
                        <td>(ºC)</td>
                    </tr>
                    <tr>
                        <td>SPO2</td>
                        <td><input type="number" name="spo2" min="70" max="100" step="1" value="95"></td>
                        <td>(%)</td>
                    </tr>
                    <tr>
                        <td>Dor</td>
                        <td>
                        <input type="range" id ="dor" name="dor" min="0" max="10">
                        <output name="amount" for="dor">
                        <td>[0-10]</td>
                    </tr>
                     </tbody>
            </table>

            <h3>Dados Antropométricos</h3>
                    <br>Peso
                    <br><input type="number" name="peso" min="35" max="250" step="1" value="80"> (kg)
                    <br>Perimetro Abdominal
                    <br><input type="number" name="pabdominal" min="35" max="250" step="1" value="80"> (cm)
                    <br>Altura ajax para que o default seja a ultima mediçao
                    <br><input type="number" name="altura" min="110" max="250" step="1" value="160"> (cm)
                    <br>BMI-  A funcionar com ajax
            <h3>Habitos e estilo de vida</h3>
            <h3>Exercicio Fisico</h3>
                <select name="exercicio" size="3">
                    <option value=0> Diariamente</option>
                    <option value=1> Regularmente (2-4 vezes por semana)</option>
                    <option value=2> Ocasionalmente</option>
                    <option value=3> Sedentario</option>
                    <option value=4> Mobilidade limitada</option>
                    <option value=5> acamado/cadeira de rodas</option>
                </select>
            <h3>Consumo de frutas e vegetais</h3>
                <select name="cfv" size="3">
                    <option value=0> Todos os dias</option>
                    <option value=1> Ocasionalmente</option>
                    <option value=2> Raramente</option>
                </select>
            <h3>Habitos Tabágicos</h3>
                <select name="tabaco" size="3">
                    <option value=0> Nenhum</option>
                    <option value=1> até 3 cigarros por dia</option>
                    <option value=2> até 7 cigarros por dia</option>
                    <option value=3> até 13 ciagrros por dia</option>
                    <option value=4> mais de 14</option>
                </select>
            <br><input type="submit" value="Submeter" name="op" />
            <br><br>
            <input type="submit" value="Continuar Consulta" name="op" />
            <input type="submit" value="HomeUser" name="op" />
            <input type="submit" value="Sair" name="op" />
        </form>
       
        </center>
        <% 
              if ((request.getParameter("op") != null) ) { 
                 if (request.getParameter("op").equals("Submeter")){ 
                    
                    java.util.Date datacons = new java.util.Date();
                    java.sql.Date dataconsulta = new java.sql.Date(datacons.getTime());
                    utenteSV.setDataConsulta(dataconsulta);
                    
                    utenteSV.setUsername(sessaoUser.getUsername());
                    utenteSV.setUtenteNumber(sessaoUtente.getUtenteNumber());
                    
//tem de estar dentro do if porque sempre que é chamada cria um registo
                    if (utenteSV.setDBRecord() == true ){
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
                if (request.getParameter("op").equals("Continuar Consulta")){ 
                    response.sendRedirect("testesRapidos.jsp");
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
