$(document).ready(function () {
    carrito = JSON.parse(localStorage.getItem('carrito')) || [];
    $.getJSON("../producto.json", function (data) {
        var htmlzatia='';
        if (carrito.length>0){
        htmlzatia+='<tr class="titulos">';
        htmlzatia+='<td></td>';
        htmlzatia+='<td><h3>TITULO</h3></td>';
        htmlzatia+='<td><h3>CANTIDAD</h3></td>';
        htmlzatia+='<td><h3>PRECIO</h3></td>';
        htmlzatia+='</tr>';
        for (let i in carrito) {
            htmlzatia+='<tr>';
            htmlzatia+='<td><img src="'+carrito[i].imagen+'"></td>';
            htmlzatia+='<td>'+carrito[i].nombre+'</td>';
            htmlzatia+='<td>'+carrito[i].cantidad+'</td>';
            htmlzatia+='<td>'+carrito[i].precio*carrito[i].cantidad+'</td>'
            htmlzatia+="</tr>";
            
        }
        $("#tablaProductos").html(htmlzatia);
        $(".boton").html('<button type="button" id=siguiente class="btn btn-danger">Siguiente</button>')
        }
        else {
        htmlzatia+='<h1 class="titulo">No se ha encontrado ningun producto en la cesta</h1>';
        htmlzatia+='<h3 class="subtitulo">vuelva al inicio clickando <a href="index.html">aquí</a> y añada productos para poder visualizarlos en el carro</h3>';
        htmlzatia+='<img src="/imagenes/emptycart.png">';
        $(".container").html(htmlzatia);
        }
    });
});
