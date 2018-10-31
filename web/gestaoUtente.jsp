<%-- 
    Document   : gestaoUtente
    Created on : 22/dez/2015, 21:09:35
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestao Utente</title>
        
        <link href="styles.css" rel="stylesheet" type="text/css" />
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
    </head>
    <body>
        <center>
        <h1>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h1>
        <form method="POST">
            <input type="submit" value="Pesquisar utente" name="op" /> 
            <input type="submit" value="Novo Registo Utente" name="op" /> 
            <input type="submit" value="Editar Dados Utente" name="op" /> 
            <input type="submit" value="Alta" name="op" />
            <input type="submit" value="Readmissao" name="op" />
            <input type="submit" value="Home" name="op" />
            <input type="submit" value="Sair" name="op" /> 
        </form>
        </center>  
         <% 
              if ((request.getParameter("op") != null) ) { 
                 if (request.getParameter("op").equals("Pesquisar utente")){ 
                  response.sendRedirect("pesquisarUtente.jsp");
        
                }
                 if (request.getParameter("op").equals("Novo Registo Utente")){ 
                    response.sendRedirect("regNovoUtente.jsp");
                }
                 if (request.getParameter("op").equals("Editar Dados Utente")){ 
                    response.sendRedirect("editarDadosUtente.jsp");
                }
                if (request.getParameter("op").equals("Alta")){ 
                    response.sendRedirect("alta.jsp");
                }
                if (request.getParameter("op").equals("Readmissao")){ 
                    response.sendRedirect("readmissao.jsp");
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
