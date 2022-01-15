<%@page import="com.entity.User"%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
  
 			<div class="col-md-4 d-flex offset-4"> 
 			<form class="d-flex text-center" action="search.jsp">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		        <button class="btn btn-outline-success" type="submit">Search</button>
		    </form>
  			</div>
           <%
        	User user = (User) session.getAttribute("user");
        if(user == null)
        {%>

	  	 <form class="d-flex text-center">
			<a href="login.jsp" class="btn btn-primary mx-3 ">Login</a>
			<a href="register.jsp" class="btn btn-primary mx-3">Register</a>
		</form>
        	
        <%}
        else
        {%>
		<form class="d-flex" style="float: right;">     
		    <img alt="Loading" src="Userprofile/<%= user.getPhoto()%>" 
		    style="
		     width: 40px;
		     height: 40px;
		     border-radius: 20px;
		    ">   
			<a href="login.jsp" class="btn btn-primary mx-3" ><%= user.getName() %></a>
			<a href="userlogout" class="btn btn-primary mx-0">Logout</a>
	      </form>
        <%}
        
        %>


    </div>
  </div>
</nav>




<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">E-Books</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
              
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Recent Books</a>
        </li>
              
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">New Books</a>
        </li>
      
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Old Books</a>
        </li>
        

      </ul>
	   	  <form class="d-flex">
		     <a href="#" class="btn btn-light mx-3">Setting</a>
		     <a href="#" class="btn btn-light">Contact US</a>
	      </form>

    </div>
  </div>
</nav>