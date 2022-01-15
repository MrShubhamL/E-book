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
						<li class="px-4 list-group-item active"><a class="nav-link text-light" href=""> Manage Address</a></li>
						<li class="px-4"><a class="nav-link  text-light" href="panCardInfo.jsp"> PAN Card Information</a></li>
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
					    <h5>Manage Address</h5>
					    		<%
								String Successfull = (String) session.getAttribute("Successfull");
								String Error= (String) session.getAttribute("Error");
								
								if(Successfull != null){
									%>
										<h5 class="text-success"><%=Successfull%></h5>
									<%
									session.removeAttribute("Successfull");
								}
								if(Error != null){
									
									%>
										<h5 class="text-danger"><%=Error%></h5>
									<%
									session.removeAttribute("Error");
								}
								
								%>
					    
					      <form class="row g-3 " action="userAddress" method="post">
							  <div class="col-md-6">
							  <input type="hidden" class="form-control" name="uid" value="${user.id}">
							    <label for="validationDefault01" class="form-label">Name</label>
							    <input style="background-color:#575757 " value="${user.name}" type="text" class="form-control text-light" id="validationDefault01" name="name" required>
							  </div>
							
							
							  <div class="col-md-6">
							    <label for="validationDefault02" class="form-label">Mobile No.</label>
							    <input style="background-color:#575757 " value="${user.contact}" type="text" class="form-control text-light" id="validationDefault02" name="contact" required>
							  </div>
							  
							  <div class="col-md-6">
							    <label for="validationDefault03" class="form-label">Address</label>
							    <input style="background-color:#575757 " value="${user.address}" type="text" 
							    class="form-control text-light" id="validationDefault03" name="address" required>
							  </div>
							  
							    <div class="col-md-6">
							    <label for="validationDefault04" class="form-label">Landmark</label>
							    <input style="background-color:#575757 " type="text" value="${user.landmark}"
							     class="form-control text-light" id="validationDefault04" name="landmark" required>
							  </div>
							  
							    <div class="col-md-6">
							    <label for="validationDefault05" class="form-label">City</label>
							    <input style="background-color:#575757 " type="text" value="${user.city}"
							     class="form-control text-light" id="validationDefault05" name="city" required>
							  </div>
							  
							      <div class="col-md-6">
							    <label for="validationDefault06" class="form-label">State</label>
							    <input style="background-color:#575757 " type="text" value="${user.state}" 
							    class="form-control text-light" id="validationDefault06" name="state" required>
							  </div>
							  
							      <div class="col-md-6">
								    <label for="validationDefault07" class="form-label">Zip</label>
								    <input style="background-color:#575757 " type="text" value="${user.zip}"
								    class="form-control text-light" id="validationDefault07" name="pincode" required>
								  </div>
							  
							  <div class="col-md-6 my-5">
								<button class="btn btn-primary " type="submit">Update Details</button>
								<a class="btn btn-danger " href="userProfile.jsp">Cancel</a>
							  </div>
							  
							  
							</form>	
							
							

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