$(document).ready(function () {
		$.getJSON( "http://localhost:8080/proyecto_final/ApiProductos?idProducto=&nombre_producto=&precio_producto=&descripcion=&stock=&imagen=", function( data ) {
			console.log(data);
			var html = '';

			for (i in data){
				html += '<div class="col-md-4">';
				html += '<div class="card mb-4 shadow-sm">';
				html += '<img src="'+data[i].imagen+'">';
				html += '<div class="card-body">';
				html += '<h5>'+data[i].nombre_producto+'</h5>';
				html += '<div class="paragraph">'
				html += '<p class="card-text">'+data[i].descripcion+'</p>';
				html += '</div>'
				html += '<div class="d-flex justify-content-between align-items-center">';
				html += '<div class="btn-group">';
				html += '<button type="button" class="btn btn-success modalButton" data-toggle="modal" data-target="#productoModal" data-id="'+data[i].idProducto+'">Ver mas</button>';
        html += '</div>';
				html += '<small class="text-muted">'+data[i].precio_producto+"€"+'</small>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
			}
        $('.row').html(html);
        
        $('.modalButton').on("click", function(){
          var id=$(this).data("id");
          console.log(id);
          $("#productoModal .modal-title").text("Datuak kargatzen");
          $("#productoModal .modal-body").html('<div class="spinner-border text-danger" role="status"></div>');
          $('#productoModal').modal('show');
      });
		});
});