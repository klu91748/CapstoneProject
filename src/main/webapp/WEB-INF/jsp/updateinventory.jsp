<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap4.min.css">
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
		<h3 class="text-secondary">Product Inventory Page</h3>
		<h4 class="text-secondary">This is the product inventory page!</h4>
		<!-- MODAL TRIGGER -->
		<button class="btn btn-primary" data-toggle="modal"
			data-target="#addModal">Add Product</button>
		<br> <br>
		<table class="table" id="table1">
			<thead class="thead-dark">
				<tr>
					<th>Photo</th>
					<th>Product Name</th>
					<th>Category</th>
					<th>Condition</th>
					<th>Price</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products}" var="product">
					<tr>
						<td><img alt="Cannot load image" src="${product.url}"></td>
						<td>${product.name}</td>
						<td>${product.category}</td>
						<td>${product.condition}</td>
						<td>$${product.price}</td>
						<td><a type="button" class="btn btn-success"
							href="/admin/updateproduct?id=${product.id}">Update</a></td>
						<td><a type="button" class="btn btn-warning"
							href="/admin/deleteproduct?id=${product.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<!--Update MODAL -->
	<div class="modal" id="UpdateModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Edit Product Details</h5>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form method="post">

						<div class="form-group">
							<label for="url">Photo URL</label> <input type="text" name="url"
								class="form-control" value="${product.url}" required />
						</div>
						<div class="form-group">
							<label for="name">Product Name</label> <input type="text"
								name="name" class="form-control" value="${product.name}"
								required />
						</div>
						<div class="form-group">
							<label for="category">Category</label> <input type="text"
								name="category" class="form-control" value="${product.category}"
								required />
						</div>
						<div class="form-group">
							<label for="condition">Condition</label> <input type="text"
								name="condition" class="form-control"
								value="${product.condition}" required />
						</div>
						<div class="form-group">
							<label for="price">Price</label> <input type="number"
								name="price" step=".01" class="form-control"
								value="${product.price }" required />
						</div>
						<input class="btn btn-primary" type="submit" />
					</form>
				</div>
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
<script>
	$('#UpdateModal').modal("show");
</script>

<script type="text/javascript" language="javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap4.min.js"></script>
<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
</script>

</html>