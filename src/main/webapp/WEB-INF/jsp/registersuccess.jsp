<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
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

	<!-- CARD WITH HEADER -->
	<div class="card mx-auto w-75">
		<div class="card-header">
			<h1>Customer registered successfully!</h1>
		</div>
		<div class="card-body">
			<a class="btn btn-primary" href="/products">Products</a>
		</div>
	</div>

</body>

</html>