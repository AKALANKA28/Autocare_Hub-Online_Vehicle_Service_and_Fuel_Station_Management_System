<%@page import="com.entity.Mechanic"%>
<%@page import="com.dao.MechanicDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mechanic Details</title>
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
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Mechanic Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						 <a href="mechanic.jsp" class="btn btn-sm btn-primary">Add Mechanic</a>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								MechanicDao dao2 = new MechanicDao(DBConnect.getConnection());
								List<Mechanic> list2 = dao2.getAllMechanic();
								for (Mechanic m : list2) {
								%>
								<tr>
									<td><%=m.getFullName()%></td>
									<td><%=m.getDob()%></td>
									<td><%=m.getQualification()%></td>
									<td><%=m.getEmail()%></td>
									<td><%=m.getMobNo()%></td>
									<td>
									
									
									<a href="edit_mechanic.jsp?id=<%=m.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> 
										
										<a
										href="../deleteMechanic?id=<%=m.getId()%>"
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

		</div>
	</div>
</body>
</html>