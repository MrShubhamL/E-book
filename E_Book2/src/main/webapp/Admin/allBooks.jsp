<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.dao.BookDAO"%>
<%@page import="com.entity.Admin"%>
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
    
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
 integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
  crossorigin="anonymous"/>
  
    <!-- CSS only -->
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
crossorigin="anonymous"></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
 rel="stylesheet"
 integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
 crossorigin="anonymous">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>
  <body>
  <%
	Admin admin2 = (Admin) session.getAttribute("userObj");
	if( admin2 == null){
		session.setAttribute("invalid", "Please Login Your Account!");
		response.sendRedirect("../index.jsp");
	}

%>
    
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">E-Book Online Shop</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
<!--   <input class="form-control form-control-dark w-100" type="text" 
  placeholder="Search" name="ch" aria-label="Search">
  <a class="btn btn-dark" href="search.jsp">Search</a> -->
  
   			<form  class="d-flex col-md-8" action="search.jsp" method="POST">
		        <input class="form-control form-control-dark w-100" type="search" name="ch" placeholder="Search" aria-label="Search">
		        <button class="btn btn-dark" type="submit">Search</button>
			</form>
  
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="../userlogout">Sign out</a>
    </div>
  </div>
</header>



<div class="container-fluid">
  <div class="row">
        <%@ include file="sidenavbar.jsp" %>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-0">

      <h2>All Books</h2>
      <%
String Successfull = (String) session.getAttribute("Successfull");
String Error= (String) session.getAttribute("Error");

if(Successfull != null){
	%>
		<h5 class="text-success text-center"><%=Successfull%></h5>
	<%
	session.removeAttribute("Successfull");
}
if(Error != null){
	
	%>
		<h5 class="text-success text-center"><%=Error%></h5>
	<%
	session.removeAttribute("Error");
}

%>
      <div class="table-responsive">
        <table class="table table-striped table-sm  align-items-center">
          <thead>
            <tr>
              <th scope="col">BookId</th>
              <th scope="col">Image</th>
              <th scope="col">Book Name</th>
              <th scope="col">Book Author</th>
              <th scope="col">Book Price</th>
              <th scope="col">Book Category</th>
              <th scope="col">Book Status</th>
              <th scope="col">Action</th>
            </tr>
          </thead>
          <tbody>
          <%
          	BookDAO dao = new BookDAO(DBConnection.getConnection());
          	List<BookDetails> list = dao.getAllBooks();
          	for(BookDetails b: list)
          	{
          		%>
          		<tr>
	              <td><%= b.getId() %></td>
	              <td><img alt="Image Not Available" src="../books/<%= b.getBookPhoto()%>"
	              style="
	              		width: 70px;
	              		height: 100px;
	              
	              "></td>
	              <td><%= b.getBookName() %></td>
	              <td><%= b.getBookAuthor() %></td>
	              <td><%= b.getBookPrice() %></td>
	              <td><%= b.getBookCategory() %></td>
	              <td><%= b.getBookStatus() %></td>
	              <td>
	              <a class="btn btn-warning btn-sm" href="editBook.jsp?ide=<%= b.getId()%>">Edit</a>
	              <a type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Delete</a>
	              </td>
	            </tr>
		          <!-- Modal -->
							<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" 
							data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
							 aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h4 class="modal-title" id="staticBackdropLabel">Delete Product!</h4>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <h5>Do you wants to delete the <%= b.getBookName() %> Book</h5>
							      </div>
							      <div class="modal-footer">
							        <a class="btn btn-secondary" data-bs-dismiss="modal">Close</a>
							        <a class="btn btn-danger" href="../delete?id=<%= b.getId()%>" >Delete</a>
							      </div>
							    </div>
							  </div>
							</div>
          		<%
          	}
          
          %>
					          
          
          </tbody>
        </table>
      </div>
    </main>
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
