<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="Components/allScripts.jsp" %>
</head>
<body class="bg-dark">
<%@ include file="Components/navbar.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-8 offset-2">
<div class="card my-4" style="margin-top: 50px;background-color:#575757;">
<div class="card-body text-light">
<h4 class="text-center my-3" style="">Registration</h4>
<%
String Successfull = (String) session.getAttribute("Successfull");
String Error= (String) session.getAttribute("Error");

if(Successfull != null){
	%>
		<h5 class="text-success text-center"><%=Successfull%></h5>
	<%
	session.removeAttribute("Successfull");
}
if(Error != null){
	
	%>
		<h5 class="text-success text-center"><%=Error%></h5>
	<%
	session.removeAttribute("Error");
}

%>
<form action="userregister" class="row g-3" method="post" enctype="multipart/form-data">

  <div class="col-md-4">
    <label for="validationDefault01" class="form-label">Enter Your Name</label>
    <input type="text" style="background-color:#575757 " class="form-control text-light" id="validationDefault01" name="name" required>
  </div>

  <div class="col-md-4">
    <label for="validationDefaultUsername" class="form-label">Enter Your Email</label>
    <div class="input-group">
      <span class="input-group-text" id="inputGroupPrepend2">@</span>
      <input type="text" style="background-color:#575757 " class="form-control text-light" id="validationDefaultUsername" name="email" aria-describedby="inputGroupPrepend2" required>
    </div>
  </div>

  <div class="col-md-4">
    <label for="validationDefault01" class="form-label">Enter Your Contact Number</label>
    <input type="text" style="background-color:#575757 " class="form-control text-light" id="validationDefault01" name="contact" required>
  </div>
  
    <div class="col-md-4">
    <label for="validationDefault03" class="form-label">Create Your Password</label>
    <input type="password" style="background-color:#575757 " class="form-control text-light" name="password" id="validationDefault03" required>
  </div>
  
  	<div class="col-md-4">
	  <label for="formFile" class="form-label">Default file input example</label>
	  <input class="form-control text-light" style="background-color:#575757 " name="myimg" type="file" id="formFile">
	</div>
	
	    <div class="col-md-4">
    <label for="validationDefault05" class="form-label">Enter Your Address</label>
    <input type="text" class="form-control text-light" style="background-color:#575757 " name="address" id="validationDefault05" required>
  </div>
	    <div class="col-md-4">
    <label for="validationDefault06" class="form-label">Enter Your Landmark</label>
    <input type="text" class="form-control" style="background-color:#575757 " name="landmark" id="validationDefault06" required>
  </div>
	    <div class="col-md-4">
    <label for="validationDefault07" class="form-label">Enter Your City</label>
    <input type="text" class="form-control text-light" style="background-color:#575757 " name="city" id="validationDefault07" required>
  </div>
	    <div class="col-md-4">
    <label for="validationDefault08" class="form-label">Enter Your State</label>
    <input type="text" class="form-control text-light" style="background-color:#575757 " name="state" id="validationDefault08" required>
  </div>
	    <div class="col-md-4">
    <label for="validationDefault09" class="form-label">Enter Your Pin</label>
    <input type="text" class="form-control text-light" style="background-color:#575757 " name="zip" id="validationDefault09" required>
  </div>
  
  <div class="col-md-12">
    <div class="form-check">
      <input class="form-check-input" style="background-color:#575757 " type="checkbox" value="" id="invalidCheck2" required>
      <label class="form-check-label text-light" for="invalidCheck2">
        Agree to terms and conditions
      </label>
    </div>
  </div>
  <div class="col-md-4 offset-4">
    <button class="btn btn-primary" type="submit" style="">Register</button>
  </div>
</form>



</div>
</div>
</div>
</div>
</div>

<%@ include file="Components/footer.jsp" %>
</body>
</html>