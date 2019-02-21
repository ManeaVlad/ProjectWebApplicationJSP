<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Add Assemblyline</title>
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
        <%
            jb.connect();
            String ProductName, ProductCode, Date, ComponentName, ModelType, ManufacturerName, ComponentParameters;
            int ProductPrice, ComponentCost,ResultValidation;
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceAssemblylineId(aux);
            rs.first();
            int id1 = rs.getInt("idProducts_made");
            int id2 = rs.getInt("idComponents_used");

            ProductName = rs.getString("ProductName");
            ProductCode = rs.getString("ProductCode");
            Date = rs.getString("Date");
            ProductPrice = rs.getInt("ProductPrice");
            ComponentName = rs.getString("ComponentName");
            ModelType = rs.getString("ModelType");
            ManufacturerName = rs.getString("ManufacturerName");
            ComponentCost = rs.getInt("ComponentCost");
            ComponentParameters = rs.getString("ComponentParameters");
            ResultValidation = rs.getInt("ResultValidation");

            ResultSet rs1 = jb.vedeTabela("Products");
            ResultSet rs2 = jb.vedeTabela("Components");
            int idProducts, idComponents;


        %>
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
            <br>
            <form action="m2_Assemblyline.jsp" method="post">
            <label>IdAssemblyLine:</label>
                <input type="number" name="idAssemblyline" placeholder="" value="<%= aux%>" readonly>
            <label>Select Product:</label>
                <SELECT NAME="idProducts">
                            <%
                                while (rs1.next()) {
                                    idProducts = rs1.getInt("idProducts");
                                    ProductName = rs1.getString("Name");
                                    ProductCode = rs1.getString("Code");
                                    Date = rs1.getString("Date");
                                    ProductPrice = rs1.getInt("Price");
                                    if (idProducts != id1) {
                            %>
                            <OPTION VALUE="<%= idProducts%>"><%= idProducts%>, <%= ProductName%>, <%= ProductCode%>, <%= Date%>, <%= ProductPrice%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idProducts%>"><%= idProducts%>, <%= ProductName%>, <%= ProductCode%>, <%= Date%>, <%= ProductPrice%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>
            <label>Select Component:</label>
                <SELECT NAME="idComponents">
                            <%
                                while (rs2.next()) {
                                    idComponents = rs2.getInt("idComponents");
                                    ComponentName = rs2.getString("Name");
                                    ModelType = rs2.getString("Model");
                                    ManufacturerName = rs2.getString("Manufacturer");
                                    ComponentCost = rs2.getInt("Costs");
                                    ComponentParameters = rs2.getString("Parameters");
                            if (idComponents != id2) {
                            %>
                            <OPTION VALUE="<%= idComponents%>"><%= idComponents%>, <%= ComponentName%>, <%= ModelType%>, <%= ManufacturerName%>, <%= ComponentCost%>, <%= ComponentParameters%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idComponents%>"><%= idComponents%>, <%= ComponentName%>, <%= ModelType%>, <%= ManufacturerName%>, <%= ComponentCost%>, <%= ComponentParameters%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>
            <label>Validation:</label>
                <input type="number" name="Validation" placeholder="" value="<%= ResultValidation%>">
            <input type="submit" value="Submit">
            </form>
        <br>
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
        <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>                        
</html>
