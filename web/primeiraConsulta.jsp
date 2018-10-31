<%-- 
    Document   : PrimeiraConsulta
    Created on : 13/dez/2015, 19:21:38
    Author     : Ruben
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Primeira Consulta</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="sessaoUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="sessaoUtente" property="*"/>
        
        <jsp:directive.page import="consultas.primeiraConsultaBean"/>
        <jsp:useBean id="utenteConsulta" scope="page" class="consultas.primeiraConsultaBean"/>
        <jsp:setProperty name="utenteConsulta" property="*"/>
    </head>
    <body>
        <center>
        <h1>Primeira Consulta</h1>
        <h2>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h2>
        <h2>Utente: <jsp:getProperty name="sessaoUtente" property="nome"/></h2>
        <form method="POST">
        <h2>Anamnese</h2>
        <h3>Tipo de Diabetes</h3>
        <select name="tipodiab" size="2">
            <option value="sem diag"> Diagnositco não confirmado</option>
            <option value="gesta"> Diabetes Gestacional</option>
            <option value="tip2"> Diabetes tipo II</option>
            <option value="tip1"> Diabetes tipo I</option>
        </select>
        <br> Data de diagnóstico: <input type="date" name="dod">
        <br> Insulina: <input type="checkbox" name="insulina" value="1" />
        <h3>Antecedentes Familiares</h3>
        <select name="antecedentes" size="3">
            <option value=0> Sem antecedentes</option>
            <option value=1> Familiares afastados</option>
            <option value=2> Familiares 1º grau</option>
        </select>
        <h3>Complicações atribuidas à diabetes</h3>
        <br> Neuropatia: <input type="checkbox" name="neurop" value="1" />
        <br> Retinopatia: <input type="checkbox" name="retinop" value="1" />
        <br> Nefropatia: <input type="checkbox" name="nefrop" value="1" />
        <br> Enfarte Miocardio: <input type="checkbox" name="eam" value="1" />
        <br> AVC: <input type="checkbox" name="avc" value="1" />
        <br>
        <br> Fumador: <input type="checkbox" name="fuma" value="1" />
        <br> Perfil Lipídico Alterado: <input type="checkbox" name="lipid" value="1" />
        <br><input type="submit" value="Submeter" name="op" />
        <input type="submit" value="Continuar Consulta" name="op" />
        <input type="submit" value="HomeUser" name="op" />
        <input type="submit" value="Sair" name="op" />
        </form>
        </center>
         <% 
              if ((request.getParameter("op") != null) ) { 
                 if (request.getParameter("op").equals("Submeter")){ 
                    
                     if(request.getParameter("dod") != ""){ 
                        
                        String dod = request.getParameter("dod");
                        SimpleDateFormat formato = new SimpleDateFormat ("yyyy-MM-dd");
                        java.util.Date ddd = formato.parse(dod);
                        java.sql.Date datadiag = new java.sql.Date(ddd.getTime());
                        utenteConsulta.setDataDiag(datadiag); 
                    }
                    else {
                            %>    
                                <script> alert("Insira data de nascimento");</script> 
                            <%
                        }
                    java.util.Date datacons = new java.util.Date();
                    java.sql.Date dataconsulta = new java.sql.Date(datacons.getTime());
                    utenteConsulta.setDataConsulta(dataconsulta);

                    utenteConsulta.setUsername(sessaoUser.getUsername());
                    utenteConsulta.setUtenteNumber(sessaoUtente.getUtenteNumber());
                    
//tem de estar dentro do if porque sempre que é chamada cria um registo
                    if (utenteConsulta.setDBRecord() == true ){
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
                  
                    response.sendRedirect("sinaisVitais.jsp");
                }
                if (request.getParameter("op").equals("HomeUser")){ 
                  
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