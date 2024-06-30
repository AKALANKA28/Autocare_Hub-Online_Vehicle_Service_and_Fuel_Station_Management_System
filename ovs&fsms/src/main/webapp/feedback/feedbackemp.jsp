
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Mechanic"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../component2/css/bootstrap.min.css" rel="stylesheet">
<link href="../component2/css/style.css" rel="stylesheet">

<title>Add Feedback</title>
<style type="text/css">

.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/bg-1.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
<%@include file="navbar.jsp"%>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">Add Feedback</p>
						
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
        <form class="row g-3" action="../addFeedback" method="post">
        
         <div class="col-md-6">
            <label for="feedbackType" class="form-label" >Feedback Type:</label>
            <select name="feedbackType" id="feedbackType" class="form-control" name="feedbackType" onchange="showRelevantFields(this.value)">
                <option value="Customer">Customer</option>
                <option value="Employee">Employee</option>
            </select>
        </div>
          
            <input type="hidden" name="userid" value="${mechObj.id }">
          
            <div class="col-md-6">
                <label for="timestamp" class="form-label" >Timestamp:</label>
                <input type="datetime-local" class="form-control" name="timestamp" required>
            </div>

            <!-- Customer Feedback -->
            <div class="col-md-6" id="customerFeedbackFields">
                <div>
                    <label for="rating" class="form-label" >Rating (1-5):</label>
                    <input type="number" class="form-control" name="rating" min="1" max="5">
                </div>
                <div class="col-md-6">
                    <label for="serviceType" class="form-label" >Service Type:</label>
                    <select name="serviceType" class="form-control">
		                <option value="Vehicle">Vehicle</option>
		                <option value="Fuel">Fuel</option>
		            </select>      
                </div>
            </div>

            <!-- Employee Feedback -->
            <div class="col-md-6" id="employeeFeedbackFields" style="display: none;">
                <div>
                    <label for="category" class="form-label">Feedback Category:</label>
                    <select name="category" class="form-control">
		                <option value="Customer">Salary</option>
		                <option value="Employee">Safety</option>
		                <option value="Customer">Work Environment</option>
		                <option value="Employee">Customer Related Issues</option>
		            </select>
                </div>
                <div class="col-md-6">
                    <label for="department" class="form-label">Department:</label>
                   <select name="department" class="form-control">
                     <option value="Service">Service</option>
		             <option value="Fuel">Fuel</option>
                </select>
            </div>
          </div>  
              <div >
                <label for="message" class="form-label">Message:</label>
                <textarea name="message" class="form-control" required></textarea>
              </div>
            
            <c:if test="${empty mechObj }">
				<a href="../mechanic/mechanic_login.jsp" class="col-md-6 offset-md-3 btn btn-primary">Submit</a>
			</c:if>

			<c:if test="${not empty mechObj }">
				<button class="col-md-6 offset-md-3 btn btn-primary" value="Add Feedback">Submit</button>
			</c:if>
            
            
        </form>
    </div>
    				</div>
				</div>
			</div>
		</div>
<%@include file="../component2/footer.jsp"%>


    <script>
        function showRelevantFields(feedbackType) {
            if (feedbackType === 'Customer') {
                document.getElementById('customerFeedbackFields').style.display = 'block';
                document.getElementById('employeeFeedbackFields').style.display = 'none';
            } else {
                document.getElementById('employeeFeedbackFields').style.display = 'block';
                document.getElementById('customerFeedbackFields').style.display = 'none';
            }
        }
    </script>

</body>
</html>