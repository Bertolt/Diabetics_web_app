<%-- 
    Document   : alta
    Created on : 5/jan/2016, 23:19:40
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.lang.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="altaUtente" scope="page" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="altaUtente" property="*"/>
    </head>
    <body>
        <center>
        <h1>Alta</h1>   
        <h2>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h2>
        <br>
        
        
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
                        <td><input type="submit" value="Dar Alta!" name="op" /></td>
                        
                    </tr>
                </tbody>
            </table> 
        <br><br><input type="submit" value="Voltar" name="op" />
        <input type="submit" value="Home" name="op" />
        <input type="submit" value="Sair" name="op" />
        </form>
        </center>
        <% 
              if ((request.getParameter("op") != null) ) { 
                 
                 if (request.getParameter("op").equals("Dar Alta!")){ 
                    String str = request.getParameter("utentenumber");
                    System.out.println(str);
                    int utentenumber2 = Integer.parseInt(str);
                    System.out.println(utentenumber2);
                    altaUtente.setUtenteNumber(utentenumber2);
                    
                    if (altaUtente.darAlta() == true ){
                        %>    
                             <script> alert("Alta Efectuada");</script> 
                        <%
                            
                    }
                     else {  
                            %>
                                 <script> alert("Alta não efectuada! Contacte administrador");</script> 
                            <%
                        }
                }
                if (request.getParameter("op").equals("Voltar")){
                    response.sendRedirect("gestaoUtente.jsp");
                }
                   if (request.getParameter("op").equals("Home")){
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
