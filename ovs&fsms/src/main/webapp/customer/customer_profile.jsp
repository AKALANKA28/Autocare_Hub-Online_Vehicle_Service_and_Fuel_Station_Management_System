<%@page import="com.entity.Customer"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mechanic Dashboard</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<link href="../component2/css/bootstrap.min.css" rel="stylesheet">
 <link href="../component2/css/style.css" rel="stylesheet">

</head>
<body>
	<c:if test="${empty cusObj }">
		<c:redirect url="customer_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<p class="text-center fs-3">Customer Dashboard</p>

	<%
	Customer c = (Customer) session.getAttribute("cusObj");
			CustomerDao dao = new CustomerDao(DBConnect.getConnection());
	%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
				<a href="../feedback/feedback.jsp" style="text-decoration: none;">
					<div class="card-body text-center text-primary">
						<i class="fa fa-book fa-3x"></i><br>
						<p class="fs-4 text-center">
							Add Feedback & Complain 
						</p>
					</div>
				</a>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
				<a href="../appointment/view_appointment.jsp" style="text-decoration: none;">
					<div class="card-body text-center text-primary">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							View Appointment <br>
						
						</p>
					</div>
				</a>
				</div>
			</div>

		</div>
	</div>
</body>
</html>