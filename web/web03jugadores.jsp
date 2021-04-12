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
                    <h1>Lectura jugadores JSON</h1>
                    <button type="button" id="botonleerjugadores">
                        Leer jugadores
                    </button>
                    <table id="tabla" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Jugador</th>
                                <th>Posición</th>
                                <th>Edad</th>
                                <th>Imagen</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </main><!-- /.container -->            
        </section>
        <jsp:include page="includes/webfooter.jsp"/>
        <script>
            $(document).ready(function(){
               $("#botonleerjugadores").click(function(){
                  $.ajax({
                     url: "documents/jugadores.json",
                     type: "GET",
                     success: function(data){
                         var html = "";
                         $.each(data.jugadores, function(posicion, jugador){
                            html += "<tr>";
                            html += "<td>" + jugador.nombre + "</td>";
                            html += "<td>" + jugador.posicion + "</td>";
                            html += "<td>Edad: " + jugador.edad + "</td>";
                            html += "<td>";
                            html += "<img src='" + jugador.imagen 
                                    + "' style='width:150px;height:150px'/>";
                            html += "</td>";
                            html += "</tr>";
                         });
                         $("#tabla tbody").html(html);
                     }
                  });
               });
            });
        </script>
    </body>
</html>
