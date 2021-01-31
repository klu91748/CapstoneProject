<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">

  <title>Music Store</title>
</head>
</head>

<body>
	<header>
	    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	        <div class="container">         
	            <ul class="navbar-nav">
	            <li class="navbar-brand">Music Store</li>
	            <li class="nav-item">
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/">Home</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/products">Products</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/about">About</a>
	                </li>
	                </ul>
	                <ul class="navbar-nav">
	          		<c:if test="${role == null}">
		                <li class="nav-item">
		                    <a class="nav-link" href="/login">Login</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link" href="/register">Register</a>
		                </li>
	                </c:if>
					<c:if test="${role == 'USER'}">
						<li class="nav-item">
	                    <a class="nav-link" href="/">Welcome ${name }</a>
	                	</li>
		                <li class="nav-item">
		                    <a class="nav-link" href="/logout">Logout</a>
		                </li>
		               	<li class="nav-item">
	                    <a class="nav-link" href="/user/cart">Cart</a>
	                </li>
	                </c:if>
	                <c:if test="${role == 'ADMIN'}">
						<li class="nav-item">
	                    <a class="nav-link" href="/">Welcome ${name }</a>
	                	</li>
		                <li class="nav-item">
		                    <a class="nav-link" href="/logout">Logout</a>
		                </li>
		               	<li class="nav-item">
	                    <a class="nav-link" href="/admin/adminhome">Admin</a>
	                </li>
			    	</c:if>                
	            </ul>
	        </div>
	    </nav>
	</header>
	
	<div class="mx-auto w-75">
	
	<h3 class="text-secondary">Product Detail</h3>
	<h4 class="text-secondary">Here is the detail information of the product!</h4>

	<table class="table" id="example">
		<tbody>
			<tr>
				<td><img alt="${product.category}" src="${product.url}"></td>
				<td>${product.name}<br> <Strong>Category </Strong>${product.category}
					<br> <Strong>Condition </Strong>${product.condition} <br>
					$ ${product.price} <br></td>
			</tr>
			<tr>
				<td>
				<a class="btn btn-secondary" href="/products" type="button">Back</a>
				<a type="button" class="btn btn-warning"
							href="/user/addproduct?id=${product.id}">Add Cart</a>
				</td>
			</tr>
		</tbody>
	</table>
	</div>

	<div class="modal" id="cart">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-success">
					<h5 class="modal-title">Added To Cart!</h5>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<img alt="${product.category}" src="${product.url}">
					<a class="btn btn-danger" href="/products"><Strong>Continue Shopping</Strong></a>
	                <a class="btn btn-light" href="/user/cart"><Strong>View Cart</Strong></a>			     	
				</div>
			</div>
		</div>
	</div>
	       
</body>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
       <script>$('#cart').modal("show");</script>
</html>