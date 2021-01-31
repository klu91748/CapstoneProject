<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		<div class="card">
			<div class="card-header">
				<h3 class="text-secondary">Order</h3>
				<h6 class="text-secondary">Order Confirmation</h6>
			</div>
			<div class="card-body">
				<h4 class="card-title text-secondary text-center">Receipt</h4>
				<p id="date" class="text-muted"></p>
				<p>
					<Strong>Shipping Address</Strong>
				</p>
				<p>${street}</p>
				<p>${city},${state}</p>
				<p>${country}${zipCode}</p>
				<p>
					<Strong>Billing Address</Strong>
				</p>
				<p>${user.street}</p>
				<p>${user.city},${user.state}</p>
				<p>${user.country}${user.zipCode}</p>

				<table class="table">
					<thead>
						<tr>
							<th>Product</th>
							<th>#</th>
							<th>Price</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cart}" var="product">
							<tr>
								<td>${product.key.name}</td>
								<td>${product.value}</td>
								<td>${product.key.price}</td>
								<td>${product.key.price * product.value}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<form method="post">
					<a class="btn btn-light" href="/user/checkout" type="button">Back</a>
					<input class="btn btn-success" type="submit" value="Submit Order">
				</form>
			</div>
		</div>
	</div>
</body>

<script>
	var today = new Date().toString().slice(4, 15);
	var result = today.substring(0, 6) + ", " + today.substring(7, 11);

	document.getElementById("date").innerHTML = "Shipping Date: " + result;
</script>
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
	
</html>