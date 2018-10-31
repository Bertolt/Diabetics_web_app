<%-- 
    Document   : resultadoAnamnese
    Created on : 8/jan/2016, 21:52:44
    Author     : Ruben
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>resultadoAnamnese</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="pesquisaUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="pesquisaUtente" property="*"/>
        
        <%@ page import="java.util.Vector"%>
    </head>
    <body>
        <center>
        <h1>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h1>
        <h3>Anamnese</h3>
   
        <% Vector records = pesquisaUtente.getDBRecords();
        for (int i = 0; i <records.size(); i++) {
        registoUtenteBean utentebean = (registoUtenteBean)records.elementAt(i);
        %>
        <form method="GET">
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th></th>
                        <th colspan="2"> Resultados da pesquisa</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> Nome: </td>
                        <td><input type="text" name="nome" disabled="disabled" value="<jsp:scriptlet> out.write(utentebean.getNome());</jsp:scriptlet>"> </td>
                    </tr>
                    <tr>
                        <td> Numero Utente</td>
                        
                        <td> <input required type="text" name="utentenumber" disabled="disabled" value="<jsp:scriptlet> out.print(utentebean.getUtenteNumber());</jsp:scriptlet>"></td>
                    </tr>
                    <tr>
                        <td> Data de Nascimento</td>
                        
                        <td><input type="text" name="datanasc" disabled="disabled" value="<jsp:scriptlet> out.print(utentebean.getDataNasc());</jsp:scriptlet>"></td>
                    </tr>
                    <tr>
                        <td>Morada: </td>
                        <td><input type="text" name="morada" disabled="disabled" value="<jsp:scriptlet> out.write(utentebean.getMorada());</jsp:scriptlet>"></td>
                    </tr>
                    <tr>
                        <td>Telefone</td>
                        <td><input type="text" name="telefone" disabled="disabled" value="<jsp:scriptlet> out.write(utentebean.getTelefone());</jsp:scriptlet>"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" disabled="disabled" value="<jsp:scriptlet> out.write(utentebean.getEmail());</jsp:scriptlet>"></td>
                    </tr>
                    
                    
                </tbody>
        
        </table>
        </form>
            <% } %>        
        </center>
    </body>
</html>
