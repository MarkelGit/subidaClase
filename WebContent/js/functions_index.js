var totalStorage
var carrito
var carritoFactura

var htmlzatia = '';

$(document).ready(function () {
	totalStorage = JSON.parse(localStorage.getItem('total'));
	carrito = JSON.parse(localStorage.getItem('carrito')) || [];

	getInicio();
});

function getCategorias() {
	$.getJSON("http://localhost:8080/proyecto_final/ApiCategorias", function (dataCat) {

		$.getJSON("http://localhost:8080/proyecto_final/ApiSubcategorias", function (dataSub) {
			htmlzatia = '<ul class="navbar-nav mr-auto">';

			for (i in dataCat) {
				var linea = '<li class="nav-item"><a class="nav-link" href="#">' + dataCat[i].nombre_categoria + '</a></li>';
				var dropdown = 0;
				for (y in dataSub) {
					if (dropdown == 0 && dataSub[y].idCategoria == dataCat[i].idCategoria) {
						dropdown = 1;
						linea = '<li class="nav-item dropdown mb-0 h5 active"><a ';
						linea += 'class="nav-link dropdown-toggle" href="#" id="navbarDropdown"';
						linea += 'role="button" data-toggle="dropdown" aria-haspopup="true"';
						linea += 'aria-expanded="false"> ' + dataCat[i].nombre_categoria + ' </a>';
						linea += '<div class="dropdown-menu" aria-labelledby="navbarDropdown">';
						linea += '<a class="dropdown-item" href="#" data-id="' + dataSub[y].idSubcategoria + '">' + dataSub[y].nombre_categoria + '</a> ';
					}
					else if (dropdown == 1 && dataSub[y].idCategoria == dataCat[i].idCategoria) {
						linea += '<a class="dropdown-item" href="#" data-id="' + dataSub[y].idSubcategoria + '">' + dataSub[y].nombre_categoria + '</a>';
					}
				}

				if (dropdown == 1) {
					linea += '<div class="dropdown-divider"></div>';
					linea += '<a class="dropdown-item" href="#" data-idcat="' + dataCat[i].idCategoria + '">Todo</a>';
					linea += '</div>';
					linea += '</li>';
				}

				htmlzatia += linea;
			}

			htmlzatia += '<li class="nav-item">';
			htmlzatia += '<a class="nav-link mb-0 h5 active" href="http://localhost:8080/proyecto_final/CAdmin">Admin</a>';
			htmlzatia += '</li>';
			htmlzatia += '</ul>';
			htmlzatia += '<div class="btn-group carro">';
			htmlzatia += '<button type="button" class="btn btn-outline-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="carritoButton">Carrito</button>';
			htmlzatia += '<div class="dropdown-menu dropdown-menu-right">';
			htmlzatia += '<table class="carrito" onclick="event.stopPropagation();">';
			htmlzatia += '</table>';
			htmlzatia += '</div>';
			htmlzatia += '</div>';

			$('#navbarToggleExternalContent').html(htmlzatia);

			$('.dropdown-item').on("click", function () {
				var id = $(this).data("id");
				var idcat = $(this).data("idcat");
				if (id) {
					getProductosByIdSub(id);
				}
				else if (idcat) {
					getProductosByIdCat(idcat);
				}

				else {
					getAllProductos();
				}
			});
			$('#logo').on("click", function () {
				getInicio();
			});

			$('#carritoButton').on("click", refresh);
		});
	});
}

function getInicio() {
	$.getJSON("http://localhost:8080/proyecto_final/ApiProductos", function (data) {
		var html = '';

		for (let i = 0; i < 6; i++) {
			var title = data[i].nombre_producto;
			var src = data[i].imagen;
			var precio = data[i].precio_producto;

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
			html += '<button type="button" class="btn btn-danger addCarrito" data-stock="' + data[i].stock + '" data-nombre="' + title + '" data-imagen="' + src + '" data-precio="' + precio + '" data-id="' + data[i].idProducto + '">Añadir al carrito</button>';
			html += '</div>';
			html += '<small class="text-muted">' + data[i].precio_producto + "€" + '</small>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
		}
		$('.row').html(html);

		$('.modalButton').on("click", printModal);
		$('.addCarrito').on("click", addCarrito);
	});

	getCategorias();
}

function getProductosByIdSub(id) {
	$.getJSON("http://localhost:8080/proyecto_final/ApiProductos?idSubcategoria=" + id, function (data) {
		var html = '';

		for (i in data) {
			var title = data[i].nombre_producto;
			var src = data[i].imagen;
			var precio = data[i].precio_producto;

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
			html += '<button type="button" class="btn btn-danger addCarrito" data-stock="' + data[i].stock + '" data-nombre="' + title + '" data-imagen="' + src + '" data-precio="' + precio + '" data-id="' + data[i].idProducto + '">Añadir al carrito</button>';
			html += '</div>';
			html += '<small class="text-muted">' + data[i].precio_producto + "€" + '</small>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
		}

		$('.row').html(html);

		$('.modalButton').on("click", printModal);
		$('.addCarrito').on("click", addCarrito);
	});
}

function getProductosByIdCat(id) {
	$.getJSON("http://localhost:8080/proyecto_final/ApiProductos?idCategoria=" + id, function (data) {
		var html = '';



		for (i in data) {
			var title = data[i].nombre_producto;
			var src = data[i].imagen;
			var precio = data[i].precio_producto;
			
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
			html += '<button type="button" class="btn btn-danger addCarrito" data-stock="' + data[i].stock + '" data-nombre="' + title + '" data-imagen="' + src + '" data-precio="' + precio + '" data-id="' + data[i].idProducto + '">Añadir al carrito</button>';
			html += '</div>';
			html += '<small class="text-muted">' + data[i].precio_producto + "€" + '</small>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
		}

		$('.row').html(html);

		$('.modalButton').on("click", printModal);
		$('.addCarrito').on("click", addCarrito);
	});
}

function refresh() {
	carrito = JSON.parse(localStorage.getItem('carrito')) || [];
	var htmltable = '';
	var precioCantidad = '';
	var precioTotal = parseFloat(0);

	$('.dropdown-toggle').on("blur", function () {
		$('.btn-group').addClass("show");
	});

	for (i in carrito) {
		precioCantidad = parseFloat(carrito[i].precio * carrito[i].cantidad);

		htmltable += '<tr class="linea-carrito">';
		htmltable += '<td class="img" style="width:100px"><img style="max-width:50px" src="' + carrito[i].imagen + '"></td>';
		htmltable += '<td class="titulo">' + carrito[i].nombre + '</td>';
		htmltable += '<td class="cantidad">';
		if (carrito[i].cantidad < carrito[i].stock) {
			htmltable += '<div class="aumentar" onclick="addCantidad(' + i + ')"> <img src="imagenes/iconos/aumentar.png">';
		}
		htmltable += '</div>';
		htmltable += '<div class="cantidad-flexible">' + carrito[i].cantidad;
		htmltable += '</div>';
		if (carrito[i].cantidad !== 1) {
			htmltable += '<div class="disminuir" onclick="removeCantidad(' + i + ')"> <img src="imagenes/iconos/disminuir.png">';
		}
		htmltable += '</div>';
		htmltable += '</td>';
		htmltable += '<td class="precioCantidad">' + precioCantidad + "€" + '</td>';
		htmltable += '<td class="eliminar">';
		htmltable += '<div class="borrar" onclick="removeItem(' + i + ')"> <img src="imagenes/iconos/eliminar.png">';
		htmltable += '</div>';
		htmltable += '</td>';
		htmltable += '</tr>';

		precioTotal = parseFloat(precioTotal + precioCantidad);
	}

	htmltable += '<tr class="pedidoFooter">';
	htmltable += '<td class="pedido" colspan="2">';
	htmltable += '<a href="/resumen.html" type="button" class="btn btn-danger pedidoButton" data-total="' + precioTotal + '">Realizar pedido</a>';
	htmltable += '</td>';
	htmltable += '<td class="precioTotal" colspan="3"><b>Total: </b>' + precioTotal + "€" + '</td>';
	htmltable += '</tr>';

	$('.carrito').html(htmltable);

	$('.pedidoButton').on('click', function () {
		var total = $(this).data(total);

		totalStorage = total;
		localStorage.setItem("totalStorage", JSON.stringify(total));
	});
}

function removeItem(pos) {
	for (i in carrito) {
		if (i == pos) {
			carrito.splice(pos, 1);
			localStorage.setItem("carrito", JSON.stringify(carrito));
		}
	}
	refresh();
};

function addCantidad(pos) {
	carrito[pos].cantidad++;
	localStorage.setItem("carrito", JSON.stringify(carrito));
	refresh();
};

function removeCantidad(pos) {
	carrito[pos].cantidad--;
	localStorage.setItem("carrito", JSON.stringify(carrito));
	refresh();
};

function printModal() {
	var id = $(this).data("id");

	$("#productoModal .modal-title").text("Datuak kargatzen");
	$("#productoModal .modal-body").html('<div class="spinner-border text-danger" role="status"></div>');
	$('#productoModal').modal('show');

	$.getJSON("http://localhost:8080/proyecto_final/ApiProductos?idProducto=" + id, function (dataPro) {
		htmltitulo = '';
		htmlbody = '';
		htmlfooter = '';

		var title = dataPro[0].nombre_producto;
		var src = dataPro[0].imagen;
		var descripcion = dataPro[0].descripcion;
		var precio = dataPro[0].precio_producto;

		htmltitulo += '<h2>' + title + '</h2>';
		htmlbody += '<div class="imagen">';
		htmlbody += '<img style="float:left; margin:10px;" src="' + src + '">';
		htmlbody += '</div>';
		htmlbody += '<div class="descripcion">';
		htmlbody += '<p>' + descripcion + '</p>';
		htmlbody += '</div>';
		htmlbody += '<div class="precio">';
		htmlbody += '<h3>' + precio + "€" + '</h3>';
		htmlbody += '</div>';
		htmlfooter += '<button type="button" class="btn btn-danger addCarritoInModel" data-stock="' + dataPro[0].stock + '" data-nombre="' + title + '" data-imagen="' + src + '" data-precio="' + precio + '" data-id="' + dataPro[0].idProducto + '">Añadir al carrito</button>';

		$('#productoModal .modal-title').html(htmltitulo);
		$('#productoModal .modal-body').html(htmlbody);
		$('#productoModal .modal-footer').html(htmlfooter);
		$('#productoModal').slideDown();

		$('.addCarritoInModel').on("click", addCarritoInModal);	
	});
}

function addCarrito() {
	var existe = 0;
	var producto = $(this).data();
	producto.cantidad = 1;

	for (let i = 0; i < carrito.length; i++) {
		if (producto.id == carrito[i].id) {
			carrito[i].cantidad++;
			existe = 1;
		}
	}
	if (carrito.length == 0) {
		carrito.push(producto);
	} else {
		if (existe == 0) {
			carrito.push(producto);
		}
	}

	localStorage.setItem("carrito", JSON.stringify(carrito));
}

function addCarritoInModal() {
	var existe = 0;
	var productoModel = $(this).data();
	productoModel.cantidad = 1;

	for (let i = 0; i < carrito.length; i++) {
		if (productoModel.id == carrito[i].id) {
			carrito[i].cantidad++;
			existe = 1;
		}
	}
	if (carrito.length == 0) {
		carrito.push(productoModel);
	} else {
		if (existe == 0) {
			carrito.push(productoModel);
		}
	}

	localStorage.setItem("carrito", JSON.stringify(carrito));

	$('#productoModal').modal('hide');
}