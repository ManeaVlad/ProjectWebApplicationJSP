<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <title>Modificari Tabela</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Normalize.css -->
        <link rel="stylesheet" type="text/css" href="normalize.css">
        <!-- Style -->
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <!-- Icon -->
        <link rel="icon" href="rezistorlink.png" type="image/gif" sizes="16x16">
        <!-- Bootstrap
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">-->
        <!--Chestii-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body onload="startTime()">
        <header>
        <img src="itibiti.jpg" alt="O prostie!" height="250" width="100%">
        </header>
        <div id="container">
        <nav>
            <a href="tabela_Products.jsp" class="button">Products</a>
            <a href="tabela_Components.jsp" class="button">Components</a>
            <a href="tabela_Assemblyline.jsp" class="button">Assemblyline</a>
            <div class="dropdown">
            <button class="drop">Change Products Table <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                <a href="modifica_Products.jsp" class="button">Modify Products Table</a>
                <a href="nou_Products.jsp" class="button">Add Products Table</a>
                <a href="tabela_Products.jsp" class="button">Delete Products Table</a>
                </div>
            </div>
            <div class="dropdown">
            <button class="drop">Change Components Table <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                <a href="modifica_Components.jsp" class="button">Modify Components Table</a>
                <a href="nou_Components.jsp" class="button">Add Components Table</a>
                <a href="tabela_Components.jsp" class="button">Delete Components Table</a>
                </div>
            </div>
            <div class="dropdown">
            <button class="drop">Change Assemblyline Table <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                <a href="modifica_Assemblyline.jsp" class="button">Modify Assemblyline Table</a>
                <a href="nou_Assemblyline.jsp" class="button">Add Assemblyline Table</a>
                <a href="tabela_Assemblyline.jsp" class="button">Delete Assemblyline Table</a>
                </div>
            </div>
            </nav>
            <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idComponents"));
            String Name = request.getParameter("Name");
            String Model = request.getParameter("Model");
            String Manufacturer = request.getParameter("Manufacturer");
            String CostsS = request.getParameter("Costs");
            String Parameters = request.getParameter("Parameters");
            String[] valori = {Name, Model, Manufacturer, CostsS, Parameters};
            String[] campuri = {"Name", "Model", "Manufacturer","Costs","Parameters"};
            jb.modificaTabela("Components", "idComponents", aux, campuri, valori);
            jb.disconnect();
        %>
            <br><br><br><br><br>
            <h1 class="title">Modificarile au fost efectuate cu succes!</h1>
            <br><br><br><br><br>
            <a href="index.html" class="button" id="home">HOME</a>
            <div id="footer">
                <div id="txt"></div>
                <p>&copy;Manea Vlad</p>
            </div>
        </div><!--#container-->
        <script>
        function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('txt').innerHTML =
  h + ":" + m + ":" + s;
  var t = setTimeout(startTime, 500);
}
function checkTime(i) {
  if (i < 10) {i = "0" + i};
  return i;
}
        </script>
    </body>
</html>