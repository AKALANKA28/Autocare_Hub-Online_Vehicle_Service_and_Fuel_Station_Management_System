<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Mechanic"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="../component2/css/bootstrap.min.css" rel="stylesheet">
<link href="../component2/css/style.css" rel="stylesheet">
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty mechObj }">
		<c:redirect url="mechanic_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Customer Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Email</th>
									<th scope="col">Service Type</th>
									<th scope="col">Date</th>
									<th scope="col">Time</th>
									<th scope="col">Vehicle Registration No</th>
									<th scope="col">Mileage</th>
									<th scope="col">Message</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Mechanic m = (Mechanic) session.getAttribute("mechObj");
							    AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());
								List<Appointment> list = dao.getAllAppointmentByMechanicLogin(m.getId());
								for (Appointment ap : list) {
								%>
								<tr>
									<th><%=ap.getFirstName()%> <%=ap.getLastName()%></th>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getServiceType()%></td>
									<th><%=ap.getAppoinDate()%></th>
									<td><%=ap.getAppointTime()%></td>
									
							<%-- 	<td><%=ap.getLocation()%></td> --%>
							 	    <td><%=ap.getMechanicId()%></td> 
							
									<td><%=ap.getVehicleRegNo()%></td> 
									<td><%=ap.getMileage()%></td>
									
						    <%--	<td><%=ap.getUnit()%></td> --%>
						    
									<td><%=ap.getMessage()%></td>
									<td><%=ap.getStatus()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> 
										<a href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-success btn-sm">Comment</a>
										 <%
										 } else {
										 %> 
										 <a href="#" class="btn btn-success btn-sm disabled">Comment</a> 
										 <%
										 }
										 %>
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

		</div>
	</div>



</body>
</html>