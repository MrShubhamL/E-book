<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.dao.CartDAO"%>
<%@page import="com.entity.User"%>
<style>
.navList:hover{
padding: 6px;
border: 2px solid white;
border-radius: 8px;
}

.mycart:hover{
	    transition: 0.2s all ease-in-out;
		transform: scale(1.07);
}

table tbody tr:hover {
		    transition: 0.2s all ease-in-out;
		transform: scale(1.02);
}

</style>

<style>
    .dropstart:hover .dropdown-menu{
        display: block;
    }
    .dropdown-menu{
        margin-top: 0;
    }
</style>
<script>
$(document).ready(function(){
    $(".dropstart").hover(function(){
        var dropdownMenu = $(this).children(".dropdown-menu");
        if(dropdownMenu.is(":visible")){
            dropdownMenu.parent().toggleClass("open");
        }
    });
});     
</script>




<nav class="navbar navbar-expand-lg" style="background-color: #7a7a7a">
  <div class="container-fluid">
 			<div class="col-md-6 d-flex offset-2"> 
 			<form  class="d-flex text-center" action="search.jsp" method="POST">
		        <input class="form-control me-2" type="search" name="ch" placeholder="Search" aria-label="Search">
		        <button class="btn btn-primary" type="submit">Search</button>
			</form>
  			</div>
           <%
        	User user = (User) session.getAttribute("user");
        if(user == null)
        {%>

	  	 <form class="d-flex text-center">
			<a type="button" class="btn btn-primary" data-bs-toggle="modal"
			 data-bs-target="#staticBackdrop"><i class="fas fa-sign-in-alt"></i> Login</a>
			<a href="register.jsp" class="btn btn-warning mx-1"><i class="fas fa-user-circle"></i> Register</a>
		</form>
        	
        <%}
        else
        {%>
		<form class="d-flex text-center"> 
			 
		    <img alt="" src="Userprofile/<%= user.getPhoto()%>" 		    		
		    style="
		     width: 40px;
		     height: 40px;
		     border-radius: 20px;
		    ">   
			<a href="login.jsp" class="btn btn-success mx-3" ><i class="fas fa-user"></i> <%= user.getName() %></a>
			<a href="userlogout" class="btn btn-danger mx-0"><i class="fas fa-sign-out-alt"></i> Logout</a>
	      </form>
        <%}
        
        %>


    </div>
</nav>




<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">E-Books</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
          <a class="nav-link active navList" aria-current="page" href="index.jsp">Home</a>
        </li>
              
        <li class="nav-item">
          <a class="nav-link active navList" aria-current="page" href="allRecentBooks.jsp">Recent Books</a>
        </li>
              
        <li class="nav-item">
          <a class="nav-link active navList" aria-current="page" href="allNewBooks.jsp">New Books</a>
        </li>
      
        <li class="nav-item">
          <a class="nav-link active navList" aria-current="page" href="allOldBooks.jsp">Old Books</a>
        </li>
        

      </ul>
	   	  <form class="d-flex">
	   	  <%
	   	  
	   	  	if(user != null)
	   	  	{
	   	  		%>

	   	  	<div class="nav-item dropstart mx-2">
	   	  	<a href="cart.jsp" class="btn btn-outline-success mycart dropdown-toggle"
	   	  	 data-toggle="dropdown">View Cart
			<i class="fas fa-cart-arrow-down "></i>
			</a>    
			    <div class="dropdown-menu dropdown-menu-dark ">
				<div class="table-responsive p-4">
					<h5 class="text-center text-light">Your Cart Products</h5>             	            	  
				        <table class="table table-striped table-sm  align-items-center text-center text-light">				        
				          <thead>
				            <tr>				
				              <th >Name</th>
				              <th >Product</th>
				              <th >Price</th>
				              <th >Action</th>
				            </tr>
				          </thead>
				          <tbody>
				          <%
				          User u = (User) session.getAttribute("user");
				          
				          CartDAO dao = new CartDAO(DBConnection.getConnection());
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
					              <td class="text-light"><%= c.getPrice() %></td>
					              <td><a href="cart.jsp" class="btn btn-danger btn-sm">View</a></td>
					            </tr>	             	            	  
					        	  <%        	
					          }
					          %>	
					               <tr class="text-light">
					              <th class="text-light">Total Price:</th>
					              <td class="text-light">~</td>
					              <td class="text-light">~</td>
					              <th class="text-light">Rs. <%=totalDouble %></th>
					            </tr>            
				          </tbody>
				          
				        </table>
				      </div>
		            </div>     
  				 </div>
  				 
  				 
  				 
  				 
	   	  		<div class="nav-item dropstart mx-3">
		   	  	<a class="btn btn-outline-warning mycart dropdown-toggle"
		   	  	 data-toggle="dropdown"><i class="fas fa-user"></i> <%= user.getName() %></a>    
			    	  <ul class="dropdown-menu dropdown-menu-dark">
					    <li><a class="dropdown-item" href="userProfile.jsp"><i class="fas fa-user"></i> My Profile</a></li>
					    <li><hr class="dropdown-divider"></li>
					    <li><a class="dropdown-item" href="myOrders.jsp?ue=<%= user.getEmail() %>"><i class="fas fa-archive"></i> My Orders</a></li>
					    <li><hr class="dropdown-divider"></li>
					    <li><a class="dropdown-item" href="sellBook.jsp"><i class="fas fa-book"></i> Sell Book</a></li>
					    <li><hr class="dropdown-divider"></li>
					    <li><a class="dropdown-item" href="#"><i class="fas fa-heart"></i> Whishlist</a></li>
					    <li><hr class="dropdown-divider"></li>
					    <li><a class="dropdown-item" href="#"><i class="fas fa-users-cog"></i> Setting</a></li>
					    <li><hr class="dropdown-divider"></li>
					    <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
					  </ul>
			</div>
	   	  		

			   	
	   	  		<%
	   	  		
	   	  	}
	   	  
	   	  %> 	  
		     <a href="#" class="btn btn-outline-info">Contact US</a>
	      </form>

    </div>
  </div>
</nav>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-body">
			<h4 class="text-center my-3" style="">Login Now</h4>
			<form action="userlogin" class="row g-3" method="post">
			  <div class="col-md-12">
			    <label for="validationDefaultUsername" class="form-label">Username</label>
			    <div class="input-group">
			      <span class="input-group-text" id="inputGroupPrepend2">@</span>
			      <input type="text" class="form-control" id="validationDefaultUsername" name="email" aria-describedby="inputGroupPrepend2" required>
			    </div>
			  </div>
			
			
			  
			    <div class="col-md-12">
			    <label for="validationDefault03" class="form-label">Enter Your Password</label>
			    <input type="password" class="form-control" name="password" id="validationDefault03" required>
			  </div>
			  
			
			    <div class="col-md-6">
			    <a class="nav-link text-center" href="register.jsp">Create New Account</a>
			  </div>
			  
			   <div class="col-md-6">
			    <a class="nav-link text-center" href="#">Forget Password?</a>
			   </div>
			  
			  <div class="col-md-6 offset-4">
			    <button class="btn btn-primary" type="submit" style="">Login</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" >Close</button>
			  </div>

			</form>



		</div>
		
		</div>
	</div>
</div>
<%

String invalid= (String) session.getAttribute("invalid");
String Logout= (String) session.getAttribute("Logout");


if(invalid != null){
	
	%>
		<div class="alert alert-primary" role="alert">
		  <%=invalid%>
		</div>
	<%
	session.removeAttribute("invalid");
}
if(Logout != null){
	
	%>
		<div class="alert alert-primary" role="alert">
		  <%=Logout%>
		</div>
	<%
	session.removeAttribute("Logout");
}

%>
<%
String msg2 = (String) session.getAttribute("msg2");

if(msg2 != null){
	%>
			<div class="alert alert-primary my-1" role="alert">
		  	<%=msg2%>
			</div>
	<%
	session.removeAttribute("msg2");
}

%>