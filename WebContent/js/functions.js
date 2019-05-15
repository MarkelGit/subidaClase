$(document).ready(function () {
	$.getJSON("http://localhost:8080/proyecto_final/ApiProductos", function (data) {
		console.log(data);
		var html = '';

		for (let i = 0; i < 6; i++) {
			html += '<div class="col-md-4 col-sm-12">';
			html += '<div class="card mb-4 card-sm-12 shadow-sm">';
			html += '<img src="' + data[i].imagen + '">';
			html += '<div class="card-body">';
			html += '<div class="title">'
			html += '<h5>' + data[i].nombre_producto + '</h5>';
			html += '</div>'
			html += '<div class="paragraph">'
			html += '<p class="card-text">' + data[i].descripcion + '</p>';
			html += '</div>'
			html += '<div class="d-flex justify-content-between align-items-center">';
			html += '<div class="btn-group">';
			html += '<button type="button" class="btn btn-danger modalButton" data-toggle="modal" data-target="#productoModal" data-id="' + data[i].idProducto + '">Ver mas</button>';
			html += '</div>';
			html += '<small class="text-muted">' + data[i].precio_producto + "€" + '</small>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
		}
		$('.row').html(html);

		$('.modalButton').on("click", function () {
			var id = $(this).data("id");
			console.log(id);
			//llamada a /apiProducto?id=

			$("#productoModal .modal-title").text("Datuak kargatzen");
			$("#productoModal .modal-body").html('<div class="spinner-border text-danger" role="status"></div>');
			$('#productoModal').modal('show');

			$.getJSON("http://localhost:8080/proyecto_final/ApiProductos?idProducto="+id, function (dataPro) {
				console.log(dataPro);
			
				htmltitulo= '';
				htmlbody = '';

				var title = dataPro[0].nombre_producto;
				var src =  dataPro[0].imagen;
				var descripcion = dataPro[0].descripcion;
				var precio = dataPro[0].precio_producto;

				htmltitulo += '<h2>'+title+'</h2>';
				htmlbody += '<div class="imagen">';
				htmlbody += '<img style="float:left; margin:10px;" src="'+src+'">';
				htmlbody += '</div>';
				htmlbody += '<div class="descripcion">';
				htmlbody += '<p>'+descripcion+'</p>';
				htmlbody += '</div>';
				htmlbody += '<div class="precio">';
				htmlbody += '<h3>'+precio+ "€" +'</h3>';
				htmlbody += '</div>';
				
				$('#productoModal .modal-title').html(htmltitulo);
				$('#productoModal .modal-body').html(htmlbody);
				$('#productoModal').modal('show');
			});
		});
	});

	getCategorias();
});

var htmlzatia = '';
function getCategorias() {
	$.getJSON("http://localhost:8080/proyecto_final/ApiCategorias", function (dataCat) {
		console.log(dataCat);
		$.getJSON("http://localhost:8080/proyecto_final/ApiSubcategorias", function (dataSub) {
			htmlzatia='<ul class="navbar-nav mr-auto">';
			console.log(dataSub);
			for (i in dataCat) {
				var linea = '<li class="nav-item"><a class="nav-link" href="#">' + dataCat[i].nombre_categoria + '</a></li>';
				var dropdown = 0;
				for (y in dataSub) {
					if (dropdown == 0 && dataSub[y].idCategoria == dataCat[i].idCategoria) {
						dropdown = 1;
						linea = '<li class="nav-item dropdown"><a ';
						linea += 'class="nav-link dropdown-toggle" href="#" id="navbarDropdown"';
						linea += 'role="button" data-toggle="dropdown" aria-haspopup="true"';
						linea += 'aria-expanded="false"> ' + dataCat[i].nombre_categoria + ' </a>';
						linea += '<div class="dropdown-menu" aria-labelledby="navbarDropdown">';
						linea += '<a class="dropdown-item" href="#" data-id="'+dataSub[y].idSubcategoria+'">' + dataSub[y].nombre_categoria + '</a> ';
					}
					else if (dropdown == 1 && dataSub[y].idCategoria == dataCat[i].idCategoria) {
						linea += '<a class="dropdown-item" href="#" data-id="'+dataSub[y].idSubcategoria+'">' + dataSub[y].nombre_categoria + '</a>';
					}
				}
				console.log(dropdown);
				if (dropdown == 1) {
					linea += '</div></li>';
				}
				
				htmlzatia += linea;
			}
			htmlzatia += '<form class="form-inline my-2 my-lg-0"></ul> <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Carrito</button></form>';
			$('#navbarToggleExternalContent').html(htmlzatia);
			$('.dropdown-item').on("click", function() {
				var id=$(this).data("id");
				getProductosById(id);
			});
		});
		
	});
	
}

function getProductosById(id) {
	$.getJSON("http://localhost:8080/proyecto_final/ApiProductos?idSubcategoria="+id, function (data) {
		console.log(data);
		var html = '';

		for (i in data) {
			html += '<div class="col-md-4">';
			html += '<div class="card mb-4 shadow-sm">';
			html += '<img src="' + data[i].imagen + '">';
			html += '<div class="card-body">';
			html += '<h5>' + data[i].nombre_producto + '</h5>';
			html += '<div class="paragraph">'
			html += '<p class="card-text">' + data[i].descripcion + '</p>';
			html += '</div>'
			html += '<div class="d-flex justify-content-between align-items-center">';
			html += '<div class="btn-group">';
			html += '<button type="button" class="btn btn-success modalButton" data-toggle="modal" data-target="#productoModal" data-id="' + data[i].idProducto + '">Ver mas</button>';
			html += '</div>';
			html += '<small class="text-muted">' + data[i].precio_producto + "€" + '</small>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
		}
		
		$('.row').html(html);

		$('.modalButton').on("click", function () {
			var id = $(this).data("id");
			console.log(id);
			//llamada a /apiProducto?id=

			$("#productoModal .modal-title").text("Datuak kargatzen");
			$("#productoModal .modal-body").html('<div class="spinner-border text-danger" role="status"></div>');
			$('#productoModal').modal('show');

			$.getJSON("http://localhost:8080/proyecto_final/ApiProductos?idProducto="+id, function (dataPro) {
				console.log(dataPro);
			
				htmltitulo= '';
				htmlbody = '';

				var title = dataPro[0].nombre_producto;
				var src =  dataPro[0].imagen;
				var descripcion = dataPro[0].descripcion;
				var precio = dataPro[0].precio_producto;

				htmltitulo += '<h2>'+title+'</h2>';
				htmlbody += '<div class="imagen">';
				htmlbody += '<img style="float:left; margin:10px;" src="'+src+'">';
				htmlbody += '</div>';
				htmlbody += '<div class="descripcion">';
				htmlbody += '<p>'+descripcion+'</p>';
				htmlbody += '</div>';
				htmlbody += '<div class="precio">';
				htmlbody += '<h3>'+precio+ "€" +'</h3>';
				htmlbody += '</div>';
				
				$('#productoModal .modal-title').html(htmltitulo);
				$('#productoModal .modal-body').html(htmlbody);
				$('#productoModal').modal('show');
			});
		});
	});
}