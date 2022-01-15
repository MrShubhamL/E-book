
<%@page import="com.dao.NewBooksDAO"%>
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
    transition: 0.2s all ease-in-out;
	background-color: #f5f9fc;
	transform: scale(1.05); 
} 

.tales {
  width: 100%;
}
.carousel-inner{
  width:100%;
  max-height: 80vh; !important;
}

</style>
</head>
<body class="bg-dark">
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  </symbol>
  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
  </symbol>
 </svg>
<%@ include file="Components/navbar.jsp" %>

<%
String addCart = (String) session.getAttribute("addCart");
if(addCart != null){
	%>

	<div class="alert alert-success d-flex align-items-center" role="alert">
	  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
	  <div>
	    <h6 class="text-success">Your Product has successfully added to cart</h6>
	    <h6 class="text-success">Your Product has successfully added to cart</h6>
	  </div>
	</div>
	<%
	session.removeAttribute("addCart");
}

%>

<div id="carouselExampleDark" class="carousel slide bg-light " data-bs-ride="carousel">
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

    <div class="container">
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
    <div class="container">
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
    <div class="container">
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

<div class="container my-3" >
<h3 class="text-center text-light border-bottom">New Books</h3>
			<div class="row">
			<%
				User u = (User) session.getAttribute("user");
				NewBooksDAO dao = new NewBooksDAO(DBConnection.getConnection());
				List<BookDetails> list = dao.getAllNewBooks();
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
						<div class="btn-group" role="group" aria-label="Basic outlined example">
						<a  href="showBookDetails.jsp?bid=<%= b.getId() %>" 
						class="btn btn-outline-primary btn-sm ml-1"> <strong>View Details</strong></a>
						<%
						if(u==null)
						{
							%>
								<a href="cartServlet?bid=<%= b.getId() %>" 
								class="btn btn-outline-success btn-sm ml-1"><i class="fas fa-cart-plus">
								</i> <strong>Cart</strong></a>
							<%
						}
						else
						{
							%>
							
							<a href="cartServlet?bid=<%= b.getId() %>&&uid=<%= u.getId() %>" 
							class="btn btn-outline-success btn-sm ml-1"><i class="fas fa-cart-plus">
							</i> <strong>Cart</strong></a>
							<a class="btn btn-outline-danger btn-sm ml-1"><i class="fas fa-rupee-sign">
							</i> <strong><%= b.getBookPrice() %></strong></a>					

							<%
						}
						
						%>
						
						</div>
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