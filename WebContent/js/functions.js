$(document).ready(function(){
    $.getJSON( "http://localhost:8080/proyecto_final/producto/CJson?id_producto=&nombre_producto=&precio_producto=&descripcion=&stock=&imagen=", function( data ) {
        console.log(data);
    var items = [];
        $.each( data, function( key, val ) {
          items.push( "<li id='" + key + "'>" + val + "</li>" );
        });
       
        $( "<ul/>", {
          "class": "my-new-list",
          html: items.join( "" )
        }).appendTo( "body" );
      });
});