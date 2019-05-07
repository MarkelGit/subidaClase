<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Misuri Comics</title>
<link rel="icon" href="/images/favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<link rel="stylesheet" href="CSS/index.css">
<link href="carousel.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a id="nav" class="navbar-brand" href="#">MISURI COMICS</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Todos<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#">Mangas</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Comics </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Europeo</a> <a
								class="dropdown-item" href="#">Superheroes</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Ofertas</a>
						</div></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Carrito</button>
				</form>
			</div>
		</nav>
	</header>
	<main>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100"
					src="https://i.ytimg.com/vi/09-EIMMVP0w/maxresdefault.jpg"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="https://dam.smashmexico.com.mx/wp-content/uploads/2018/04/24160741/Alex-Ross-a-cargo-del-nuevo-arte-de-Spider-Man-para-PlayStation-4.jpg"
					alt="Second slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>OFERTA</h5>
					<p>comics de spiderman con 50% de descuento</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="https://dam.smashmexico.com.mx/wp-content/uploads/2018/04/24160741/Alex-Ross-a-cargo-del-nuevo-arte-de-Spider-Man-para-PlayStation-4.jpg"
					alt="Third slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>OFERTA</h5>
					<p>comics de spiderman con 50% de descuento</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect fill="#55595c" width="100%"
							height="100%"></rect>
						<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-secondary view">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect fill="#55595c" width="100%"
							height="100%"></rect>
						<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-secondary view">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect fill="#55595c" width="100%"
							height="100%"></rect>
						<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-secondary view">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect fill="#55595c" width="100%"
							height="100%"></rect>
						<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-secondary view">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect fill="#55595c" width="100%"
							height="100%"></rect>
						<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-secondary view">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect fill="#55595c" width="100%"
							height="100%"></rect>
						<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-secondary view">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect fill="#55595c" width="100%"
							height="100%"></rect>
						<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-secondary view">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect fill="#55595c" width="100%"
							height="100%"></rect>
						<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-secondary view">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect fill="#55595c" width="100%"
							height="100%"></rect>
						<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-secondary view">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/fechayhora.js"></script>

</body>
</html>