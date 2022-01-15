
<%@page import="com.dao.UserDao"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.dao.CartDAO"%>
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

    
  </head>
  
  <body class="bg-dark">
  <%@ include file="Components/navbar.jsp" %>
  
  <%
User user2 = (User) session.getAttribute("user");
if( user2 == null){
	session.setAttribute("invalid", "Please Login Your Account!");
	response.sendRedirect("index.jsp");
}

%>


<div class="container-fluid my-4">
<div class="row">

<div class="col-md-6">

<div class="card" style="height: auto;background-color:#575757; ">
<div class="card-body text-light">
<h4 class="text-center">Your Ordered Products</h4>
<%
String Success = (String) session.getAttribute("Success");
String Failed= (String) session.getAttribute("Failed");

if(Success != null){
	%>
		<h5 class="text-success text-center"><%=Success%></h5>
	<%
	session.removeAttribute("Success");
}

if(Failed != null){
	%>
		<h5 class="text-danger text-center"><%=Failed%></h5>
	<%
	session.removeAttribute("Failed");
}

%>
  <div class="table-responsive p-3">
        <table class="table table-striped table-sm  align-items-center text-center text-light border">
        <caption>List of Products</caption>
          <thead>
            <tr>

              <th scope="col">Book Name</th>
              <th scope="col">Product</th>
              <th scope="col">Book Author</th>
              <th scope="col">Book Price</th>
            </tr>
          </thead>
          <tbody>
          <%
          User u = (User) session.getAttribute("user");
          CartDAO dao = new CartDAO(DBConnection.getConnection());
          if(u == null)
          {	
        		session.setAttribute("invalid", "Please Login Your Account!");
        		response.sendRedirect("index.jsp");
          }
          
          List<Cart> cart = dao.getBookByUser(u.getId());
          Double totalDouble = 0.00;
          for(Cart c: cart)
          {
        	  totalDouble = c.getTotalPrice();
        	  %>
        	            
          		<tr>
	              <th class="text-light"><%= c.getBookName() %></th>
	              <td><img alt="Loading" src="books/<%= c.getBookImg() %>" 
	              style="
	              		width: 70px;
	              		height: 100px;
				    "></td>
	              <td class="text-light"><%= c.getAuthor() %></td>
	              <td class="text-light"><%= c.getPrice() %></td>
	            </tr>
    	  
        	  <%
          }
          %>
          	<tr>
	              <th class="text-light">Total Price:</th>
	              <td>~</td>
	              <td>~</td>
	              <th class="text-light"><i class="fas fa-rupee-sign fa-1x"></i> <%=totalDouble %></th>
	            </tr>
	            
          </tbody>
          
        </table>
      </div>
</div>
</div>

</div>



<div class="col-md-6">
<div class="card" style="height: auto;background-color:#575757; ">
<div class="card-body text-white">
<h4 class="text-center"> Your Address Details</h4>

<p >
  <a class="btn btn-primary" data-bs-toggle="collapse"
   href="#collapseExample" role="button" aria-expanded="true" 
   aria-controls="collapseExample">
    View Your Order Details
  </a>
  <a href="index.jsp" class="btn btn-warning">Continue Order</a>
</p>
<%
User user5 = (User) session.getAttribute("user");
%>
<div class="collapse" id="collapseExample">
	<div class="card-body bg-dark" style="border-radius: 30px;">
    <h6><strong> Name:</strong> <%= user5.getName() %></h6>
    <h6><strong> Email:</strong> <%= user5.getEmail() %></h6>
    <h6><strong> Contact:</strong> <%= user5.getContact() %></h6>
    <h6><strong> Address:</strong> <%= user5.getAddress() %></h6>
    <h6><strong> City:</strong> <%= user5.getCity() %></h6>
    <h6><strong> State:</strong> <%= user5.getState() %></h6>
    <h6><strong> Zip:</strong> <%= user5.getZip() %></h6>
	</div>

</div>
	

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
