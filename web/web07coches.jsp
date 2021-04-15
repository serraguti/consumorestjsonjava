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
                    <h1>Consumo Api Coches Json</h1>
                    <select id="selectcoches" class="form-control"></select>
                    <div id="detallescoche"></div>
                </div>
            </main><!-- /.container -->            
        </section>
        <jsp:include page="includes/webfooter.jsp"/>
        <script>
            var url = "https://apicochesjavapgs.azurewebsites.net/";
            $(document).ready(function() {
                cargarCoches();
                $("#selectcoches").change(function(){
                   var idcoche = $("#selectcoches").val();
                   var request = "api/coches/" + idcoche;
                   $.ajax({
                       url: url + request,
                       type: "GET",
                       dataType: "json", 
                       success: function(data){
                           var html = "<h1 style='color:blue'>Conductor: "
                           + data.conductor + "</h1>";
                           html += "<img src='" + data.imagen + "' "
                           + " style='width:250px; height:250px;'/>";
                           $("#detallescoche").html(html);
                       }
                   });
                });
            });
            
            function cargarCoches(){
                var request = "api/coches";
                $.ajax({
                    url: url + request, 
                    type: "GET",
                    dataType: "json",
                    success: function(data){
                        var html = "";
                        $.each(data, function(posicion, coche){
                           html += "<option value='" + coche.idCoche + "'>" 
                           + coche.marca + " " + coche.modelo + "</option>";
                        });
                        $("#selectcoches").html(html);
                    }
                });
            }
        </script>
    </body>
</html>
