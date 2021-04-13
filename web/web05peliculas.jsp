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
                    <h1>Películas JSON Local</h1>
                    <label>Título de película: </label>
                    <input type="text" id="cajatitulo" class="form-control"/>
                    <button type="button" id="botonbuscar" class="btn btn-info">
                        Buscar películas
                    </button>
                    <ul class="list-group" id="peliculas"></ul>
                    <select id="selectpelis" class="form-control">
                    </select>
                    <div id="datopeli"></div>
                </div>
            </main><!-- /.container -->            
        </section>
        <jsp:include page="includes/webfooter.jsp"/>
        <script>
            $(document).ready(function(){
                cargarPeliculas();
                $("#selectpelis").change(function(){
                   $.ajax({
                      url: "documents/cine.json",
                      "type": "GET",
                      success: function(data){
                          var indice = $("#selectpelis").prop("selectedIndex");
                          var peli = data.PELICULAS[indice];
                          var html = "<h1 style='color:blue'>" + peli.Titulo + "</h1>";
                          html += "<h2 style='color:red'>Director " + peli.Director + "</h2>";
                          html += "<h2 style='color:orange'>Género: " + peli.Genero + "</h2>";
                          html += "<iframe width='560' height='315' src='https://www.youtube.com/embed/" + peli.YouTube + "'title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
                          $("#datopeli").html(html);
                      }
                   });
                });
                
                $("#botonbuscar").click(function() {
                   $.ajax({
                      url: "documents/cine.json",
                      type: "GET",
                      success: function(data) {
                          var titulo = $("#cajatitulo").val();
                          var html = "";
                          $.each(data.PELICULAS, function(posicion, peli){
                             var title = peli.Titulo.toString();
                             if (title.includes(titulo)){
                                 html += "<li style='list-group-item'>"
                                 + peli.Titulo + "</li>";
                             }
                          });
                          $("#peliculas").html(html);
                      }
                   });
                });
            });
            
            function cargarPeliculas(){
                $.ajax({
                    url: "documents/cine.json",
                    type: "GET",
                    success: function(data){
                        var html = "";
                        $.each(data.PELICULAS, function(posicion, peli){
                           html += "<option value='" + peli.Titulo + "'>"
                           + peli.Titulo + "</option>";
                        });
                        $("#selectpelis").html(html);
                    }
                });
            }
        </script>
    </body>
</html>
