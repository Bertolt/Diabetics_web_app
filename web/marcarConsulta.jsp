<%-- 
    Document   : marcarConsulta
    Created on : 5/jan/2016, 23:22:38
    Author     : Ruben
String str = request.getParameter("utentenumber");
                    System.out.println(str);
                    int utentenumber2 = Integer.parseInt(str);
                    System.out.println(utentenumber2);
                    sessaoUtente.setUtenteNumber(utentenumber2);
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcacao de Consulta</title>
        
        <jsp:directive.page import="loginUser.loginUserBean"/>
	<jsp:useBean id="sessaoUser" scope="session" class="loginUser.loginUserBean"/>
        <% if (sessaoUser.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUtente.registoUtenteBean"/>
        <jsp:useBean id="sessaoUtente" scope="session" class="registoUtente.registoUtenteBean"/>
        <jsp:setProperty name="sessaoUtente" property="*"/>
        <% if (sessaoUtente.getAlta() == 0) response.sendRedirect("consultas.jsp");%>
    </head>
    <body>
        <center>
        <h1>Marcação Consultas!</h1>
        <h2>Utilizador: <jsp:getProperty name="sessaoUser" property="username"/></h2>
        <h2>Utente: <jsp:getProperty name="sessaoUtente" property="nome"/></h2>
        <form method="POST">
            <br><br>
            <input type="date" name="dataproxconsulta">
            <br>  
            <input type="submit" value="Marcar consulta!" name="op" />
            <br>
            <input type="submit" value="Home" name="op" />
            <input type="submit" value="Voltar" name="op" />
            <input type="submit" value="Sair" name="op" /> 
        </form>
        </center>
        <% 
              if ((request.getParameter("op") != null) ) { 
                 
                if (request.getParameter("op").equals("Marcar consulta!")){
                    
                    if(request.getParameter("dataproxconsulta") != ""){
                        String dpc = request.getParameter("dataproxconsulta");
                        SimpleDateFormat formato = new SimpleDateFormat ("yyyy-MM-dd");
                        java.util.Date dnc = formato.parse(dpc);
                        java.sql.Date dataconsulta = new java.sql.Date(dnc.getTime());
                        sessaoUtente.setDataProxConsulta(dataconsulta);
                    }
                    else {
                            %>    
                                <script> alert("Insira data de nascimento");</script> 
                            <%
                        }
                    if (sessaoUtente.marcarConsulta() == true ){
                        %>    
                             <script> alert("Consulta Marcada");</script> 
                        <%
                    }
                     else {  
                            %>
                                 <script> alert("Marcação nao efectuada! Contacte administrador");</script> 
                            <%
                        }
                }
                 if (request.getParameter("op").equals("Home")){
                    sessaoUtente.reset();
                    response.sendRedirect("homeUser.jsp");
                }
                    if (request.getParameter("op").equals("Voltar")){ 
                    response.sendRedirect("consultas2.jsp");
                }
                if (request.getParameter("op").equals("Sair")){ 
                    sessaoUser.reset();
                    response.sendRedirect("inicio.jsp");
                }
            }
         %>
    </body>
</html>
