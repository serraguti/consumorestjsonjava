<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="includes/webhead.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
        <section>
            <main role="main" class="container">
                <div class="starter-template">
                    <h1>Consumo Api CRUD departamentos</h1>
                    <label>Id departamento: </label>
                    <input type="text" id="cajanumero" class="form-control"/>
                    <br/>
                    <label>Nombre: </label>
                    <input type="text" id="cajanombre" class="form-control"/><br/>
                    <label>Localidad: </label>
                    <input type="text" id="cajalocalidad" class="form-control"/><br/>
                    <button type="button" id="botoninsertar" class="btn btn-info">
                        Insertar departamento
                    </button>
                    <button type="button" id="botonmodificar" class="btn btn-success">
                        Modificar departamento
                    </button>
                    <button type="button" id="botoneliminar" class="btn btn-danger">
                        Eliminar departamento
                    </button>
                    <hr/>
                    <table id="tabladepartamentos" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Id departamento</th>
                                <th>Nombre</th>
                                <th>Localidad</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </main><!-- /.container -->         
        </section>
        <jsp:include page="includes/webfooter.jsp"/>
        <script>
            var url = "https://apicruddepartamentosjava.azurewebsites.net/";
            $(document).ready(function(){
                cargarDepartamentos();
                $("#botoninsertar").click(function(){
                    var request = "api/departamentos/post";
                    var num = $("#cajanumero").val();
                    var nom = $("#cajanombre").val();
                    var loc = $("#cajalocalidad").val();
                    //LOS DATOS QUE SEAN NUMERICOS EN EL SERVICIO
                    //DEBEMOS CONVERTIRLOS A NUMERO EN JQUERY
                    var id = parseInt(num);
                    //EL SERVICIO NECESITA UN OBJETO JSON
                    //CON LAS MISMAS PROPIEDADES QUE EL GET
                    //CREAMOS UN NUEVO OBJETO EN JQUERY
                    var departamento = new Object();
                    //LAS PROPIEDADES JSON SON DINAMICAS (INVENTADAS)
                    //DEBEN LLAMARSE IGUAL QUE EL JSON DEL GET
                    departamento.idDepartamento = id;
                    departamento.nombre = nom;
                    departamento.localidad = loc;
                    //CONVERTIMOS EL OBJETO JQUERY A FORMATO JSON
                    var json = JSON.stringify(departamento);
                    //HACEMOS LA LLAMADA
                    //type: POST 
                    //SI ENVIAMOS INFORMACION (json) DEBEMOS ENVIARLA CON 
                    //EL VALOR DEL KEY data
                    //DEBEMOS INDICAR EL TIPO DE FORMATO QUE ESTAMOS ENVIANDO
                    //CON LA KEY contentType
                    $.ajax({
                       url: url + request,
                       type: "POST",
                       data: json, 
                       contentType: "application/json",
                       success: function() {
                          console.log("insertando...");
                          cargarDepartamentos(); 
                       }
                    });
                });
                
                $("#botonmodificar").click(function(){
                    modificarDepartamento();
                });
                
                $("#botoneliminar").click(function(){
                    var id = $("#cajanumero").val();
                    var request = "api/departamentos/delete/" + id;
                    $.ajax({
                       url: url + request,
                       type: "DELETE",
                       success: function(){
                           cargarDepartamentos();
                       }
                    });
                });
            });
            
            function modificarDepartamento(){
                var request = "api/departamentos/put";
                var num = $("#cajanumero").val();
                var nom = $("#cajanombre").val();
                var loc = $("#cajalocalidad").val();
                var id = parseInt(num);
                var departamento = new Object();
                departamento.idDepartamento = id;
                departamento.nombre = nom;
                departamento.localidad = loc;
                var datosjson = JSON.stringify(departamento);
                console.log(datosjson);
                $.ajax({
                   url: url + request,
                   type: "PUT", 
                   data: datosjson, 
                   contentType: "application/json",
                   success: function() {
                       console.log("modificando...");
                       cargarDepartamentos();
                   }
                });
            }
            
            function cargarDepartamentos(){
                console.log("Mostrando...");
                var request = "api/departamentos";
                $.ajax({
                   url: url + request,
                   type: "GET",
                   dataType: "json",
                   success: function(data){
                       var html = "";
                       $.each(data, function(posicion, dept){
                           html += "<tr>";
                           html += "<td>" + dept.idDepartamento + "</td>";
                           html += "<td>" + dept.nombre + "</td>";
                           html += "<td>" + dept.localidad + "</td>";
                           html += "</tr>";
                       });
                       $("#tabladepartamentos tbody").html(html);
                   }
                });
            }
        </script>
    </body>
</html>
