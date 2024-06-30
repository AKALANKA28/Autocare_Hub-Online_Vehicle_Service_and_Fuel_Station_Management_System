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
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Mechanic Details</p>
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
										MechanicDao dao2 = new MechanicDao(DBConnect.getConnection());
										Mechanic m = dao2.getMechanicById(id);
						%>


						<form action="../updateMechanic" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="<%=m.getFullName()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									value="<%=m.getDob()%>" required name="dob"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									value="<%=m.getQualification()%>" name="qualification"
									type="text" class="form-control">
							</div>
							

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									value="<%=m.getEmail()%>" required name="email"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									value="<%=m.getMobNo()%>" required name="mobno"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									value="<%=m.getPassword()%>" name="password" type="text"
									class="form-control">
							</div>
							<input type="hidden" name="id" value="<%=m.getId()%>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>




		</div>
	</div>
</body>
</html>