<%-- 
    Document   : inicio
    Created on : 11/dez/2015, 14:30:18
    Author     : Ruben
--%>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Inicio</title>
               
    </head>
    <body>
        <center>
        <h1>Aplicação Gestão Uentes Diabéticos</h1>
        <form action="inicio.jsp" method="POST" enctype="multipart/form-data">
            <table border="1">
                <thead>
                    <tr>
                        <th> Login Utilizador </th>
                        <th> Novo Utilizador</th>
                        <th> Login Admin</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><button type="button" onclick="document.location.href='loginUser.jsp'"> Utilizador! </button> </td>
                        <td><button type="button" onclick="document.location.href='regUser.jsp'"> Novo Registo! </button> </td>
                        <td><button type="button" onclick="document.location.href='loginAdmin.jsp'"> Administrador! </button> </td>
                    </tr>
                </tbody>
            </table>

        </form>
        </center>
    </body>
</html>