<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
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
					     width: 40px;
					     height: 40px;
					     border-radius: 20px;
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
					    <li><a class="nav-link text-light" href="userProfile.jsp"><i class="fas fa-archive"></i> MY ORDERS</a></li>
					    <li><hr class="dropdown-divider  text-light"></li>
						<li><span class="nav-link  text-light"><i class="fas fa-user"></i>  ACCOUNT SETTINGS</span></li>
						<li class="px-4 list-group-item active"><a class="nav-link text-light" href="#"> Profile Information</a></li>
						<li class="px-4"><a class="nav-link text-light" href="manageAddress.jsp"> Manage Address</a></li>
						<li class="px-4"><a class="nav-link  text-light" href="panCardInfo.jsp"> PAN Card Information</a></li>
						<li><hr class="dropdown-divider text-light"></li>	
						<li><span class="nav-link  text-light"><i class="fas fa-wallet"></i> PAYMENTS</span></li>
						<li class="px-4"><a class="nav-link text-light" href="#"> Gift Card</a></li>
						<li class="px-4"><a class="nav-link text-light" href="#"> Saved UPI</a></li>
						<li class="px-4"><a class="nav-link  text-light" href="#"> Saved Cards</a></li>		
						<li><hr class="dropdown-divider text-light"></li>	
						<li><span class="nav-link  text-light"><i class="fas fa-wallet"></i> SELLING BOOK</span></li>
						<li class="px-4"><a class="nav-link text-light" href="sellBook.jsp"> Sell Your Book</a></li>
						<li class="px-4"><a class="nav-link text-light" href="UserSoldBooks.jsp?ue=<%= user4.getEmail() %>"> Your Sold Books</a></li>    
					  </ul>
  				</div>
  			</div>
  		</div>
  		
  		 <div class="col-md-8">
			<div class="card my-4" style="background-color:#575757 ">
				<div class="card-body text-light">
					    <h5>Personal Information</h5>
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
					      <form class="row g-3 " action="updateUser" method="post" enctype="multipart/form-data">
							  <div class="col-md-8">
							  <input type="hidden" class="form-control" name="uid" value="<%= user4.getId() %>">
							    <label for="validationDefault01" class="form-label">Name</label>
							    <input style="background-color:#575757 " type="text" 
							    placeholder="Enter your full name" class="form-control text-light"
							     id="validationDefault01" name="name" value="<%= user4.getName() %>" required>
							  </div>
							  
							      <div class="row py-2">
								    <label for="validationDefault01" class="form-label">Current Profile Image </label>
								    <img class=" px-2" alt="No Preview" src="Userprofile/<%= user4.getPhoto()%>" 
								    style="
								    width: 20vh;
								    height: 20vh;
								     ">
								  </div>
							  
							    <div class="col-md-8">
								  <label for="formFile" class="form-label">Upload New Image</label>
								  <input style="background-color:#575757 " value="<%= user4.getPhoto() %>" class="form-control text-light" 
								  name="ProfileImg" type="file" id="formFile" required>
								</div>
								
								<div class="col-md-8">
							  	<p>Your Gender</p>
							  	<div class="form-check form-check-inline">
								  <input style="background-color:#575757 " class="form-check-input" 
								  type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
								  <label class="form-check-label" for="inlineRadio1">Male</label>
								</div>
								<div class="form-check form-check-inline">
								  <input style="background-color:#575757 " class="form-check-input" 
								  type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
								  <label class="form-check-label" for="inlineRadio2">Female</label>
								</div>
								</div>
					   



							    <h5>Email Address</h5>		
							    <div class="col-md-6">				    
									<label for="validationDefaultUsername" class="form-label">Username</label>
							    	<div class="input-group">
								      <span class="input-group-text" id="inputGroupPrepend2">@</span>
								      <input style="background-color:#575757 " placeholder="Enter your email" 
								      type="text" class="form-control text-light" id="validationDefaultUsername" 
								       aria-describedby="inputGroupPrepend2" value="<%= user4.getEmail()%>" name="email" required>
								  	</div>
								 </div>
							 
								 <div class="col-md-6"> 	
								    <label for="validationDefault03" class="form-label">Password</label>
								    <div class="input-group">   
								    <input style="background-color:#575757 " placeholder="Enter your password"
								     type="password" class="form-control text-light" value="<%= user4.getPassword()%>" name="password" 
								     id="validationDefault03" required>
									</div>
								</div>

							

							 <div class="col-md-8">
								<h5>Mobile Number</h5>
							    <input style="background-color:#575757 " placeholder="Enter your contact" 
							    type="text" min="0" maxlength="10" size="5" class="form-control text-light"
							     name="contact" value="<%= user4.getContact()%>" id="validationDefault04" required>
							  </div>
							  
							  <div class="col-md-8">
								<button class="btn btn-primary " type="submit">Update Details</button>
							  </div>
							  
							  
							</form>	
							
							<div class="col-md-12 my-4">
							<h6><strong>FAQs</strong></h6>
							<ul class="navbar-nav" style="font-size: 15px;">
								<li class="nav-item"><p><strong>What happens when I update my email address (or mobile number)?</strong></p></li>
								<li class="nav-item"><p>Your login email id (or mobile number) changes, likewise. You'll receive all your account 
								related communication on your updated email address (or mobile number).</p></li>
								<li class="nav-item"><p><strong>When will my E-Book account be updated with the new email 
								address (or mobile number)?</strong></p></li>
								<li class="nav-item"><p>It happens as soon as you confirm the verification code sent to your
									email (or mobile) and save the changes.</p></li>
								<li class="nav-item"><p><strong>What happens when I update my email address (or mobile number)?</strong></p></li>
								<li class="nav-item"><p>Updating your email address (or mobile number) doesn't invalidate your account. Your account
								 remains fully functional. You'll continue seeing your Order history, saved information and personal details.</p></li>
								
								<li class="nav-item"><p><strong>Does my Seller account get affected 
								when I update my email address?</strong></p></li>
								
								
								<li class="nav-item"><p>E-Book has a 'single sign-on' policy. Any changes will
								 reflect in your Seller account also.</p></li>
																									
							</ul>							
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