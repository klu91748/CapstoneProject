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

	<div class="mx-auto w-50">
		<h3 class="text-secondary">Register Customer</h3>
		<h6 class="text-secondary">Please fill in your information below:</h6>
		<br>
		<h4 class="text-secondary">Basic Info</h4>
		<font color="red">${errorMessage}</font>
		<form method="post">
			<div class="form-group">
				<label for="fullName">Name</label> <input type="text"
					name="fullName" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="email">Email</label> <input type="email" name="email"
					class="form-control" required>
			</div>
			<div class="form-group">
				<label for="phone">Phone</label> <input type="number" name="phone"
					min=10 class="form-control" required>
			</div>
			<div class="form-group">
				<label for="name">Username</label> <input type="text" name="name"
					class="form-control" required>
			</div>
			<div class="form-group">
				<label for="pass">Password</label> <input type="password"
					name="pass" class="form-control" required>
			</div>
			<br>
			<h4 class="text-secondary">Billing Address</h4>
			<div class="form-group">
				<label for="street">Street Name</label> <input type="text"
					name="street" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="city">City</label> <input type="text" name="city"
					class="form-control" required>
			</div>
			<div class="form-group">
				<label for="state">State</label> <input type="text" name="state"
					class="form-control" required>
			</div>
			<div class="form-group">
				<label for="country">Country</label> <input type="text"
					name="country" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="zipCode">Zip Code</label> <input type="number"
					name="zipCode" min=5 class="form-control" required>
			</div>
			<input class="btn btn-input" type="submit" />
		</form>
	</div>
	<br>
</body>

</html>