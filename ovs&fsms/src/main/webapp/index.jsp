<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autocare Hub</title>
<link href="component2/css/bootstrap.min.css" rel="stylesheet">
<link href="component2/css/style.css" rel="stylesheet">

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>
<body>
	<%@include file="component2/navbar.jsp"%>
	
	

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/carousel-bg-2.jpg" class="d-block w-100" alt="..."height="800px">
				<div class="carousel-caption d-flex align-items-center">
                        <div class="container">
                            <div class="row align-items-center justify-content-center justify-content-lg-start">
                                <div class="col-10 col-lg-7 text-center text-lg-start">
                                    
                                    <h1 class="display-3 text-white mb-4 pb-3 ">Qualified Car Repair Service Center</h1>
                                    <a href="" class="btn btn-primary py-3 px-5">Learn More<i class="fa fa-arrow-right ms-3"></i></a>
                                </div>
                                <div class="col-lg-5 d-none d-lg-flex ">
                                    <img class="img-fluid" src="img/carousel-1.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
			</div>
			
			</div>
		</div>
	
	



    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4 col-md-6" >
                    <div class="d-flex py-5 px-4">
                        <i class="fa fa-certificate fa-3x text-primary "></i>
                        <div class="ps-4">
                            <h5 class="mb-3">Quality Servicing</h5>
                            <p> We don't just maintain cars, we nurture trust and reliability.</p>
                            <a class="text-secondary border-bottom" href="">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6" >
                    <div class="d-flex bg-light py-5 px-4">
                        <i class="fa fa-users-cog fa-3x text-primary "></i>
                        <div class="ps-4">
                            <h5 class="mb-3">Expert Workers</h5>
                            <p>We pride ourselves on providing the highest standard of vehicle care and maintenance. </p>
                            <a class="text-secondary border-bottom" href="">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6" >
                    <div class="d-flex py-5 px-4">
                        <i class="fa fa-tools fa-3x text-primary "></i>
                        <div class="ps-4">
                            <h5 class="mb-3">Modern Equipment</h5>
                            <p>Equipped with state-of-the-art tools and technology to provide efficient and comprehensive automotive maintenance and repair services.</p>
                            <a class="text-secondary border-bottom" href="">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->
	
    <!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 pt-4" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="img/about.jpg" style="object-fit: cover;" alt="">
                        <div class="position-absolute top-0 end-0 mt-n4 me-n4 py-4 px-5" style="background: rgba(0, 0, 0, .08);">
                            <h1 class="display-4 text-white mb-0">15 <span class="fs-4">Years</span></h1>
                            <h4 class="text-white">Experience</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <h6 class="text-primary text-uppercase">// About Us //</h6>
                    <h1 class="mb-4"><span class="text-primary">CarServ</span> Is The Best Place For Your Auto Care</h1>
                    <p class="mb-4">TA Vehicle Diagnostic Test is an essential tool for modern vehicles, offering a comprehensive view of your vehicle's health and performance. It's always advisable to have your vehicle checked periodically to ensure it runs smoothly and safely.</p>
                    <div class="row g-4 mb-3 pb-3">
                        <div class="col-12">
                            <div class="d-flex">
                                <div class="bg-light d-flex flex-shrink-0 align-items-center justify-content-center mt-1" style="width: 45px; height: 45px;">
                                    <span class="fw-bold text-secondary">01</span>
                                </div>
                                <div class="ps-3">
                                    <h6>Professional & Expert</h6>
                                    <span>Diam dolor diam ipsum sit amet diam et eos</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="d-flex">
                                <div class="bg-light d-flex flex-shrink-0 align-items-center justify-content-center mt-1" style="width: 45px; height: 45px;">
                                    <span class="fw-bold text-secondary">02</span>
                                </div>
                                <div class="ps-3">
                                    <h6>Quality Servicing Center</h6>
                                    <span>on to future generations, </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 wow">
                            <div class="d-flex">
                                <div class="bg-light d-flex flex-shrink-0 align-items-center justify-content-center mt-1" style="width: 45px; height: 45px;">
                                    <span class="fw-bold text-secondary">03</span>
                                </div>
                                <div class="ps-3">
                                    <h6>Awards Winning Workers</h6>
                                    <span>Drive Confident with the Toyota “Rush”s</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="" class="btn btn-primary py-3 px-5">Read More<i class="fa fa-arrow-right ms-3"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
    


<%@include file="component2/footer.jsp" %>

</body>
</html>