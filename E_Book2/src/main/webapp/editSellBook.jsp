<%@page import="com.entity.BookDetails"%>
<%@page import="com.dao.BookDAO"%>
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
					  </ul>
  				</div>
  			</div>
  		</div>
  		
  		 <div class="col-md-8">
			<div class="card my-4" style="background-color:#575757 ">
				<div class="card-body">
				<h4 class="text-center my-3" style="">Update Book</h4>
		
				
				<%
				
					int id = Integer.parseInt(request.getParameter("bid"));
					BookDAO dao = new BookDAO(DBConnection.getConnection());
					BookDetails bd = dao.getSellBookById(id);
				
				%>

				<form action="updateSellBook" class="row g-3" method="post" enctype="multipart/form-data">
				  <div class="col-md-12">
					<input type="hidden" class="form-control" name="bid" value="<%= bd.getId()%>">
					
				    <label for="validationDefault01" class="form-label">Enter Book Name</label>
				    <input type="text" class="form-control" id="validationDefault01" name="bookName" value="<%= bd.getBookName() %>" required>
				  </div>
				
				  <div class="col-md-12">
				    <label for="validationDefaultUsername" class="form-label">Enter Book Author</label>
				    <input type="text" class="form-control" id="validationDefaultUsername" name="bookAuthor" value="<%= bd.getBookAuthor() %>" aria-describedby="inputGroupPrepend2" required>
				
				  </div>
				
				  <div class="col-md-12">
				    <label for="validationDefault01" class="form-label">Enter Book Price</label>
				    <input type="text" class="form-control" id="validationDefault01" name="bookPrice" value="<%= bd.getBookPrice() %>" required>
				  </div>
				  
				    <div class="col-md-12">
				        <label for="validationDefault01" class="form-label">Select Book Category</label>
						<select class="form-select" aria-label="Default select example"  name="bookCategory">
						  <option selected><%= bd.getBookCategory() %></option>
						  <option value="New">New</option>
						  <option value="Old">Old</option>
						  <option value="Recent">Recent</option>
						</select>
				  </div>
				 
				      <div class="col-md-12">
				        <label for="validationDefault01" class="form-label">Select Book Status</label>
						<select class="form-select" aria-label="Default select example"  name="bookStatus" >
						  <option selected><%= bd.getBookStatus() %></option>
						  <option value="Active">Active</option>
						  <option value="Inactive">Inactive</option>
						  <option value="Featured">Featured</option>
						</select>
				  	</div>
				  
				    <div class="row py-2">
				    <label for="validationDefault01" class="form-label">Current Book Image </label>
				    <img class="img-thumbnail px-2" alt="No Preview" src="books/<%= bd.getBookPhoto()%>" 
				    style="width: 30vh; height: 40vh;">
				  </div>
				  
				    	<div class="col-md-12">
					  <label for="formFile" class="form-label">Upload Image</label>
					  <input class="form-control" name="bookImg" type="file" id="formFile" required>
					</div>
				
				  <div class="col-md-4 offset-5">
				    <button class="btn btn-primary" type="submit" style="">Update</button>
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