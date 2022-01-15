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
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="../userlogout">Sign out</a>
    </div>
  </div>
</header>



<div class="container-fluid">
  <div class="row">
      <%@ include file="sidenavbar.jsp" %>
</div>
</div>

<div class="container">
<div class="row">
<div class="col-md-4 offset-4">
<div class="card my-4" style="margin-top: 50px;">
<div class="card-body">
<h4 class="text-center my-3" style="">Add New Books </h4>
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

<form action="../addBookServlet" class="row g-3" method="post" enctype="multipart/form-data">

  <div class="col-md-12">
    <label for="validationDefault01" class="form-label">Enter Book Name</label>
    <input type="text" class="form-control" id="validationDefault01" name="bookName" required>
  </div>

  <div class="col-md-12">
    <label for="validationDefaultUsername" class="form-label">Enter Book Author</label>
    <input type="text" class="form-control" id="validationDefaultUsername" name="bookAuthor" aria-describedby="inputGroupPrepend2" required>

  </div>

  <div class="col-md-12">
    <label for="validationDefault01" class="form-label">Enter Book Price</label>
    <input type="text" class="form-control" id="validationDefault01" name="bookPrice" required>
  </div>
  
    <div class="col-md-12">
		<select class="form-select" aria-label="Default select example"  name="bookCategory" >
		  <option selected>Select Book Category</option>
		  <option value="New">New Book</option>
		</select>
  </div>
 
      <div class="col-md-12">
		<select class="form-select" aria-label="Default select example"  name="bookStatus" >
		  <option selected>Select Book Status</option>
		  <option value="Active">Active</option>
		  <option value="Inactive">Inactive</option>
		  <option value="Featured">Featured</option>
		</select>
  </div>
  
  	<div class="col-md-12">
	  <label for="formFile" class="form-label">Upload Image</label>
	  <input class="form-control" name="bookImg" type="file" id="formFile">
	</div>

  <div class="col-md-4 offset-4">
    <button class="btn btn-primary" type="submit" style="">Add Book</button>
  </div>
</form>



</div>
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
