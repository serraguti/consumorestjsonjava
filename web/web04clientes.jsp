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
                    <h1>Búsqueda clientes JSON</h1>
                    <label>Seleccione un cliente: </label>
                    <select id="selectcliente" class="form-control"></select>
                    <div id="datoscliente"></div>
<iframe width="560" height="315" 
        src="https://www.youtube.com/embed/kPFlUSdse9g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                    
                </div>
            </main><!-- /.container -->            
        </section>
        <jsp:include page="includes/webfooter.jsp"/>
        <script>
            $(document).ready(function(){
                cargarClientes();
                $("#selectcliente").change(function(){
                    $.ajax({
                        url: "documents/clientes.json",
                        type: "GET",
                        success: function(data){
                            //SI TENEMOS EL DIBUJO EN JQUERY CON INDICES
                            //EN ALGUN CONTROL, PODEMOS UTILIZARLOS PARA ENCONTRAR
                            //EL ELEMENTO DESEADO EN EL ARRAY DE data.clientes[]
                            //RECUPERAMOS UNA PROPIEDAD QUE NO TIENE VALOR
                            //COMO, REQUIRED, SELECTED
                            //<input type="text" required/>
                            //.prop("propiedad")
                            var indice = $("#selectcliente").prop("selectedIndex");
                            var cliente = data.clientes[indice];
                            var html = "";
                            html += "<h1 style='color:blue'>" + cliente.nombre + "</h1>";
                            html += "<a href='" + cliente.paginaweb + "'>"
                            + cliente.paginaweb + "</a>";
                            html += "<img src='" + cliente.imagencliente + "' "
                            + " style='width:250px;height:250px;'/>";
                            $("#datoscliente").html(html);
                        }
                    });
                });
            });
            
            function cargarClientes(){
                $.ajax({
                   url: "documents/clientes.json",
                   type: "GET",
                   success: function(data){
                       var html = "";
                       $.each(data.clientes, function(posicion, cliente){
                          html += "<option value='" + cliente.idcliente + "'>" 
                          + cliente.nombre + "</option>";
                       });
                       $("#selectcliente").html(html);
                   }
                });
            }
        </script>
    </body>
</html>
