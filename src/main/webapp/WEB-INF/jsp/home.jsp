<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<style>
.carousel-item .img-fluid {
	width: 100%;
	height: 100%;
}

a.carousel-control {
	height: 12%;
	top: 33%;
	width: 40px;
	background: black;
}
</style>
<title>Music Store</title>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
			<div class="container">
				<ul class="navbar-nav">
					<li class="navbar-brand">Music Store</li>
					<li class="nav-item"></li>
					<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/products">Products</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/about">About</a>
					</li>
				</ul>
				<ul class="navbar-nav">
					<c:if test="${role == null}">
						<li class="nav-item"><a class="nav-link" href="/login">Login</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/register">Register</a>
						</li>
					</c:if>
					<c:if test="${role == 'USER'}">
						<li class="nav-item"><a class="nav-link" href="/">Welcome
								${name }</a></li>
						<li class="nav-item"><a class="nav-link" href="/logout">Logout</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/user/cart">Cart</a>
						</li>
					</c:if>
					<c:if test="${role == 'ADMIN'}">
						<li class="nav-item"><a class="nav-link" href="/">Welcome
								${name }</a></li>
						<li class="nav-item"><a class="nav-link" href="/logout">Logout</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="/admin/adminhome">Admin</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</header>

	<div class="card bg-secondary">
		<div id="slider4" class="carousel slide mb-5" data-ride="carousel">
			<ol class="carousel-indicators">
				<li class="active" data-target="#slider4" data-slide-to="0"></li>
				<li data-target="#slider4" data-slide-to="1"></li>
				<li data-target="#slider4" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block img-fluid"
						src="https://source.unsplash.com/mp_FNJYcjBM/800x500"
						alt="First Slide">
					<div class="carousel-caption d-none d-md-block">
						<h3>Stimulate Your Senses</h3>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block img-fluid"
						src="https://source.unsplash.com/bE3_aFt85Y8/800x500"
						alt="Second Slide">
					<div class="carousel-caption d-none d-md-block">
						<h3>Beats By Dre</h3>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block img-fluid"
						src="https://source.unsplash.com/eAYO8vKNeFQ/800x500"
						alt="Third Slide">
					<div class="carousel-caption d-none d-md-block">
						<h3>Feel Empowered</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="card-body">
			<h1 class="card-title">Follow us on our socials!</h1>
			<a href="https://instagram.com" target="_blank"><img
				src="http://pngimg.com/uploads/instagram/instagram_PNG9.png"
				height="40px"></a> <a href="https://twitter.com" target="_blank"><img
				src="http://pngimg.com/uploads/twitter/twitter_PNG34.png"
				height="40px"></a>
		</div>
	</div>

	<a href="#slider4" class="carousel-control carousel-control-prev"
		data-slide="prev"> <span class="carousel-control-prev-icon"></span>
	</a>

	<a href="#slider4" class="carousel-control carousel-control-next"
		data-slide="next"> <span class="carousel-control-next-icon"></span>
	</a>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<script>
	$('.carousel').carousel({
		interval : 3000,
		keyboard : true,
		pause : 'hover',
		wrap : true
	});
</script>

</html>