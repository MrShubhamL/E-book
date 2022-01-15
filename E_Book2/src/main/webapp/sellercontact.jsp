
<%@page import="com.dao.UserDao"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Admin Dashboard</title>
    <%@ include file="Components/allScripts.jsp" %>
    
    <style type="text/css">
    i:hover{
	    transition: 0.2s all ease-in-out;
		transform: scale(1.07); 
    
    }
    .marquee{
    -moz-transform: translate(100%)
    }
    
    </style>
    
  </head>
  
  <body class="bg-dark">
  <%@ include file="Components/navbar.jsp" %>

<%
	int id = Integer.parseInt(request.getParameter("bid"));
	BookDAO dao = new BookDAO(DBConnection.getConnection());
	BookDetails b =  dao.getSellBookById(id);
	
%>

<div class="container text-white">
  <div class="row">
  
  <div class="col-md-4 offset-1 my-4 text-center border p-3">
  
  	<img alt="" src="books/<%= b.getBookPhoto() %>" 
  	style="
  	width: 35vh;
  	height: 50vh;
  	">  
    <h5>Book: <%= b.getBookName() %></h5> 
    <h5><small class="text-muted">Author: <%= b.getBookAuthor() %></small></h5> 
    <h5><small class="text-muted">Category: <%= b.getBookCategory() %></small></h5> 
  </div>
  
  <div class="col-md-6 my-4  border ">
    <h3>BOOK TITLE - <small class="text-muted"><%= b.getBookName() %></small></h3> 
		<div class="col-md-12">
		
		<form action="oldBookOrderServlet" class="row g-3" method="post">
		
		  <input type="hidden" name="oid" value="<%= b.getId() %>" >
		  <div class="col-md-6">
		    <label for="validationDefault01" class="form-label">Enter Your Name</label>
		    <input type="text" class="form-control" id="validationDefault01" name="name" required>
		  </div>
		
		  <div class="col-md-6">
		    <label for="validationDefaultUsername" class="form-label">Enter Your Email</label>
		    <div class="input-group">
		      <span class="input-group-text" id="inputGroupPrepend2">@</span>
		      <input type="text" class="form-control" id="validationDefaultUsername" name="email" aria-describedby="inputGroupPrepend2" required>
		    </div>
		  </div>
		
		  <div class="col-md-6">
		    <label for="validationDefault01" class="form-label">Enter Your Contact Number</label>
		    <input type="text" class="form-control" id="validationDefault01" name="contact" required>
		  </div>
		  		
		  <div class="col-md-6">
		    <label for="validationDefault02" class="form-label">Enter Your Address</label>
		    <input type="text" class="form-control" id="validationDefault02" name="address" required>
		  </div>
		  
		    <div class="col-md-3">
		    <label for="validationDefault01" class="form-label">State</label>
		    <input type="text" class="form-control" id="validationDefault01" name="state" required>
		  	</div>
		  	
		  	<div class="col-md-3">
		    <label for="validationDefault01" class="form-label">City</label>
		    <input type="text" class="form-control" id="validationDefault01" name="city" required>
		  	</div>
		  
		    <div class="col-md-3">
		    <label for="validationDefault03" class="form-label">Zip Code</label>
		    <input type="text" class="form-control" id="validationDefault03" name="zip" required>
		  </div>
		  
		    <div class="col-md-12">
		    <select style="background-color:#575757; " 
		    class="form-select text-light" name="payment" aria-label="Default select example">
			  <option value="noselect">--select--</option>
			  <option value="Online Payment">Online Payment</option>
			  <option value="Net Banking">Net Banking</option>
			  <option value="COD">Cash On Delivery</option>
			</select>
		  </div>
		
		  <div class="col-12">
		    <div class="form-check">
		      <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
		      <label class="form-check-label" for="invalidCheck2">
		        Agree to terms and conditions
		      </label>
		    </div>
		  </div>
		      <div class="col-md-12 btn-group text-center" role="group" aria-label="Basic outlined example">
					<a href="allOldBooks.jsp" class="btn btn-outline-primary btn-sm ml-1"> 
					<strong>Continue Shopping</strong></a>	
					<button class="btn btn-outline-success btn-sm ml-1" type="submit"><i class="fas fa-cart-plus"></i>
					 <strong>Buy</strong></button>		
					<a class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> 
					<strong>Rs. 299</strong></a>
			</div>	
		</form>
		<h5 class="my-4">Seller Contact- <small class="text-muted"><%= b.getAdminEmail() %></small></h5>
    </div>
  </div>
    
  </div>
</div>




<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
 crossorigin="anonymous"></script>

 <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" 
 integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
  crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" 
  integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" 
  crossorigin="anonymous"></script>
  
  <script src="dashboard.js"></script>
  
<%@ include file="Components/footer.jsp" %>
  </body>
</html>
