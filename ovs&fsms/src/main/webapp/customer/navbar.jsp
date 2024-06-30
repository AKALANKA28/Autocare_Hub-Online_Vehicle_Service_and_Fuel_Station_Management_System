<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@600;700&family=Ubuntu:wght@400;500&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <style>
    .user-dropdown .dropdown-menu {
   background-color: #fff; /* Background color */
   border: 1px solid #ddd; /* Border */
}

.user-dropdown .dropdown-menu a {
   color: #333; /* Text color */
}
    
    </style>
</head>

<body>
   



    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">Autocare Hub</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="../index.jsp" class="nav-item nav-link active">Home</a>
                <a href="../about.jsp" class="nav-item nav-link">About</a>
                <a href="../service.jsp" class="nav-item nav-link">Services</a>
              
                <a href="../contact.jsp" class="nav-item nav-link">Contact</a>
            </div>
           
            <a href="appointment/customer_appointment.jsp" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Book Now<i class="fa fa-arrow-right ms-3"></i></a>
             <div class="dropdown user-dropdown">
			   <a class="nav-link dropdown-toggle" href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
			      <i class="fa fa-user user-icon"></i>${cusObj.fullName }
			   </a>
			   <ul class="dropdown-menu" aria-labelledby="userDropdown">
			      <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
			      <li><a class="dropdown-item" href="../customerLogout">Logout</a></li>      
			      <li><a class="dropdown-item" href="../DeleteCustomer?id=${cusObj.id}">Delete Profile</a></li> 
			   </ul>
			</div>

        </div>
    </nav>
    <!-- Navbar End -->


  




    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>
