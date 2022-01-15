
<%@page import="com.dao.OldBookDAO"%>
<%@page import="com.dao.RecentBookDAO"%>
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
<title>Insert title here</title>
<%@ include file="Components/allScripts.jsp" %>
<%
String addCart = (String) session.getAttribute("addCart");
if(addCart != null){
	%>

	<div class="alert alert-success d-flex align-items-center" role="alert">
	  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
	  <div>
	    <h6 class="text-success">Your Product has successfully added to cart</h6>
	  </div>
	</div>
	<%
	session.removeAttribute("addCart");
}

%>

<style type="text/css">

#backimg{
background: url("img/img.jpg");
background-position: center;
background-size: cover;
width: 100%;
height: 40vh;
}

.card:hover{
width:100%;
    transition: 0.1s all ease-in-out;
	background-color: #f5f9fc;
	transform: scale(1.05); 
} 


</style>
</head>
<body class="bg-dark">
<%@ include file="Components/navbar.jsp" %>

<%
String invalid2 = (String) session.getAttribute("invalid");
if(invalid2 != null){
	%>
		<h5 class="text-success text-center"><%=invalid2%></h5>
	<%
	session.removeAttribute("Successfull");
}

%>
<div id="carouselExampleDark" class="carousel slide bg-light" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">  
  
	<div class="d-flex justify-content-center">
		 <img src="books/c-programming.jpg" class="row d-flex justify-content-center" alt="..." style="height: 50vh;">
	</div>

    <div class="container ">
  		<div class="row">
      <div class="col align-self-start mx-5">
        <h5>Programming Books</h5>
        <p>Buy All Programming Books In Exclusive Offers | Order Now</p>
      </div>
      <div class=" text-end col align-self-end mx-5">
        <h5>Programming Books</h5>
        <p>Buy All Programming Books In Exclusive Offers | Order Now</p>
      </div>
    	</div>
    </div>
    
    
    </div>
    <div class="carousel-item " data-bs-interval="2000">
    <div class="d-flex justify-content-center">
      <img src="books/Geography.jpg" class="d-flex justify-content-center" alt="..." style="height: 50vh;">
    </div>
    <div class="container ">
  		<div class="row">
      <div class="col align-self-start mx-5">
        <h5>History Books</h5>
        <p>Buy All History Books In Exclusive Offers | Order Now</p>
      </div>
      <div class=" text-end col align-self-end mx-5">
        <h5>History Books</h5>
        <p>Buy All History Books In Exclusive Offers | Order Now</p>
      </div>
    	</div>
    </div>
    </div>
    <div class="carousel-item">
         <div class="d-flex justify-content-center">
      <img src="books/story-3.jpg" class="d-flex justify-content-center" alt="..." style="height: 50vh;">
    </div>
    <div class="container ">
  		<div class="row">
      <div class="col align-self-start mx-5">
        <h5>Story Books</h5>
        <p>Buy All Story Books In Exclusive Offers | Order Now</p>
      </div>
      <div class=" text-end col align-self-end mx-5">
        <h5>Story Books</h5>
        <p>Buy All Story Books In Exclusive Offers | Order Now</p>
      </div>
    	</div>
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

<div class="container" >
	<h3 class="text-center my-2 border-bottom text-light">RECENT NEW BOOKS</h3>
	<h3 class="text-center my-2 border-bottom text-light">RECENT NEW BOOKS</h3>
			<div class="row">
					<%
							RecentBookDAO dao = new RecentBookDAO(DBConnection.getConnection());
							List<BookDetails> list = dao.getAllRecentBook();
							for(BookDetails b: list)
							{
							%>
							<div class="col-md-3">
							<div class="card my-4">
							   <div class="card-body text-center">
									<img style="width: 30vh; height: 40vh;" src="books/<%= b.getBookPhoto() %>" class="img-thumbnail" alt="...">
									<p class="my-1"><%= b.getBookName() %></p>
									<div class="row">
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
											%>
											<div class="btn-group" role="group" aria-label="Basic outlined example">
											<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>
											<a class="btn btn-outline-success btn-sm ml-1"><i class="fas fa-cart-plus"></i> <strong>Cart</strong></a>
											<a class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
											</div>
											
											<%
										}
									%>
				
							
								</div>
							</div>
							</div>
							<%
							}
						%>
			</div>
<h3 class="text-center my-2 border-bottom text-light">RECENT OLD BOOKS</h3>
			<div class="row">
					<%
							/* RecentBookDAO dao2 = new RecentBookDAO(DBConnection.getConnection()); */
							OldBookDAO  dao2 = new OldBookDAO(DBConnection.getConnection());
							List<BookDetails> list2 = dao2.getRecentOldBook();
							for(BookDetails b: list2)
							{
							%>
							<div class="col-md-3">
							<div class="card my-4">
							   <div class="card-body text-center">
									<img style="width: 30vh; height: 40vh;" src="books/<%= b.getBookPhoto() %>" class="img-thumbnail" alt="...">
									<p class="my-1"><%= b.getBookName() %></p>
									<div class="row">
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
											%>
											<div class="btn-group" role="group" aria-label="Basic outlined example">
											<a href="showBookDetails.jsp?bid=<%= b.getId() %>" class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>
											<a class="btn btn-outline-success btn-sm ml-1"><i class="fas fa-cart-plus"></i> <strong>Cart</strong></a>
											<a class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <strong><%= b.getBookPrice() %></strong></a>					
											</div>
											
											<%
										}
									%>
				
							
								</div>
							</div>
							</div>
							<%
							}
						%>
			</div>
</div>

<%@ include file="Components/footer.jsp" %>
</body>
</html>