$(document).ready(function () {
    $.getJSON("../producto.json", function (data) {
        var htmlzatia='';
        htmlzatia+='<tr class="titulos">';
        htmlzatia+='<td></td>';
        htmlzatia+='<td><h3>TITULO</h3></td>';
        htmlzatia+='<td><h3>CANTIDAD</h3></td>';
        htmlzatia+='<td><h3>PRECIO</h3></td>';
        htmlzatia+='</tr>';
        for (let i in data) {
            htmlzatia+='<tr>';
            htmlzatia+='<td><img src="'+data[i].imagen+'"></td>';
            htmlzatia+='<td>'+data[i].nombre_producto+'</td>';
            htmlzatia+='<td>'+data[i].cantidad+'</td>';
            htmlzatia+='<td>'+data[i].precio_producto*data[i].cantidad+'</td>'
            htmlzatia+="</tr>";
            
        }
        $("#tablaProductos").html(htmlzatia);
    
    });

});
