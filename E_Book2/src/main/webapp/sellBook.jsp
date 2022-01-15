<%@page import="com.entity.BookDetails"%>
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
						<li class="px-4 list-group-item active"><a class="nav-link text-light" href="#"> Sell Your Book</a></li>
						<li class="px-4"><a class="nav-link text-light" href="UserSoldBooks.jsp?ue=<%= user4.getEmail()%>"> Your Sold Books</a></li>	    
						<li class="px-4"><a class="nav-link text-light" href="OldBookOrder.jsp">Book Order Request</a></li>	    
					  </ul>
  				</div>
  			</div>
  		</div>
  		
  		 <div class="col-md-8">
			<div class="card my-4" style="background-color:#575757 ">
				<div class="card-body text-light">
					    <h5>Sell Book Details</h5>
					    								<%
								String Successfull = (String) session.getAttribute("Successfull");
								String Error= (String) session.getAttribute("Error");
								
								if(Successfull != null){
									%>
										<h5 class="text-light"><%=Successfull%></h5>
									<%
									session.removeAttribute("Successfull");
								}
								if(Error != null){
									
									%>
										<h5 class="text-light"><%=Error%></h5>
									<%
									session.removeAttribute("Error");
								}
								
								%>
					      <form class="row g-3 " action="SellBookServlet" method="post" enctype="multipart/form-data">
							  <div class="col-md-6">
							  		<%
						  			if( user4 == null){
						  				session.setAttribute("invalid", "Please Login Your Account!");
						  				
						  			}
						  			else
						  			{
						  				%>
							  			<input type="hidden" class="form-control" value="<%= user4.getEmail() %>" id="validationDefault09" name="userEmail" required>
						  				<%
						  			}
						  				
						  			%>
								    <label for="validationDefault01" class="form-label">Enter Book Name</label>
								    <input type="text" style="background-color:#575757 " class="form-control text-light" id="validationDefault01" name="BookName" required>
								  </div>
								
								  <div class="col-md-6">
								    <label for="validationDefaultUsername" class="form-label">Enter Book Author</label>
								    <input type="text" style="background-color:#575757 " class="form-control text-light" id="validationDefaultUsername" name="BookAuthor" aria-describedby="inputGroupPrepend2" required>
								
								  </div>
								
								  <div class="col-md-6">
								    <label for="validationDefault01" class="form-label">Enter Book Price</label>
								    <input type="text" style="background-color:#575757 " class="form-control text-light" id="validationDefault01" name="Price" required>
								  </div>
								  
								    <div class="col-md-6">
								    	<label for="validationDefault08" class="form-label">Book Category</label>
										<select class="form-select text-light" style="background-color:#575757 " aria-label="Default select example"  name="BookCategory" >
										  <option selected>Select Book Category</option>
										  <option value="Old">Old Book</option>
										</select>
								  </div>
								 
								      <div class="col-md-6">
								      <label for="validationDefault07" class="form-label">Book Status</label>
										<select class="form-select text-light" style="background-color:#575757 " aria-label="Default select example"  name="BookStatus" >
										  <option selected>Select Book Status</option>
										  <option value="Active">Active</option>
										  <option value="Featured">Featured</option>
										</select>
								  </div>
								  
								  	<div class="col-md-6">
									  <label for="formFile" class="form-label">Upload Image</label>
									  <input class="form-control text-light" style="background-color:#575757 " name="BookImg" type="file" id="formFile">
									</div>
								
								  <div class="col-md-6">
								    <button class="btn btn-primary" type="submit" style="">Sell Book</button>
								    <a class="btn btn-primary" href="userProfile.jsp" style="">Cancel</a>
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