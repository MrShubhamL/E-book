
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
<h4 class="text-center">Your Selected Products</h4>
<%
String Success = (String) session.getAttribute("Success");
String Failed= (String) session.getAttribute("Failed");
String Empty= (String) session.getAttribute("Empty");

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
if(Empty != null){
	%>
		<h5 class="text-danger text-center"><%=Empty%></h5>
	<%
	session.removeAttribute("Empty");
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
              <th scope="col">Action</th>
            </tr>
          </thead>
          <tbody>
          <%
          User u = (User) session.getAttribute("user");
          CartDAO dao = new CartDAO(DBConnection.getConnection());
          if(u == null)
          {	
        		session.setAttribute("invalid", "Please Login Your Account!");
        		
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
	              <td class="text-light"><a class="btn btn-danger btn-sm"
	               href="removeBook?bid=<%= c.getBookId() %>&&uid=<%= c.getUserId() %>">Remove</a></td>
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



<div class="col-md-6">
<div class="card" style="height: auto;background-color:#575757; ">
<div class="card-body text-white">
<h4 class="text-center"> Your Order Details</h4>
<%
String msg = (String) session.getAttribute("msg");

if(msg != null){
	%>
		<h5 class="text-danger text-center"><%=msg%></h5>
	<%
	session.removeAttribute("msg");
}

%>
<form action="OrderNowServlet" class="row g-3" method="post">

  <div class="col-md-6">
  <input type="hidden" value="<%= user2.getId()%>" name="uid">
    <label for="validationDefault01" class="form-label">Name</label>
    <input type="text" style="background-color:#575757; " 
    class="form-control text-light" id="validationDefault01" 
    value="<%= user2.getName() %>" name="name" required>
  </div>

  <div class="col-md-6">
    <label for="validationDefaultUsername" class="form-label">Email</label>
    <div class="input-group">
      <span class="input-group-text" id="inputGroupPrepend2">@</span>
      <input type="text" style="background-color:#575757; " 
      class="form-control text-light" id="validationDefaultUsername"
       name="email" aria-describedby="inputGroupPrepend2" 
       value="<%= user2.getEmail() %>" required>
    </div>
  </div>

  <div class="col-md-6">
    <label for="validationDefault02" class="form-label">Mobile No.</label>
    <input type="text" style="background-color:#575757; "
     class="form-control text-light" id="validationDefault02" name="contact" 
     value="<%= user2.getContact() %>" required>
  </div>
  
  <div class="col-md-6">
    <label for="validationDefault03" class="form-label">Address</label>
    <input type="text" style="background-color:#575757;" 
    class="form-control text-light" id="validationDefault03" 
    name="address" value="<%= user2.getAddress() %>" required>
  </div>
  
    <div class="col-md-6">
    <label for="validationDefault04" class="form-label">Landmark</label>
    <input type="text" style="background-color:#575757;" 
    class="form-control text-light" id="validationDefault04"
     name="landmark" value="<%= user2.getLandmark() %>" required>
  </div>
  
    <div class="col-md-6">
    <label for="validationDefault05" class="form-label">City</label>
    <input type="text" style="background-color:#575757; "
     class="form-control text-light" id="validationDefault05" 
     name="city" value="<%= user2.getCity() %>" required>
  </div>
  
      <div class="col-md-6">
    <label for="validationDefault06" class="form-label">State</label>
    <input type="text" style="background-color:#575757; " 
    class="form-control text-light" id="validationDefault06"
     name="state" value="<%= user2.getState() %>" required>
  </div>
  
      <div class="col-md-6">
	    <label for="validationDefault07" class="form-label">Zip</label>
	    <input type="text" style="background-color:#575757; "
	     class="form-control text-light" id="validationDefault07"
	      name="zip" value="<%= user2.getZip()%>" required>
	  </div>
  
  <div class="col-md-12">
    <select style="background-color:#575757; " 
    class="form-select text-light" name="payment" aria-label="Default select example">
	  <option value="noselect">--select--</option>
	  <option value="Online Payment">Online Payment</option>
	  <option value="Net Banking">Net Banking</option>
	  <option value="COD">Cash On Delivery</option>
	</select>
  </div>

 
  <div class="col-12 text-center">
    <button type="submit" class="btn btn-warning">Order Now</button>
    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
  </div>
</form>


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
