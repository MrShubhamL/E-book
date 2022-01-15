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
%>

<%
User user1 = (User) session.getAttribute("user");
if( user1 == null){
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
							
							if( user1 == null){
								session.setAttribute("invalid", "Please Login Your Account!");
								
							}
							else
							{
								%>
					  			<img alt="Loading" src="../Userprofile/<%= user4.getPhoto()%>"
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
						<li class="px-4 "><a class="nav-link text-light" href="manageAddress.jsp"> Manage Address</a></li>
						<li class="px-4 list-group-item active"><a class="nav-link  text-light" href="#"> PAN Card Information</a></li>
						<li><hr class="dropdown-divider text-light"></li>	
						<li><span class="nav-link  text-light"><i class="fas fa-wallet"></i> PAYMENTS</span></li>
						<li class="px-4"><a class="nav-link text-light" href="#"> Gift Card</a></li>
						<li class="px-4"><a class="nav-link text-light" href="#"> Saved UPI</a></li>
						<li class="px-4"><a class="nav-link  text-light" href="#"> Saved Cards</a></li>	
						<li><hr class="dropdown-divider text-light"></li>	
						<li><span class="nav-link  text-light"><i class="fas fa-wallet"></i> SELLING BOOK</span></li>
						<li class="px-4"><a class="nav-link text-light" href="sellBook.jsp"> Sell Your Book</a></li>
						<li class="px-4"><a class="nav-link text-light" href="UserSoldBooks.jsp?ue=<%= user4.getEmail()%>"> Your Sold Books</a></li> 	    
					  </ul>
  				</div>
  			</div>
  		</div>
  		
  		 <div class="col-md-8">
			<div class="card my-4" style="background-color:#575757 ">
				<div class="card-body text-light">
					    <h5>PAN Card Information</h5>
					      
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