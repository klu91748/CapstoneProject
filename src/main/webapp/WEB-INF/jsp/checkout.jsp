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

	<div class="card mx-auto w-50 col-sm-6 col-md-8 col-lg-9 col-xl-10">
		<div class="card-header">
			<h3 class="text-secondary">Customer</h3>
			<h4 class="text-secondary">Customer Details</h4>
		</div>
		<div class="card-body">
			<form method="post">
				<div class="form-group">
					<label for="name">Name</label> <input type="text" name="name"
						class="form-control" required />
				</div>
				<div class="form-group">
					<label for="email">Email</label> <input type="email" name="email"
						class="form-control" required />
				</div>
				<div class="form-group">
					<label for="phone">Phone</label> <input type="number" name="phone"
						class="form-control" required />
				</div>
				<div class="form-group">
					<label for="street">Street Name</label> <input type="text"
						name="street" class="form-control" required />
				</div>
				<div class="form-group">
					<label for="city">City</label> <input type="text" name="city"
						class="form-control" required />
				</div>
				<div class="form-group">
					<label for="state">State</label> <input type="text" name="state"
						class="form-control" required />
				</div>
				<div class="form-group">
					<label for="country">Country</label> <input type="text"
						name="country" class="form-control" required />
				</div>
				<div class="form-group">
					<label for="zipCode">Zip Code</label> <input type="number"
						name="zipCode" class="form-control" required />
				</div>
				<input class="btn btn-primary" type="submit" value="Next" /> <a
					class="btn btn-light" href="/user/cart" type="button">Cancel</a>
			</form>
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