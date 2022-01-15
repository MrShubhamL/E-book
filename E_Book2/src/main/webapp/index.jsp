
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDAO"%>
<%@page import="com.entity.Admin"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Boook Store</title>
<%@ include file="Components/allScripts.jsp" %>

<style type="text/css">
.tales {
  width: 100%;
}
.carousel-inner{
  width:100%;
  max-height: 80vh; !important;
}

.card:hover{
width:100%;
    transition: 0.2s all ease-in-out;
	background-color: white;
	transform: scale(1.02); 
}

.backimg1{
		background: url("img/bg.jpg");
		 height:80vh; 
		 width:100%;
		 background-size: cover; 
		 background-position: center;
		 
}

.backimg2{
		background: url("img/bg-1.jpg");
		 height:80vh; 
		 width:100%;
		 background-size: cover; 
		 background-position: center;
		 
}
.backimg3{
		background: url("img/bg-2.jpg");
		 height:80vh; 
		 width:100%;
		 background-size: cover; 
		 background-position: center;
		 
}

.overlay{
width: 100%;
height: 80vh;
background: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7));
position: absolute;
top: 0;
}


</style>
</head>
<body class="bg-dark">
<%@ include file="Components/navbar.jsp" %>
<% 
 User u = (User) session.getAttribute("user");
%>
<%
String invalid2 = (String) session.getAttribute("invalid");
String Successfull = (String) session.getAttribute("Successfull");

if(invalid2 != null){
	%>
		<h5 class="text-success text-center"><%=invalid2%></h5>
	<%
	session.removeAttribute("invalid");
}

if(Successfull != null){
	%>
		<h5 class="text-success text-center"><%=Successfull%></h5>
	<%
	session.removeAttribute("Successfull");
}

%>
<div id="carouselExampleDark" class="carousel slide carousel-fade bg-dark" data-bs-ride="carousel">

  <div class="carousel-inner">
    <div class="carousel-item text-center active" data-bs-interval="3000">  
  

    <div class="d-flex justify-content-center backimg1">
    </div>
    <div class="overlay ">
     <h2 style="margin-top: 150px; color: white; font-size: 5rem;">E-Book Online Shopping Store</h2>
    </div>
     <div class="carousel-caption d-none d-md-block">
        <h5 >Historical Jurney</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>

    </div>
    
    
    <div class="carousel-item text-center" data-bs-interval="2000">
    
    <div class="d-flex justify-content-center backimg2">
    </div>
		<div class="overlay ">
		    	<h2 style="margin-top: 150px; color: white; font-size: 5rem;">E-Book Online Shopping Store</h2>
		</div>
     <div class="carousel-caption d-none d-md-block">
        <h5>Story Books In Exclusive Offer</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    
    
    
    <div class="carousel-item" >
    <div class="d-flex justify-content-center backimg3">
    </div>
    <div class="overlay text-center">
    	<h2 style="margin-top: 150px; color: white; font-size: 5rem;">E-Book Online Shopping Store</h2>
    </div>
          <div class="carousel-caption d-none d-md-block">
        <h5>Programming Books Available</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>

    </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
  </div>


<div class="container my-3 text-white">
<h3 class="text-center ">RECENT NEW BOOKS</h3>
		<div class="row">
		<%
				BookDAO dao1 = new BookDAO(DBConnection.getConnection());
				List<BookDetails> list1 = dao1.getRecentBook();
				for(BookDetails b: list1)
				{
				%>
				<div class="col-md-3">
				<a href="showBookDetails.jsp?bid=<%= b.getId() %>" style="text-decoration: none;">
				<div class="card my-4">
				   <div class="card-body text-center">
						<img style="width: 30vh; height: 40vh;" src="books/<%= b.getBookPhoto() %>" class="img-thumbnail" alt="...">
						<p class="text-dark my-1"><%= b.getBookName() %></p>
						<div class="row">
						<small class="text-muted">E-BOOK Verified Product</small>
						<small class="text-muted">Author: <%= b.getBookAuthor() %></small>
						<small class="text-muted">Category: <%= b.getBookCategory() %></small>					
						</div>
						<%
							if(b.getBookCategory().equals("Old"))
							{
						%>
								<div class="btn-group" role="group" aria-label="Basic outlined example">
								<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>			
								<a class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
								</div>
							<%	
							}
							else
							{
								if(u == null){
									
									%>
								<div class="btn-group" role="group" aria-label="Basic outlined example">
								<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>
								<a data-bs-toggle="modal" data-bs-target="#staticBackdrop" 
								data-bs-toggle="tooltip" data-bs-placement="top" title="Still you are not Login " class="btn btn-outline-success btn-sm ml-1">
								<i class="fas fa-cart-plus"></i> <strong>Cart</strong></a>
								<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
								</div>
									<%
									
								}else
								{
									%>
									
									<div class="btn-group" role="group" aria-label="Basic outlined example">
									<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>
									<a href="cartServlet?bid=<%= b.getId() %>&&uid=<%= u.getId() %>"  class="btn btn-outline-success btn-sm ml-1"><i class="fas fa-cart-plus"></i> <strong>Cart</strong></a>
									<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
									</div>
									
									<%
								}
								
								
								
								%>
								<%	
							}
						%>
						
						
					</div>
				</div>
				</a>
				</div>
				<%
				}
			%>
			</div>
			<h3 class="text-center ">RECENT OLD BOOKS</h3>
			<div class="row">
		<%
				BookDAO dao6 = new BookDAO(DBConnection.getConnection());
				List<BookDetails> list6 = dao6.getOldBook();
				for(BookDetails b: list6)
				{
				%>
				<div class="col-md-3">
				<a href="showBookDetails.jsp?bid=<%= b.getId() %>" style="text-decoration: none;">
				<div class="card my-4">
				   <div class="card-body text-center">
						<img style="width: 30vh; height: 40vh;" src="books/<%= b.getBookPhoto() %>" class="img-thumbnail" alt="...">
						<p class="text-dark my-1"><%= b.getBookName() %></p>
						<div class="row">
						<small class="text-muted">E-BOOK Verified Product</small>
						<small class="text-muted">Author: <%= b.getBookAuthor() %></small>
						<small class="text-muted">Category: <%= b.getBookCategory() %></small>					
						</div>
						<%
							if(b.getBookCategory().equals("Old"))
							{
							%>
								<div class="btn-group" role="group" aria-label="Basic outlined example">
								<a href="showSellBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>			
								<a class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
								</div>
							<%	
							}
							else
							{
								if(u == null){
									
									%>
								<div class="btn-group" role="group" aria-label="Basic outlined example">
								<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>
								<a data-bs-toggle="modal" data-bs-target="#staticBackdrop" 
								data-bs-toggle="tooltip" data-bs-placement="top" title="Still you are not Login " class="btn btn-outline-success btn-sm ml-1">
								<i class="fas fa-cart-plus"></i> <strong>Cart</strong></a>
								<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
								</div>
									<%
									
								}else
								{
									%>
									
									<div class="btn-group" role="group" aria-label="Basic outlined example">
									<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>
									<a href="cartServlet?bid=<%= b.getId() %>&&uid=<%= u.getId() %>"  class="btn btn-outline-success btn-sm ml-1"><i class="fas fa-cart-plus"></i> <strong>Cart</strong></a>
									<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
									</div>
									
									<%
								}
								
								
								
								%>
								<%	
							}
						%>
						
						
					</div>
				</div>
				</a>
				</div>
				<%
				}
			%>
			</div>
			<div class="text-center">
			<a href="allRecentBooks.jsp" class="btn btn-outline-primary btn-sm ml-1"><strong>View All</strong></a>					
			</div>
</div>

<div class="container my-3 text-white" >
<h3 class="text-center">New Books</h3>
			<div class="row">
			<%
				BookDAO dao2 = new BookDAO(DBConnection.getConnection());
				List<BookDetails> list2 = dao2.getNewBook();
				for(BookDetails b: list2)
				{
				%>
				<div class="col-md-3">
				<a href="showBookDetails.jsp?bid=<%= b.getId() %>" style="text-decoration: none;">
				<div class="card my-4">
				   <div class="card-body text-center">
						<img style="width: 30vh; height: 40vh;" src="books/<%= b.getBookPhoto() %>" class="img-thumbnail" alt="...">
						<p class="text-dark my-1"><%= b.getBookName() %></p>
						<div class="row">
						<small class="text-muted">E-BOOK Verified Product</small>
						<small class="text-muted">Author: <%= b.getBookAuthor() %></small>
						<small class="text-muted">Category: <%= b.getBookCategory() %></small>					
						</div>
						<div class="btn-group" role="group" aria-label="Basic outlined example">
						<%
							if(u == null)
							{
								
								%>
									<a  href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>
									<a data-bs-toggle="modal" data-bs-target="#staticBackdrop" 
									data-bs-toggle="tooltip" data-bs-placement="top" title="Still you are not Login " class="btn btn-outline-success btn-sm ml-1">
									<i class="fas fa-cart-plus"></i> <strong>Cart</strong></a>
									<a href="showBookDetails.jsp?bid=<%= b.getId() %>"  class="btn btn-outline-danger btn-sm ml-1">
									<i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>	
								<%
								
								
							}
							else
							{
								%>
									<a  href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> 
									<strong>View Details</strong></a>
									
									
									<a href="cartServlet?bid=<%= b.getId() %>&&uid=<%= u.getId() %>" 
									 class="btn btn-outline-success btn-sm ml-1"><i class="fas fa-cart-plus">
									 </i> <strong>Cart</strong></a>
									 
									<a href="showBookDetails.jsp?bid=<%= b.getId() %>"  class="btn btn-outline-danger btn-sm ml-1">
									<i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
								
								<%
								
							}
						
						%>
						</div>
					</div>
				</div>
				</a>
				</div>
				<%
				}
			%>
			</div>

			<div class="text-center">
			<a href="allNewBooks.jsp" class="btn btn-outline-primary btn-sm ml-1"><strong>View All</strong></a>					
			</div>

</div>


<div class="container my-3 text-white" >
<h3 class="text-center">Old Books</h3>
			<div class="row">
			<%
				BookDAO dao3 = new BookDAO(DBConnection.getConnection());
				List<BookDetails> list3 = dao3.getOldBook();
				for(BookDetails b: list3)
				{
				%>
				<div class="col-md-3">
				<a href="showBookDetails.jsp?bid=<%= b.getId() %>" style="text-decoration: none;">
				<div class="card my-4">
				   <div class="card-body text-center">
						<img style="width: 30vh; height: 40vh;" src="books/<%= b.getBookPhoto() %>" class="img-thumbnail" alt="...">
						<p class="text-dark my-1"><%= b.getBookName() %></p>
						<div class="row">
						<small class="text-muted">E-BOOK Verified Product</small>
					    <small class="text-muted">Author: <%= b.getBookAuthor() %></small>
						<small class="text-muted">Category: <%= b.getBookCategory() %></small>
					    </div>
						<div class="btn-group" role="group" aria-label="Basic outlined example">
						<a  href="showSellBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>					
						<a href="showSellBookDetails.jsp?bid=<%= b.getId() %>"  class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
						</div>
					</div>
				</div>
				</a>
				</div>
				<%
				}
			%>
			</div>
			
			
			
			
			<div class="text-center">
			<a href="allOldBooks.jsp" class="btn btn-outline-primary btn-sm ml-1"><strong>View All</strong></a>					
			</div>

</div>


<%@ include file="Components/footer.jsp" %>
</body>
</html>