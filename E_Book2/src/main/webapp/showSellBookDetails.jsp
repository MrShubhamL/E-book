
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
    
    @keyframes mySpinner{
    
    from{
		transform: rotate(0deg);    
    }
    to{
    	transform: rotate(-360deg);
    }
    
    }
    
    .rotation:hover{
    	animation: mySpinner 1s;
    	animation-iteration-count: 1;
    }
    
    
    
    
    
    @keyframes moveforward{
    
    from{
    	transform: translateX(0);
    }
    to{
    	transform: translateX(200px);
    }
    
    }
    .truk:hover{
    
    animation: moveforward 1s ;
    animation-iteration-count: 1;
    }
    
    
    </style>
    
  </head>
  
  <body class="bg-dark">
  <%@ include file="Components/navbar.jsp" %>
<% 
 User u = (User) session.getAttribute("user");
%>
<%
	int id = Integer.parseInt(request.getParameter("bid"));
	BookDAO dao = new BookDAO(DBConnection.getConnection());
	BookDetails b =  dao.getSellBookById(id);
%>

<div class="container-fluid text-white">
  <div class="row">
  
  <div class="col-md-4 my-4 text-center border p-3">
  
  	<img alt="" src="books/<%= b.getBookPhoto() %>" style="width: 35vh; height: 50vh;">  
    <h5>Book: <%= b.getBookName() %></h5> 
    <h5><small class="text-muted">Author: <%= b.getBookAuthor() %></small></h5> 
    <h5><small class="text-muted">Category: <%= b.getBookCategory() %></small></h5> 
    <div class="btn-group" role="group" aria-label="Basic outlined example">
    
    	<%
    		if("Old".equals(b.getBookCategory())){
    			%>
    			<a href="sellercontact.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>Contact To Seller</strong></a>		
				<a class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong>Rs. 299</strong></a>					
			
    			<%
    		}
    		else
    		{
    			%>
    			
					<%
						if(u == null){
							%>
								<a data-bs-toggle="modal" data-bs-target="#staticBackdrop"  class="btn btn-outline-success btn-sm ml-1"><i class="fas fa-cart-plus"></i>
								<strong>Add To Cart</strong></a>	
								<a class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> 
								<strong>Rs. 299</strong></a>	
							<%
						}
						else{
							
							%>
	
								<a href="cartServlet?bid=<%= b.getId() %>&&uid=<%= u.getId() %>" class="btn btn-outline-success btn-sm ml-1"><i class="fas fa-cart-plus"></i>
								 <strong>Add To Cart</strong></a>		
								<a class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> 
								<strong>Rs. 299</strong></a>					
							<%
						}
					
					
					%>
					
    			
    			<%
    		}
    	
    	%>
    
    
		</div>
  </div>
  
  <div class="col-md-8 my-4 text-center border ">
    <h3>BOOK TITLE - <small class="text-muted"><%= b.getBookName() %></small></h3> 
    <div class="row  my-4" >
    	
    	<div class="col-md-4 text-success text-center  p-2">
    		<i class="fas fa-money-bill-alt fa-5x"></i>
    		<h5>Cash On Delivery</h5>
    	</div>
    	<div class="col-md-4 text-danger text-center  p-2 ">
    		<i class="fas fa-undo-alt fa-5x rotation"></i>
    		<h5>Easy Return</h5>
    	</div>    	
    	<div class="col-md-4 text-primary text-center  p-2">
    	<i class="fas fa-truck fa-5x truk"></i>
    	<h5>Free Home Delivery</h5>
    	</div>
    </div>
    
    
    <div class="row my-4">
		<%
			if("Old".equals(b.getBookCategory()))
			{
				%>
			   <h5 class="d-flex justify-content-start">Declamer</h5>
			   <p class=" d-flex justify-content-start">This product is second hand please contact to seller before buy.</p> 	
			   <p class=" d-flex justify-content-start">You can communicate directly with seller for book information and availability. </p>
			   <p class=" d-flex justify-content-start">We are not responsible for any internal damage please check once delivered.</p>
			   <p class=" d-flex justify-content-start">Please confirm your product before make any payments. </p>
				<%
			}
			else
			{
				%>
				
			   <h5 class="d-flex justify-content-start">Available Offers</h5>
			   <p class=" d-flex justify-content-start"><strong>Bank Offer<span> </span> </strong> Flat Rs.100 off on first Flipkart Pay Later order of Rs.500 and above T&C</p> 	
			   <p class=" d-flex justify-content-start"><strong>Bank Offer<span> </span> </strong>5% Unlimited Cashback on Flipkart Axis Bank Credit Card T&C</p>
			   <p class=" d-flex justify-content-start"><strong>Bank Offer<span> </span> </strong>20% off on 1st txn with Amex Network Cards issued by ICICI Bank</p>
			   <p class=" d-flex justify-content-start"><strong>Bank Offer<span> </span> </strong>10% Instant discount on Canara Bank Credit and Debit Card transactions T&C</p>
				
				<%
			}
		
		%>
    
    </div>
    
    <div class="row my-4">
    <%
    	if("Old".equals(b.getBookCategory())){
    		%>
    	       <div class="col-md-6 text-success text-center">
    			<a href="index.jsp" class="btn btn-info btn-lg">Continue Shopping</a>
    	    	</div>
    	    <%
    	}
    	else{
    		%>
    		
		       <div class="col-md-6 text-success text-center">
				<a href="index.jsp" class="btn btn-info btn-lg">Continue Shopping</a>
				<a class="btn btn-warning btn-lg">Rs. 999</a>
		    	</div>
    		
    		<%
    	}
    
    %>

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
  </body>
</html>
