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

	<div class="mx-auto w-75">
		<div class="card">
			<div class="card-header">
				<h3 class="text-secondary">Cart</h3>
				<h4 class="text-secondary">All the selected products in your
					shopping cart</h4>
			</div>
			<div class="card-body">
				<a class="btn btn-danger" href="/user/clearcart" type="button">Clear
					Cart</a> <a class="btn btn-secondary float-right" href="/products"
					type="button">Continue Shopping</a>
				<table class="table">
					<thead>
						<tr>
							<th>Product</th>
							<th>Unit Price</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cart}" var="product">
							<tr>
								<td>${product.key.name}</td>
								<td>${product.key.price}</td>
								<td>${product.value}</td>
								<td>${product.key.price * product.value}</td>
								<td><a type="button" class="btn btn-danger"
									href="/user/deleteproduct?id=${product.key.id}">Remove</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${cart.size() > 0}">
					<a class="btn btn-success" href="/user/checkout" type="button">Checkout</a>
				</c:if>
			</div>
		</div>
	</div>
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

</html>