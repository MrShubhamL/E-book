<%@page import="com.dao.AdminDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
      .card:hover{
	width:100%;
    transition: 0.2s all ease-in-out;
	background-color: white;
	transform: scale(1.02); 
}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


  </head>
  <body>
  
    
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">E-Book Online Shop</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100" type="text" 
  placeholder="Search" name="ch" aria-label="Search">
  <a class="btn btn-dark" href="search.jsp">Search</a>

  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="../userlogout">Sign out</a>
    </div>
  </div>
</header>

<%
Admin admin2 = (Admin) session.getAttribute("userObj");
if( admin2 == null){
	session.setAttribute("invalid", "Please Login Your Account!");
	response.sendRedirect("../index.jsp");
}

%>


<div class="container-fluid">
  <div class="row">
    <%@ include file="sidenavbar.jsp" %>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-2">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="col-md-4 offset-4">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button>
        </div>
      </div>
      
      <div class="row mx-2 text-light">
      
      <div class="col-md-4 my-4">
      <div class="card" style="background-color: #0084ff">
      <div class="card-body">
      
	      <div class="d-flex ">    
	      <h5><i class="fas fa-file-alt fa-3x"></i></h5>
	      <div class="ms-auto p-2 bd-highlight text-center">
	      <h5>POSTS</h5> 
	      <h4>56</h4>	      
	      </div>    
	      </div>
  
      </div>
      </div>
      </div>
      
      
      
      <div class="col-md-4 my-4">
      <div class="card" style="background-color: #00ff33">
      <div class="card-body">
      
	      <div class="d-flex ">    
	      <h5><i class="fas fa-comments fa-3x"></i></h5>    
	      <div class="ms-auto p-2 bd-highlight text-center">
	      <h5>COMMENTS</h5> 
	      <h4>56</h4>	      
	      </div>   
	      </div>
      
      </div>
      </div>
      </div>
      
    
      
      <div class="col-md-4 my-4">
      <div class="card" style="background-color: #ffe100">
      <div class="card-body">
			<%
				UserDao dao5 = new UserDao(DBConnection.getConnection());
				List<User> list5 = dao5.getAllUsers();
			%>
	      <div class="d-flex ">    
	      <h5><i class="fas fa-user-tie fa-3x"></i></h5>    
	      <div class="ms-auto p-2 bd-highlight text-center">
	      <h5>TOTAL USERS</h5> 
	      <h4>
	      <div class="counter" data-target="<%= list5.size()%>">0</div>	      
	      </h4>
	      </div>   
	      </div>
      
      </div>
      </div>
      </div>
      
      <div class="col-md-4  my-4">
      <div class="card" style="background-color: #ff0000">
      <div class="card-body">
      		<%
      		BookDAO dao6 = new BookDAO(DBConnection.getConnection());
      		List<BookDetails> list6 = dao6.getTotalNewBoks();
      		%>
	      <div class="d-flex ">    
	      <h5><i class="fas fa-book fa-3x"></i></h5>    
	      <div class="ms-auto p-2 bd-highlight text-center">
	      <h5>NEW BOOKS</h5> 
	      <h4>
	      <div class="counter" data-target="<%= list6.size()%>">0</div>	      
	      </h4>	      
	      </div>   
	      </div>
      
      </div>
      </div>
      </div>
      
      <div class="col-md-4  my-4">
      <div class="card" style="background-color: #d359ff">
      <div class="card-body">
      		<%
      		BookDAO dao7 = new BookDAO(DBConnection.getConnection());
      		List<BookDetails> list7 = dao7.getTotalOldBoks();
      		%>
	      <div class="d-flex ">    
	      <h5><i class="fas fa-book-open fa-3x"></i></h5>    
	      <div class="ms-auto p-2 bd-highlight text-center">
	      <h5>OLD BOOKS</h5> 
	      <h4>
	      <div class="counter" data-target="<%= list7.size()%>">0</div>	      
	      </h4>	      
	      </div>   
	      </div>
      
      </div>
      </div>
      </div>
      
      <div class="col-md-4  my-4">
      <div class="card" style="background-color: #f700b1">
      <div class="card-body">
      		<%
      		AdminDAO dao8 = new AdminDAO(DBConnection.getConnection());
      		List<Admin> list8 = dao8.getAllAdmins();
      		%>
      		
      		
	      <div class="d-flex ">    
	      <h5><i class="fas fa-user-shield fa-3x"></i></h5>    
	      <div class="ms-auto p-2 bd-highlight text-center">
	      <h5>ALL ADMINS</h5> 
	      <h4>
	      <div class="counter" data-target="<%= list8.size()%>">0</div>	      
	      </h4>	      
	      </div>   
	      </div>
      
      </div>
      </div>
      </div>
      
      </div>
	



  <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
          var data = new google.visualization.arrayToDataTable([

              ['ACTIVITY', 'TOTAL'],
              ["POSTS",11 ],
              ["COMMENTS", 13],
              ["USERS",<%= list5.size()%>],
              ["NEW BOOKS",<%= list6.size()%>],
              ["OLD BOOKS",<%= list7.size()%>],
              ["ADMINS",<%= list8.size()%>]

            ]);


        var options = {
          chart: {
            title: 'Company Performance',
            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
    
 	<div class="col-md-8 offset-1" id="columnchart_material" 
 	style="
 		width: 900px;
 		height: 380px;
 		justify-content: center;
 		align-content: center;
 	 
 	">
 	</div> 
 	

 	

              <h3 >Books List...</h3>
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
	            </tr>
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
  <script src="script.js"></script>
  </body>
</html>
