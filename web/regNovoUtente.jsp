
<%-- 
    Document   : newUtenteReg
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
        <title>Registo de Utente</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="registoUtenteInfo" scope="page" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="registoUtenteInfo" property="*"/>
        
    </head>
    <body>
        <center>
        <a>Olá <jsp:getProperty name="sessaoUser" property="username"/></a>
        
        <h1>Registo de Utente</h1>
        <form method="POST">
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
                        <td><input type="tel" name="telefone" value=""/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="tel" name="email" value=""/></td>
                    </tr>
                    <tr>
                        <td> Data de Nascimento</td>
                        <td> <input type="date" name="dob"></td>
                    </tr>
                    <tr>
                        <td> Sexo </td>
                        <td><input type="radio" name="sexo" value="masculino" checked>Masculino<br>
                            <input type="radio" name="sexo" value="feminino">Feminino<br><br></td>
                    </tr>
                    
                </tbody>
            </table>
        
        <br><input type="submit" value="Submeter" name="op" />
        <input type="submit" value="Voltar" name="op" />
        <input type="submit" value="HomeUser" name="op" />
        <input type="submit" value="Sair" name="op" />
        </form>
        </center>
        <%   
        if (request.getParameter("nome") != null ) { 
            if (request.getParameter("op").equals("Submeter")){ 
                
                if(request.getParameter("dob") != ""){
                String dob = request.getParameter("dob");
                SimpleDateFormat formato = new SimpleDateFormat ("yyyy-MM-dd");
                java.util.Date ddn = formato.parse(dob);
                java.sql.Date data_nasc = new java.sql.Date(ddn.getTime());
                registoUtenteInfo.setDataNasc(data_nasc);
                }
                else {
                        %>    
                            <script> alert("Insira data de nascimento");</script> 
                        <%
                    }

                if(request.getParameter("sexo") != null) {
                    if(request.getParameter("sexo").equals("masculino")) {
                        registoUtenteInfo.setSexo(true);
                    }
                    else {
                        registoUtenteInfo.setSexo(false);
                    }
                }
                
                java.util.Date data_registo = new java.util.Date();
                java.sql.Date data_reg_ut = new java.sql.Date(data_registo.getTime());
                registoUtenteInfo.setDataRegistoUtente(data_reg_ut);
                 
                registoUtenteInfo.setUsername(sessaoUser.getUsername());
                    

                if (registoUtenteInfo.setDBRecord() == true ){
                %>    
                     <script> alert("Registo criado");</script> 
                <%      
                }
                 else {  
                %>
                     <script> alert("Registo nao foi criado! Contacte administrador");</script> 
                <%
                }              
            }
            if (request.getParameter("op").equals("Voltar")){
                response.sendRedirect("gestaoUtente.jsp");
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
