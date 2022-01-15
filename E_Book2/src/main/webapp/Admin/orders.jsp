<%@page import="com.entity.BookOrder"%>
<%@page import="com.dao.OrderDAO"%>
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
        <%@ include file="../Components/allScripts.jsp" %>
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
      
table tbody tr:hover {
		    transition: 0.2s all ease-in-out;
		transform: scale(1.02);
}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>
  <body>
  
    
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
 
              <h3 >ALL ORDERED BOOKS LIST</h3>
              <%
				String Successfull = (String) session.getAttribute("Successfull");
				String Success = (String) session.getAttribute("Success");
				String Error= (String) session.getAttribute("Error");
				
				if(Successfull != null){
					%>
						<h5 class="text-info text-center"><%=Successfull%></h5>
					<%
					session.removeAttribute("Successfull");
				}
				if(Success != null){
					%>

					<h5 class="text-success"><%= Success%></h5>

					<%
					session.removeAttribute("Success");
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
          <thead class="text-center">
            <tr>
              <th scope="col">Order Id</th>
              <th scope="col">Customer Name</th>
              <th scope="col">Email</th>
              <th scope="col">Phone</th>
              <th scope="col">Address</th>
              <th scope="col">City</th>
              <th scope="col">State</th>
              <th scope="col">Book Image</th>
              <th scope="col">Book Name</th>
              <th scope="col">Author</th>
              <th scope="col">Price</th>
              <th scope="col">Payment</th>
              <th scope="col">Order Status</th>
              <th scope="col">Action</th>
            </tr>
          </thead>

          <tbody>
          <%
          	OrderDAO dao = new OrderDAO(DBConnection.getConnection());
          	List<BookOrder> list8= dao.getAllOrders();
          	for(BookOrder b: list8)
          	{
          		%>
          		<tr>
	              <td><%= b.getOrderId()%></td>
	              <td><%= b.getName() %></td>
	              <td><%= b.getEmail() %></td>
	              <td><%= b.getContact() %></td>
	              <td><%= b.getAddress() %></td>
	              <td><%= b.getCity() %></td>
	              <td><%= b.getState() %></td>
	              <td>
	              <img alt="Loading" src="../books/<%= b.getBookImage() %>" 
	              style="
	              		width: 70px;
	              		height: 100px;
				    ">
	              </td>
	              <td><%= b.getBookName() %></td>
	              <td><%= b.getAuthor() %></td>
	              <td><%= b.getPrice()%></td>
	              <td><%= b.getPayment() %></td>
	              <td><%= b.getStatus() %></td>
	              <td class="text-center">
	              <div class="d-flex">
	              <%
	              	if("Product Dispatched".equals(b.getStatus()))
	              	{
	              		%>
						<a class="btn btn-warning btn-sm mx-2">Approved</a>
	              		<%
	              	}
	              	else
	              	{
	              		%>
	              		<a href="../approveOrder?oid=<%= b.getOrderId() %>" class="btn btn-success btn-sm mx-2">Approve</a>
						<a href="../removeOrder?oid=<%= b.getOrderId() %>&&ue=<%= b.getEmail() %>" class="btn btn-danger btn-sm mx-2">Reject</a>	              
	              		
	              		<%
	              	}
	              
	              %>
	              </div>
				</td>
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
  </body>
</html>
