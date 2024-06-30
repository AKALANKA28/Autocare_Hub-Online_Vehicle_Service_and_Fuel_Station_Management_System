<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.dao.MechanicDao"%>
<%@page import="com.entity.Mechanic"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Appointment</title>
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
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Appointment Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<%
							int id = Integer.parseInt(request.getParameter("id"));
							AppointmentDao dao2 = new AppointmentDao(DBConnect.getConnection());
							Appointment ap = dao2.getAppointmentById(id);
	
						%>

						<form action="../updateAppointment" method="POST">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">First Name</label> 
								<input required type="text" class="form-control" name="firstname" value="${ap.firstName}">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Last Name</label> 
								<input required type="text" class="form-control" name="lastname" value="${ap.lastName}">
							</div>
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Mobile No</label> 
								<input required type="text" class="form-control" name="phno" value="${ap.phno}">
							</div>
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> 
								<input required type="text" class="form-control" name="email" value="${ap.email}">
							</div>
							
														
							 <div class="col-md-6">
								<label for="inputEmail4" class="form-label">Preferred Date</label> 
								<input type="date" class="form-control" required name="appoint_date" value="${ap.appoinDate}">
							</div>	
							
							<div class="col-md-6">
								<label>Preferred Time </label> 
								<select class="form-control" name="time" required>
									<option value="">Select Preferred Time</option>
									<option value="10" <%= "10".equals(ap.getAppointTime()) ? "selected" : "" %>>10.00 A.M.</option>
									<option value="11" <%= "11".equals(ap.getAppointTime()) ? "selected" : "" %>>11.00 A.M.</option>
									<option value="12" <%= "12".equals(ap.getAppointTime()) ? "selected" : "" %>>12.00 A.M.</option>
									
								</select>
							</div>
							
							<div class="col-md-6">
								<label>Preferred Location </label> 
								<select class="form-control" name="location" required>
									<option value="">Select Preferred Location</option>
									<option value="Homagama" <%= "Homagama".equals(ap.getLocation()) ? "selected" : "" %>>Homagama</option>
									<option value="Anuradhapura" <%= "Anuradhapura".equals(ap.getLocation()) ? "selected" : "" %>>Anuradhapura</option>
									<option value="Wattala" <%= "Wattala".equals(ap.getLocation()) ? "selected" : "" %>>Wattala</option>
									<option value="Maharagama" <%= "Maharagama".equals(ap.getLocation()) ? "selected" : "" %>>Maharagama</option>
									<option value="Negombo" <%= "Negombo".equals(ap.getLocation()) ? "selected" : "" %>>Negombo</option>
									<option value="Ampara" <%= "Ampara".equals(ap.getLocation()) ? "selected" : "" %>>Ampara</option>
									<option value="Rathnapura" <%= "Rathnapura".equals(ap.getLocation()) ? "selected" : "" %>>Rathnapura</option>
									
								</select>
							</div>
			               			
							

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Vehicle Registration No</label> 
								<input required type="number" class="form-control" value="${ap.vehicleRegNo}" name="regno">
							</div>
							
							
							<div class="col-md-6">
							<label for="inputEmail4" class="form-label">Mileage</label>
								<input maxlength="10" required type="number" class="form-control" value="${ap.mileage}" name="mileage">

							</div>
							
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Unit</label> 
								<select required class="form-control" name="mech">
									<option value="">--select--</option>
									<%
										MechanicDao dao = new MechanicDao(DBConnect.getConnection());
										List<Mechanic> list = dao.getAllMechanic();
										for (Mechanic m : list) {
									%>
									<option value="<%=m.getId()%>" <%= m.getId() == ap.getMechanicId() ? "selected" : "" %>>
									   <%=m.getFullName()%>
									</option>
									<%
										}
									%>
								</select>
							</div>
							<div class="col-md-12">
								<label>Message</label>
								<textarea required name="message" class="form-control" rows="3" cols="">${ap.message}</textarea>
							</div>
							<input type="hidden" name="id" value="${ap.id}">
							<input type="hidden" name="userid" value="${ap.userId}">

						    <button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
