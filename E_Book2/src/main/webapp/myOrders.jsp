
<%@page import="com.entity.BookOrder"%>
<%@page import="com.dao.OrderDAO"%>
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

<div class="col-md-6 offset-3">

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
			<th scope="col">Book Image</th>
              <th scope="col">Book Name</th>
              <th scope="col">Book Author</th>
              <th scope="col">Payment Mode</th>
              <th scope="col">Book Price</th>
              <th scope="col">Order Status</th>
            </tr>
          </thead>
          <tbody>
          <%
          User u = (User) session.getAttribute("user");
          if(u == null)
          {	
        		session.setAttribute("invalid", "Please Login Your Account!");
        		response.sendRedirect("index.jsp");
          }
          
       		String email = request.getParameter("ue");
          OrderDAO dao9 = new OrderDAO(DBConnection.getConnection());
          List<BookOrder> order = dao9.getOrderByUser(email);

          Double totalDouble = 0.00;
          for(BookOrder bo: order)
          {
        	  totalDouble = bo.getPrice();
        	  %>
        	            
          		<tr>
	              <th class="text-light"><%= bo.getBookName() %></th>
          		<td class="text-light">
          		<img alt="Loading" src="books/<%= bo.getBookImage() %>" 
	              style="
	              		width: 70px;
	              		height: 100px;
				    ">
          		</td>
	              <td class="text-light"><%= bo.getAuthor() %></td>
	              <td class="text-light"><%= bo.getPayment() %></td>
	              <td class="text-light"><%= bo.getPrice() %></td>
	              <%
	              	if("Product Dispatched".equals(bo.getStatus())){
	              		%>
	              		<td class="text-info"><%= bo.getStatus() %></td>
	              		<%
	              	}
	              	else
	              	{
	              		%>
			              <td class="text-light"><%= bo.getStatus() %></td>
	              		<%
	              	}
	              %>
	            </tr>
    	  
        	  <%
          }
          %>
          	<tr>
	              <th class="text-light">Total Price:</th>
	              <td>~</td>
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
