<%-- 
    Document   : adicionarAdmin
    Created on : 9/jan/2016, 19:26:08
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adicionarAdmin</title>
        
        <jsp:directive.page import="loginUser.loginUserAdminBean"/>
	<jsp:useBean id="sessaoAdmin" scope="session" class="loginUser.loginUserAdminBean"/>
        <% if (sessaoAdmin.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUser.registoUserBean"/>
        <jsp:useBean id="addAdmin" scope="page" class="registoUser.registoUserBean"/>
        <jsp:setProperty name="addAdmin" property="*"/>
    </head>
    <body>
        <center>
        <h1>Adicionar Utilizador como administrador!</h1>
        <form method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th>Introduza numero e Utilizador</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="number" name="usernumber" value="" /></td>
                        <td><input type="submit" value="Submeter" name="op" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <br>
        <form method="POST">
        <input type="submit" value="Voltar" name="op" />
        <input type="submit" value="Sair" name="op" />
        <br>
    </center>
    <%
            if ((request.getParameter("op") != null) ) {
                if (request.getParameter("op").equals("Submeter")){        
                    if ((request.getParameter("usernumber") != null) ) { 
                         String str = request.getParameter("usernumber");
                         System.out.println(str);
                         int utentenumber2 = Integer.parseInt(str);
                         System.out.println(utentenumber2);
                         addAdmin.setUsernumber(utentenumber2);
                        if (addAdmin.adicionarAdmin() == true ){  
                                %>
                                <script> window.confirm("Administrador adicionado");</script> 
                                <%
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
                    response.sendRedirect("homeAdmin.jsp");
                }

                if (request.getParameter("op").equals("Sair")){
                    response.sendRedirect("inicio.jsp");
                }
            }
        %>
    </body>
</html>
