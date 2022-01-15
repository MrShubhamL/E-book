<%@page import="com.entity.BookDetails"%>
<%@page import="com.dao.BookDAO"%>
<%@page import="com.dao.OldOrderDAO"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="com.dao.OrderDAO"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Address</title>
<%@ include file="Components/allScripts.jsp" %>
</head>
<body class="bg-dark">
<%@ include file="Components/navbar.jsp" %>
<%
User user4 = (User) session.getAttribute("user");
if( user4 == null){
	session.setAttribute("invalid", "Please Login Your Account!");
	response.sendRedirect("index.jsp");
}
%>

<div class="container">
  	<div class="row">
  		<div class="col-md-4" >
  			<div class="card my-4" style="background-color:#575757 ">
	  			<div class="card-body text-light">
	  			<div class="d-flex px-2">
	  			<%
	  			if( user4 == null){
	  				session.setAttribute("invalid", "Please Login Your Account!");
	  				
	  			}
	  			else
	  			{
	  				%>
			  			<img alt="Loading" src="Userprofile/<%= user4.getPhoto()%>"
			  			style="
						     width: 60px;
						     height: 60px;
						     border-radius: 30px;
						    ">	  				
					    <div >
					    <ul class="navbar-nav">
						    <li class=" nav-item px-3"><small>Hello</small></li>	  	
						    <li class=" nav-item px-3"><h5><small><%= user4.getName() %></small></h5></li>						    
					    </ul>
					    </div>
	  				<%
	  			}
	  				
	  			%>
	  			</div>
	  			</div>
  			</div>
  			
  			 <div class="card my-4" style="background-color:#575757 ">
  			  	<div class="card-body ">
  					<ul class="list-group navbar-nav">
					    <li><a class="nav-link  text-light" href="userProfile.jsp"><i class="fas fa-archive"></i> MY ORDERS</a></li>
					    <li><hr class="dropdown-divider  text-light"></li>
						<li><span class="nav-link  text-light"><i class="fas fa-user"></i>  ACCOUNT SETTINGS</span></li>
						<li class="px-4"><a class="nav-link text-light" href="userProfile.jsp"> Profile Information</a></li>
						<li class="px-4 "><a class="nav-link text-light" href=""> Manage Address</a></li>
						<li class="px-4"><a class="nav-link  text-light" href="panCardInfo.jsp"> PAN Card Information</a></li>
						<li><hr class="dropdown-divider text-light"></li>	
						<li><span class="nav-link  text-light"><i class="fas fa-wallet"></i> PAYMENTS</span></li>
						<li class="px-4"><a class="nav-link text-light" href="#"> Gift Card</a></li>
						<li class="px-4"><a class="nav-link text-light" href="#"> Saved UPI</a></li>
						<li class="px-4"><a class="nav-link  text-light" href="#"> Saved Cards</a></li>	
						<li><hr class="dropdown-divider text-light"></li>	
						<li><span class="nav-link  text-light"><i class="fas fa-wallet"></i> SELLING BOOK</span></li>
						<li class="px-4"><a class="nav-link text-light" href="#"> Sell Your Book</a></li>
						<li class="px-4"><a class="nav-link text-light" href="UserSoldBooks.jsp?ue=<%= user4.getEmail()%>"> Your Sold Books</a></li>	    
						<li class="px-4 list-group-item active"><a class="nav-link text-light" href="">Book Order Request</a></li>	    
					  </ul>
  				</div>
  			</div>
  		</div>
  		
  		 <div class="col-md-8">
			<div class="card my-4" style="background-color:#575757 ">
				<div class="card-body text-light">
					    <h5>All Book Order Requests</h5>
	<div class="table-responsive p-3">
        <table class="table table-striped table-sm  align-items-center text-center text-light border">
        <caption>List of Products</caption>
          <thead>
            <tr>
			<th scope="col">Book Image</th>
              <th scope="col">Book Name</th>
              <th scope="col">Customer Name</th>
              <th scope="col">Customer Email</th>
              <th scope="col">Customer Contact</th>
              <th scope="col">Customer Address</th>
              <th scope="col">Book Price</th>
              <th scope="col">Order Status</th>
              <th scope="col">Order Action</th>
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
          
          
       		String email = u.getEmail();
       		
          OldOrderDAO dao9 = new OldOrderDAO(DBConnection.getConnection());
          List<BookOrder> order = dao9.getOrderBySeller(email);

          Double totalDouble = 0.00;
          for(BookOrder bo: order)
          {
        	  totalDouble = bo.getPrice();
        	  %>
        	            
          		<tr>
          		<td class="text-light">
          		<img alt="Loading" src="books/<%= bo.getBookImage() %>" 
	              style="
	              		width: 70px;
	              		height: 100px;
				    ">
          		</td>
	              <td class="text-light"><%= bo.getBookName() %></td>
	              <td class="text-light"><%= bo.getName() %></td>
	              <td class="text-light"><%= bo.getEmail() %></td>
	              <td class="text-light"><%= bo.getContact() %></td>
	              <td class="text-light"><%= bo.getAddress() + "\n" +
	              							 bo.getState() + "\n" +
	              							 bo.getCity() + "\n" +
	              							 bo.getPin()
	              							 
	              							 %></td>
	              <td class="text-light"><%= bo.getPrice() %></td>
	              <td class="text-light"><%= bo.getStatus() %></td>
	              <%
	              	if("Approved".equals(bo.getStatus())){
	              		%>
	              		<td class="text-info"></td>
	              		<%
	              	}
	              	else
	              	{
	              		%>
			              <td class="text-light">
			            <a href="" class="btn btn-success btn-sm mx-2">Approve</a>
						<a href="" class="btn btn-danger btn-sm mx-2">Reject</a>
							</td>
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


<div class="stickt-bottom">
<%@ include file="Components/footer.jsp" %>
</div>
</body>
</html>