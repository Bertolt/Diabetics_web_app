<%-- 
    Document   : testesRapidos
    Created on : 22/dez/2015, 16:42:08
    Author     : Ruben
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Testes Rapidos</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="sessaoUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="sessaoUtente" property="*"/>
        
        <jsp:directive.page import="consultas.primeiraConsultaBean"/>
        <jsp:useBean id="utenteTR" scope="page" class="consultas.testesRapidosBean"/>
        <jsp:setProperty name="utenteTR" property="*"/>
    </head>
    <body>
        <center>
        <h1>Testes Rapidos</h1>
        <h2>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h2>
        <h2>Utente: <jsp:getProperty name="sessaoUtente" property="nome"/></h2>
        <form method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th>Glicemia Capilar</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Glicemia</td>
                        <td><input type="number" name="glicemia" min="35" max="250" step="1" value="80"></td>
                        <td>(mg/dL)</td>
                    </tr>
                    <tr>
                        <td>Cetonas</td>
                        <td><input type="number" name="cetonas" min="35" max="250" step="1" value="80"></td>
                        <td>(mg/dL)</td>
                    </tr>
                     <tr>
                        <th>Combur</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td>Proteinuria</td>
                        <td>
                        <select name="proteinuria" size="3">
                            <option value=0> negativo</option>
                            <option value=1> ---</option>
                            <option value=2> +</option>
                            <option value=3> ++</option>
                            <option value=4> +++</option>
                            <option value=5> ++++</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>Glicosuria</td>
                        <td><select name="glicosuria" size="3">
                            <option value=0> negativo</option>
                            <option value=1> ---</option>
                            <option value=2> +</option>
                            <option value=3> ++</option>
                            <option value=4> +++</option>
                            <option value=5> ++++</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>Corpos Cetonicos</td>
                        <td><select name="ccetonicos" size="3">
                            <option value=0> negativo</option>
                            <option value=1> ---</option>
                            <option value=2> +</option>
                            <option value=3> ++</option>
                            <option value=4> +++</option>
                            <option value=5> ++++</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>pH</td>
                         <td><select name="ph" size="3">
                            <option value=0> 5.0</option>
                            <option value=1> 5.5</option>
                            <option value=2> 6.0</option>
                            <option value=3> 6.5</option>
                            <option value=4> 7.0</option>
                            <option value=5> 7.5</option>
                            <option value=6> 8.0</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>Densidade</td>
                        <td><select name="densidade" size="3">
                            <option value=0> 1000</option>
                            <option value=1> 1005</option>
                            <option value=2> 1010</option>
                            <option value=3> 1015</option>
                            <option value=4> 1020</option>
                            <option value=5> 1025</option>
                            <option value=6> 1030</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>Hematuria</td>
                            <td><select name="hematuria" size="3">
                            <option value=0> negativo</option>
                            <option value=1> não hemolisado - vestigios</option>
                            <option value=2> não hemolisado - moderado</option>
                            <option value=3> hemolisado - vestigios</option>
                            <option value=4> hemolisado +</option>
                            <option value=5> hemolisado ++</option>
                            <option value=6> hemolisado +++</option>
                        </select></td>
                    </tr>
                     </tbody>
            </table>
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
                    utenteTR.setDataConsulta(dataconsulta);
                    
                    utenteTR.setUsername(sessaoUser.getUsername());
                    utenteTR.setUtenteNumber(sessaoUtente.getUtenteNumber());
                    
//tem de estar dentro do if porque sempre que é chamada cria um registo
                    if (utenteTR.setDBRecord() == true ){
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
                    response.sendRedirect("exameFisico.jsp");
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
