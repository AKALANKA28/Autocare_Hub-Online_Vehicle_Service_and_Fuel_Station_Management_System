<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Details</title>
<link href="../component2/css/bootstrap.min.css" rel="stylesheet">
<link href="../component2/css/style.css" rel="stylesheet">
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Appointment Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Mobile No</th>
							<th scope="col">Email</th>
							<th scope="col">Appointment Date</th>
							<th scope="col">Appointment Time</th>
							<th scope="col">Service Type</th>
							<th scope="col">Location</th>
							<th scope="col">Vehicle Registration No</th>
					     	<th scope="col">Mileage</th>
							<th scope="col">Message</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());
					    List<Appointment> list = dao.getAllAppointment();
						for (Appointment ap : list) {
			
						%>
						<tr>
							<th><%=ap.getFirstName()%> <%=ap.getLastName()%></th>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getEmail()%></td>
							<th><%=ap.getAppoinDate()%></th>
							<td><%=ap.getAppointTime()%></td>
							<td><%=ap.getServiceType()%></td>
							<td><%=ap.getLocation()%></td>
					        <td><%=ap.getVehicleRegNo()%></td> 
							<td><%=ap.getMileage()%></td>
							<td><%=ap.getMessage()%></td>
							<td><%=ap.getStatus()%></td>
						</tr>
						<%
						}
						%>


					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>