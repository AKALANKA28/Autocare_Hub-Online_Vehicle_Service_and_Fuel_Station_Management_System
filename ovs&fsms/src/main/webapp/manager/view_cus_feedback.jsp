<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.feedback.CustomerFeedback"%>
<%@page import="java.util.List"%>
<%@page import="com.feedback.FeedbackDao"%>
<%@page import="com.db.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Feedback</title>
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
						<p class="fs-3 text-center">Customer Feedback</p>
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
                <th scope="col">User ID</th>
                <th scope="col">Timestamp</th>
                <th scope="col">Message</th>
                <th scope="col">Rating</th>
                <th scope="col">Service Type</th>
            </tr>
        </thead>
        <tbody>
            <%
                FeedbackDao dao = new FeedbackDao(DBConnect.getConnection());
                List<CustomerFeedback> feedbacks = dao.getAllCustomerFeedback();

                for(CustomerFeedback feedback : feedbacks) {
            %>
                <tr>
            
                    <td><%= feedback.getUserID() %></td>
                    <td><%= feedback.getTimestamp() %></td>
                    <td><%= feedback.getMessage() %></td>
                    <td><%= feedback.getRating() %></td>
                    <td><%= feedback.getServiceType() %></td>
                   <td>
				    <form action="../deleteFeedback" method="post">
				        <input type="hidden" name="id" value="<%=feedback.getId()%>">
				        <input type="submit" value="Delete" class="btn btn-sm btn-danger">
				    </form>
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
