<%-- 
    Document   : consultas
    Created on : 22/dez/2015, 21:10:06
    Author     : Ruben

<jsp:setProperty name="sessaoUtente" property="*"/>
if (sessaoUtente.verificaNumeroUtente() == true ){%>  
                    <%@ include file="consultas2.jsp"%>
                <%}
                 else{  %>
                     <script> alert("Utente nao encontrado");</script> 
            <%    }

<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.lang.*"%>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.lang.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>consultas</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="sessaoUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="sessaoUtente" property="*"/>
        
        
    </head>
    <body>
        <center>
        <h1>Utilizador <jsp:getProperty name="sessaoUser" property="username"/></h1>
        <h1>consultas</h1>
        <form method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th>Introduza numero Utente</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" name="utentenumber" value="" /></td>
                        <td><input type="submit" value="Submeter" name="op" /></td>
                    </tr>
                </tbody>
            </table>
        <br><br>
        <input type="submit" value="Home" name="op" />
        <input type="submit" value="Sair" name="op" />
        </form>
        </center>
        <%
            if ((request.getParameter("op") != null) ) {
                if (request.getParameter("op").equals("Submeter")){        
                    if ((request.getParameter("utentenumber") != null) ) { 
                         String str = request.getParameter("utentenumber");
                         System.out.println(str);
                         int utentenumber2 = Integer.parseInt(str);
                         System.out.println(utentenumber2);
                         sessaoUtente.setUtenteNumber(utentenumber2);
                        if (sessaoUtente.verificaNumeroUtente() == true ){  
                                response.sendRedirect("consultas2.jsp");
                            }else{
                                        %>
                                             <script> alert("Utente nao encontrado");</script> 
                                        <%
                           }
                    }else{
                                        %>
                                             <script> alert("Introduza numero Utente");</script> 
                                        <%
                           }
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
