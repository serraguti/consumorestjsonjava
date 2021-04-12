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
                    <h1>Documento JSON Array de objetos</h1>
                    <button type="button" id="botonleerclientes">
                        Leer Array clientes
                    </button>
                    <ul id="clientes"></ul>
                </div>
            </main><!-- /.container -->            
        </section>
        <jsp:include page="includes/webfooter.jsp"/>
        <script>
            $(document).ready(function(){
                $("#botonleerclientes").click(function() {
                    $.ajax({
                       url: "documents/clientessimples.json",
                       "type": "GET", 
                       success: function(data){
                          //SI LEEMOS UN ARRAY [], EL PRIMER VALOR DEL 
                          //$.each ES EL INDICE/POSICION Y EL SEGUNDO VALOR
                          //ES EL OBJETO QUE RECORREMOS, CON TODAS SUS PROPIEDADES
                          //LAS PROPIEDADES SON DINAMICAS, SE ACCEDE A ELLAS DIRECTAMENTE
                          //ESCRIBIENDO SU VALOR
                          var html = "";
                          $.each(data.clientes, function(posicion, cliente){
                              html += "<li>Posicion: " + posicion 
                              + ", Cliente: " + cliente.nombre + "</li>";
                          });
                          $("#clientes").html(html);
                       }
                    });
                });
            });
        </script>
    </body>
</html>
