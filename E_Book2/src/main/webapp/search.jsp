
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

<div class="container my-3 text-white" >
<h3 class="text-center">New Books</h3>
			<div class="row">
			<%
				String ch = request.getParameter("ch");
				BookDAO dao2 = new BookDAO(DBConnection.getConnection());
				List<BookDetails> list2 = dao2.getBookBySearch(ch);
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

</div>


<%@ include file="Components/footer.jsp" %>
</body>
</html>