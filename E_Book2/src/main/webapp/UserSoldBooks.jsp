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
						<li class="px-4"><a class="nav-link text-light" href="sellBook.jsp"> Sell Your Book</a></li>
						<li class="px-4 list-group-item active"><a class="nav-link text-light" href="UserSoldBooks.jsp"> Your Sold Books</a></li>	    
					  </ul>
  				</div>
  			</div>
  		</div>
  		
  		 <div class="col-md-8">
			<div class="card my-4" style="background-color:#575757 ">
				<div class="card-body text-light">
					    <h5>SOLD BOOKS INFORMATION</h5>
						<%
						String Success = (String) session.getAttribute("Success");
						String Failed= (String) session.getAttribute("Failed");
						
						if(Success != null){
							%>
								<h5 class="text-info text-center"><%=Success%></h5>
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
			        <table class="table table-striped table-sm  align-items-center text-center text-light">
			        <caption>List of Products</caption>
			          <thead>
			            <tr>
			
			              <th scope="col">Book Name</th>
			              <th scope="col">Product</th>
			              <th scope="col">Book Author</th>
			              <th scope="col">Book Price</th>
			              <th scope="col">Book Status</th>
			              <th scope="col">Action</th>
			            </tr>
			          </thead>
			          <tbody>
			          <%
			            User u = (User) session.getAttribute("user");
			          	String UserEmail = request.getParameter("ue");
						BookDAO dao3 = new BookDAO(DBConnection.getConnection());
			          if(u == null)
			          {	
			        		session.setAttribute("invalid", "Please Login Your Account!");
	
			          }
						List<BookDetails> list3 = dao3.getSellBook(u.getEmail());
						for(BookDetails b: list3)
				          {			        	  
			        	  %>
			        	            
			          		<tr>
				              <th class="text-light"><%= b.getBookName() %></th>
				              <td><img alt="Loading" src="books/<%= b.getBookPhoto() %>" 
				              style="
				              		width: 70px;
				              		height: 100px;
							    "></td>
				              <td class="text-light"><%= b.getBookAuthor() %></td>
				              <td class="text-light"><%= b.getBookPrice() %></td>
				              <td class="text-light"><%= b.getBookStatus() %></td>
				              <td>
				              <div class="col d-flex ">
				              <a href="removeSellBook?bid=<%= b.getId() %>"
				               class="btn btn-danger btn-sm mx-1">Remove</a>
				              <a class="btn btn-warning btn-sm mx-1" 
				              href="editSellBook.jsp?bid=<%= b.getId()%>">Edit</a>				              
				              </div>
				               </td>
				            </tr>
			    	  
			        	  <%
			          }
			          %>

				            
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