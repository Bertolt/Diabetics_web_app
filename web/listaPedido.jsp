<%-- 
    Document   : listaPedido
    Created on : 9/jan/2016, 16:41:05
    Author     : Ruben
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.*,java.text.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>listaPedido</title>
        
        <jsp:directive.page import="loginUser.loginUserAdminBean"/>
	<jsp:useBean id="sessaoAdmin" scope="session" class="loginUser.loginUserAdminBean"/>
        <% if (sessaoAdmin.getNivel() == -1) response.sendRedirect("inicio.jsp");%>
        
        <jsp:directive.page import="registoUser.registoUserBean"/>
        <jsp:useBean id="pedidoUser" scope="session" class="registoUser.registoUserBean"/>
        <jsp:setProperty name="pedidoUser" property="*"/>
        
        <%@ page import="java.util.Vector"%>
    </head>
    <body>
        <center>
        <h1>Utilizador: <jsp:getProperty name="sessaoAdmin" property="username"/></h1>
        <h3>Pedidos de Utilador</h3>
        <br>
        <form method="POST">
        <input type="submit" value="Voltar" name="op" />
        <input type="submit" value="Sair" name="op" />
        <br>
        
        <% Vector records = pedidoUser.getDBRecords();
        for (int i = 0; i <records.size(); i++) {
        registoUserBean utilizadorbean = (registoUserBean)records.elementAt(i);
        %>
        <form method="GET">
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th></th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> Nome: </td>
                        <td><input type="text" name="nome" disabled="disabled" value="<jsp:scriptlet> out.write(utilizadorbean.getNome());</jsp:scriptlet>"> </td>
                    </tr>
                    <tr>
                        <td> Numero Utilizador</td>
                        
                        <td> <input type="text" name="usernumber"  value="<jsp:scriptlet> out.print(utilizadorbean.getUsernumber());</jsp:scriptlet>"></td>
                    </tr>
                    <tr>
                        <td> Data de Registo</td>
                        
                        <td><input type="text" name="datanasc" disabled="disabled" value="<jsp:scriptlet> out.print(utilizadorbean.getDataRegisto());</jsp:scriptlet>"></td>
                    </tr>
                    <tr>
                        <td>Morada: </td>
                        <td><input type="text" name="morada" disabled="disabled" value="<jsp:scriptlet> out.write(utilizadorbean.getMorada());</jsp:scriptlet>"></td>
                    </tr>
                    <tr>
                        <td>Telefone</td>
                        <td><input type="text" name="telefone" disabled="disabled" value="<jsp:scriptlet> out.write(utilizadorbean.getTelefone());</jsp:scriptlet>"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" disabled="disabled" value="<jsp:scriptlet> out.write(utilizadorbean.getEmail());</jsp:scriptlet>"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit"  value="Adicionar" name="op"></td>
                    </tr>
                    
                </tbody>
        
        </table>
        </form>
                    <% 
                        if ((request.getParameter("op") != null) ) { 

                           if (request.getParameter("op").equals("Adicionar")){ 
                              String str = request.getParameter("usernumber");
                              //System.out.println(str);
                              int usernumber2 = Integer.parseInt(str);
                              System.out.println(usernumber2);
                              pedidoUser.setUsernumber(usernumber2);

                              if (pedidoUser.adicionarUser() == true ){
                                  %>    
                                       <script> window.confirm("Adicionado");</script> 
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
                      }
                   %>
            <% } %>        
        </center>
        <%  
            if ((request.getParameter("op") != null) ) {      
                
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
