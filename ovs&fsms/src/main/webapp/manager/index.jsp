<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.MechanicDao"%>
<%@page import="com.feedback.FeedbackDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="../component2/css/bootstrap.min.css" rel="stylesheet">
<link href="../omponent2/css/style.css" rel="stylesheet">
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${ empty adminObj }">
		<c:redirect url="manager_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<p class="text-center fs-3">Manager Dashboard</p>
	
		<%
		MechanicDao dao = new MechanicDao(DBConnect.getConnection());
		%>
		<%
		FeedbackDao dao2 = new FeedbackDao(DBConnect.getConnection());
		%>
		<div class="row">
			<div class="col-md-4">
				
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                 <a href="view_mechanic.jsp" style="text-decoration: none;">
                    <i class="fa fa-tools fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        Mechanic <br><%=dao.countMechanic()%>
                    </p>
                    </a>
                </div>
            </div>
             
		</div>



			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
					 <a href="view_customer.jsp" style="text-decoration: none;">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							Customer <br><%=dao.countCustomer()%>
						</p>
						</a>
					</div>
				</div>
				
			</div>

			<div class="col-md-4">
		
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<a href="customer.jsp" style="text-decoration: none;">
						<i class="fa fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao.countAppointment()%>
						</p>
						</a>
					</div>
				</div>
				
			</div>

			<div class="col-md-4 mt-2">
				<div class="card paint-card " >
					<div class="card-body text-center text-success">
						<a href="../adminindex.jsp" style="text-decoration: none;">
						<i class="fa fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center"> Inventory </p>
					    
						</a>
					</div>
					
				</div>
				
			</div>
			
			<div class="col-md-4 mt-2">
				<div class="card paint-card " >
					<div class="card-body text-center text-success">
						<a href="../manager/view_cus_feedback.jsp" style="text-decoration: none;">
						<i class="fa fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">Customer Feedback</p>
						</a>
					</div>	
				</div>		
			</div>
			
			<div class="col-md-4 mt-2">
				<div class="card paint-card " >
					<div class="card-body text-center text-success">
						<a href="../manager/view_emp_feedback.jsp" style="text-decoration: none;">
						<i class="fa fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">Employee Feedback</p>
						</a>
					</div>	
				</div>		
			</div>
			

		</div>
	</div>






</body>
</html>