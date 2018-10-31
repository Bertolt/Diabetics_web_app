<%-- 
    Document   : regjsp
    Created on : 8/dez/2015, 19:23:55
    Author     : Ruben
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        
        <jsp:directive.page import="registoUser.registoUserBean"/>
	<jsp:useBean id="registoUserInfo" scope="session" class="registoUser.registoUserBean"/>
	<jsp:setProperty name="registoUserInfo" property="*"/>
        
        <script src="./regexp.js" type="text/javascript"></script>
        
    </head>
    <body>
        <form method="post" >
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Introduza Informaçao de Registo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nome</td>
                        <td><input type="text" name="nome" value="" /></td>
                    </tr>
                    <tr>
                        <td>Morada</td>
                        <td><input type="text" name="morada" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" id="kmail" value="" /></td>
                    </tr>
                    <tr>
                        <td>Telefone</td>
                        <td><input type="text" name="telefone" value="" /></td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        
                        <td><input type="submit" name="op" value="submit" onclick="ValidateEmail(); "/></td>
                    </tr>
                    <tr>
                        <td colspan="2">Já está registado?!! <a href="inicio.jsp">Faça o login aqui</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
        <%
            
        if (request.getParameter("nome") != null && request.getParameter("password") != null ) { 
            if (request.getParameter("op").equals("submit")){ 
                java.util.Date data_registo = new java.util.Date();
                SimpleDateFormat formato = new SimpleDateFormat ("yyyy-MM-dd");
                java.sql.Date data_reg = new java.sql.Date(data_registo.getTime());
                registoUserInfo.setDataRegisto(data_reg);
                out.print( "data:" + formato.format(data_reg) + "</h2>");       
                registoUserInfo.setDBRecord(); 
            }
        } 
        %>
    </body>
</html>
