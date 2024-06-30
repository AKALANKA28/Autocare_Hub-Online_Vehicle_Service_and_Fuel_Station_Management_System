<%@page import="com.entity.Customer"%>
<%@page import="com.entity.Mechanic"%>
<%@page import="com.dao.MechanicDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View My Appointment</title>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.card {
    position: absolute;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: 0.25rem}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

</style>


 <link href="../component2/css/bootstrap.min.css" rel="stylesheet">
 <link href="../component2/css/style.css" rel="stylesheet">
</head>
<body>

	<%@include file="navbar.jsp"%>
	<c:if test="${empty cusObj }">
		<c:redirect url="customer_login.jsp"></c:redirect>
	</c:if>
	

	
	<div class="ontainer-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Appointment List</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">First Name</th>
									<th scope="col">Last Name</th>
									<th scope="col">Phone No</th>
									<th scope="col">Email</th>
									<th scope="col">Service Type</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Time</th>
									<th scope="col">Location</th>
									<th scope="col">Vehicle Registration No </th>
									<th scope="col">Mileage</th>
									<th scope="col">Unit</th>
									<th scope="col">Message</th>
									<th scope="col">Mechanic Name</th>
									<th scope="col">Status</th>

								</tr>
							</thead>
							<tbody>
								<%

										Customer cus = (Customer) session.getAttribute("cusObj");
										AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());
										MechanicDao dao2 = new MechanicDao(DBConnect.getConnection());
										
										List<Appointment> list = dao.getAllAppointmentByLoginCustomer(cus.getId());
										for (Appointment ap : list) {
											Mechanic m = dao2.getMechanicById(ap.getMechanicId());
								%>
								<tr>
									<th><%=ap.getFirstName()%></th>
									<th><%=ap.getLastName()%></th>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getServiceType()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getAppointTime()%></td>
									<td><%=ap.getLocation()%></td>
									<td><%=ap.getVehicleRegNo()%></td>
									<td><%=ap.getMileage()%></td>
									<td><%=ap.getMessage()%></td>
									
									
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
										} else {
										%> <%=ap.getStatus()%> <%
										}
										%>
										<td><a href="edit_appointment.jsp?id=<%=ap.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> 
										
										<a
										href="../deleteAppointment?id=<%=ap.getId()%>"
										class="btn btn-sm btn-danger">Delete</a>
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

			<div class="col-md-3 p-3">
				<img alt="" src="img/.jpg">
			</div>
		</div>
	</div>


</body>
</html>