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
                    <h1>Documento objeto Tareas.json</h1>
                    <button type="button" id="botonleertareas">
                        Leer tareas.json simple
                    </button>
                    <ul id="tareas"></ul>
                </div>
            </main><!-- /.container -->            
        </section>
        <jsp:include page="includes/webfooter.jsp"/>
        <script>
            $(document).ready(function(){
                $("#botonleertareas").click(function(){
                    //ESTAMOS LEYENDO UN OBJETO {} SIMPLE
                    //POR LO QUE RECORREMOS TODOS LOS DATOS CON EACH
                    //MEDIANTE CLAVE (KEY) Y VALOR (VALUE).
                    $.getJSON("documents/tareas.json", function(data){
                       var html = "";
                       $.each(data, function(key, value){
                         html += "<li>Key: " + key
                            + ", Value: " + value + "</li>";
                       });
                       $("#tareas").html(html);
                    });
                });
            });
        </script>
    </body>
</html>
