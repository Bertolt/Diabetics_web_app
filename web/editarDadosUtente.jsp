<%-- 
    Document   : editarDadosUtente
    Created on : 7/jan/2016, 19:16:43
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Dados Utente</title>
        
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
        </form>
        <br>
        <form method="POST">
        <input type="submit" value="Voltar" name="op" />
        <input type="submit" value="Home" name="op" />
        <input type="submit" value="Sair" name="op" />
        <br>
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
                                response.sendRedirect("editarDadosUtente2.jsp");
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
