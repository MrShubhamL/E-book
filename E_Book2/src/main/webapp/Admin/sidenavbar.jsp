<%@page import="com.entity.Admin"%>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
                 <%
        Admin admin = (Admin) session.getAttribute("userObj");
        if(admin != null)
        {%>	
	        <li class="nav-item" >
	         <img alt="" src="../AdminProfile/<%= admin.getAdminPhoto()%>"
	         style="
		     width: 40px;
		     height: 40px;
		     border-radius: 20px;
		    ">
	         <a class="btn btn-success"><%= admin.getAdminName() %></a>
	        </li>
        <%}
        else
        {
        %>
          <li >
            <a class="nav-link" aria-current="page" href="home.jsp">
              <span data-feather="home"></span>
              Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="orders.jsp">
              <i class="fas fa-cart-plus"></i>
              Orders
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="allBooks.jsp">
              <i class="fas fa-book-open"></i>
              All New Books
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="allBooks.jsp">
              <i class="fas fa-book-open"></i>
              All Old Books
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="addBook.jsp">
              <i class="fas fa-book"></i>
              Add Book
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="AdminRegister.jsp">
             <i class="fas fa-user-shield"></i>
              Add New Admin
            </a>
          </li>
        </ul>
        <%
        }
        
        %>
       
        <ul>
          <li>
            <a class="nav-link" aria-current="page" href="home.jsp" >
              <span data-feather="home"></span>
              Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="orders.jsp">
              <i class="fas fa-cart-plus"></i>
              Orders
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="allBooks.jsp">
              <i class="fas fa-book-open"></i>
              All New Books
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="allOldBooks.jsp">
              <i class="fas fa-book-open"></i>
              All Old Books
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="addBook.jsp">
              <i class="fas fa-book"></i>
              Add Book
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="AdminRegister.jsp">
             <i class="fas fa-user-shield"></i>
              Add New Admin
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="link-secondary" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul>
      </div>
    </nav>