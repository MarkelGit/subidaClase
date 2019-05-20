var carrito
$(document).ready(function () {
	carrito = JSON.parse(localStorage.getItem('carrito')) || [];
  
	getInicio();
});

var htmlzatia = '';
function getCategorias() {
	$.getJSON("http://localhost:8080/proyecto_final/ApiCategorias", function (dataCat) {
		
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
			
				if (dropdown == 1) {
					linea += '<div class="dropdown-divider"></div>';
					linea += '<a class="dropdown-item" href="#" data-idcat="'+dataCat[i].idCategoria+'">Todo</a>';
					linea += '</div></li>';
				}
				
				htmlzatia += linea;
			}
			
			htmlzatia += '</ul><div class="btn-group">';
			htmlzatia += '<button type="button" class="btn btn-outline-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="carritoButton">Carrito</button>';
			htmlzatia += '<div class="dropdown-menu dropdown-menu-right">';
			htmlzatia += '<table class="carrito" onclick="event.stopPropagation();">';
			htmlzatia += '</table>';
			htmlzatia += '</div>';
			htmlzatia += '</div>';

			$('#navbarToggleExternalContent').html(htmlzatia);
			
			$('.dropdown-item').on("click", function() {
				var id=$(this).data("id");
				var idcat=$(this).data("idcat");
				if (id) {
				getProductosByIdSub(id);
				}
				else if(idcat){
				getProductosByIdCat(idcat);
				}

				else{
					getAllProductos();
				}
			});
			$('#logo').on("click", function(){
				getInicio();
			});

			$('#carritoButton').on("click", refresh);
		});
	});
}

function refresh(){
	carrito = JSON.parse(localStorage.getItem('carrito')) || [];
	var htmltable = '';
	var precioCantidad = '';
	var precioTotal = parseFloat(0);

	$('.dropdown-toggle').on("blur", function() {
		$('.btn-group').addClass("show");
	});

	for (i in carrito) {	
		precioCantidad = parseFloat(carrito[i].precio*carrito[i].cantidad);

		htmltable += '<tr class="linea-carrito">';
		htmltable += '<td class="img" style="width:100px"><img style="max-width:50px" src="'+carrito[i].imagen+'"></td>';
		htmltable += '<td class="titulo">'+carrito[i].nombre+'</td>';
		htmltable += '<td class="cantidad">';
		htmltable += '<div class="aumentar" onclick="addCantidad('+i+')"> <img src="iconos/aumentar.png">';
		htmltable += '</div>';
		htmltable += '<div class="cantidad-flexible">'+carrito[i].cantidad;
		htmltable += '</div>';
		htmltable += '<div class="disminuir" onclick="removeCantidad('+i+')"> <img src="iconos/disminuir.png">';
		htmltable += '</div>';
		htmltable += '</td>';
		htmltable += '<td class="precioCantidad">'+precioCantidad+"€"+'</td>';
		htmltable += '<td class="eliminar">';
		htmltable += '<div class="borrar" onclick="removeItem('+i+')"> <img src="iconos/eliminar.png">';
		htmltable += '</div>';
		htmltable += '</td>';
		htmltable += '</tr>';

		precioTotal = parseFloat(precioTotal+precioCantidad);
	}
		
		htmltable += '<tr class="pedidoFooter">';
		htmltable += '<td class="pedido" colspan="2">';
		htmltable += '<a href="/resumen.html" type="button" class="btn btn-danger pedidoButton">Realizar pedido</a>';
		htmltable += '</td>';
		htmltable += '<td class="precioTotal" colspan="2"><b>Total: </b>'+precioTotal+"€"+'</td>';
		htmltable += '</tr>';

	$('.carrito').html(htmltable);
}

function removeItem(pos){
	console.log(pos);

	for (i in carrito) {
		if (i == pos) {
			carrito.pop(pos);
			localStorage.setItem("carrito", JSON.stringify(carrito));
		}
	}
	refresh();
};

function addCantidad(pos){
	carrito[pos].cantidad++;
	localStorage.setItem("carrito", JSON.stringify(carrito));
	refresh();
};

function removeCantidad(pos){
	carrito[pos].cantidad--;
	localStorage.setItem("carrito", JSON.stringify(carrito));
	refresh();
};

function getProductosByIdSub(id) {
	$.getJSON("http://localhost:8080/proyecto_final/ApiProductos?idSubcategoria="+id, function (data) {
		console.log(data);
		var html = '';

		for (i in data) {
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

function getProductosByIdCat(id) {
	$.getJSON("http://localhost:8080/proyecto_final/ApiProductos?idCategoria="+id, function (data) {
		console.log(data);
		var html = '';

		for (i in data) {
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

function getInicio() {
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

			$("#productoModal .modal-title").text("Datuak kargatzen");
			$("#productoModal .modal-body").html('<div class="spinner-border text-danger" role="status"></div>');
			$('#productoModal').modal('show');

			$.getJSON("http://localhost:8080/proyecto_final/ApiProductos?idProducto="+id, function (dataPro) {
				console.log(dataPro);
			
				htmltitulo = '';
				htmlbody = '';
				htmlfooter = '';

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
				htmlfooter += '<button type="button" class="btn btn-danger addCarrito" data-nombre="'+title+'" data-imagen="'+src+'" data-precio="'+precio+'" data-id="'+dataPro[0].idProducto+'">Añadir al carrito</button>';
				
				console.log(dataPro);
				$('#productoModal .modal-title').html(htmltitulo);
				$('#productoModal .modal-body').html(htmlbody);
				$('#productoModal .modal-footer').html(htmlfooter);
				$('#productoModal').slideDown();

				$('.addCarrito').on("click", function () {
					var existe = 0;
					var producto = $(this).data();
					console.log($(this).data());
					producto.cantidad = 1;

					for (let i = 0; i < carrito.length; i++) {
						if (producto.id == carrito[i].id) {
							carrito[i].cantidad++;
							existe = 1;
						} 
					}
					if (carrito.length == 0) {
						carrito.push(producto);
						console.log(carrito);
					}else {
						if (existe == 0) {
							carrito.push(producto);
							console.log(carrito);
						}
					}

					//console.log(carrito[producto.id]);
					/*if (carrito[producto.id] === undefined) {
						producto.cantidad = 1;
						carrito[producto.id] = producto;
						console.log(true);
					}else {
						carrito[producto.id].cantidad ++;
						console.log(false);
					}*/
			
					//localStorage.setItem('carrito'+carrito[id].id+'', JSON.stringify(carrito));
					localStorage.setItem("carrito", JSON.stringify(carrito));

					$('#productoModal').modal('hide');
				});
			});
		});
	});

	getCategorias();
}