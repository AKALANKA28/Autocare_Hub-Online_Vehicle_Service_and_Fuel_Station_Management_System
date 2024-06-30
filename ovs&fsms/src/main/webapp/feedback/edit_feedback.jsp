<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
        <h2>Edit Feedback</h2>
        <form action="../updateFeedback" method="post">
          

            <label for="feedbackType">Feedback Type:</label>
            <select name="feedbackType" id="feedbackType" onchange="showRelevantFields(this.value)">
                <option value="Customer" ${feedback.feedbackType == 'Customer' ? 'selected' : ''}>Customer</option>
                <option value="Employee" ${feedback.feedbackType == 'Employee' ? 'selected' : ''}>Employee</option>
            </select>

            <!-- Common fields -->
             <input type="hidden" name="feedbackId" value="${feedback.id}">
             <input type="hidden" name="feedbackId" value="${feedback.userID}"> 
            
            <div>
                <label for="message">Message:</label>
                <textarea name="message" required>${feedback.message}</textarea>
            </div>
            <div>
                <label for="timestamp">Timestamp:</label>
                <input type="datetime-local" name="timestamp" value="${feedback.timestamp}" required>
            </div>

            <!-- Fields specific to Customer Feedback -->
            <div id="customerFeedbackFields" style="${feedback.feedbackType == 'Customer' ? '' : 'display: none;'}">
                <div>
                    <label for="rating">Rating (1-5):</label>
                    <input type="number" name="rating" min="1" max="5" value="${feedback.rating}">
                </div>
                <div>
                    <label for="serviceType">Service Type:</label>
                    <input type="text" name="serviceType" value="${feedback.serviceType}">
                </div>
            </div>

            <!-- Fields specific to Employee Feedback -->
            <div id="employeeFeedbackFields" style="${feedback.feedbackType == 'Employee' ? '' : 'display: none;'}">
                <div>
                    <label for="category">Feedback Category:</label>
                    <input type="text" name="category" value="${feedback.feedbackCategory}">
                </div>
                <div>
                    <label for="department">Department:</label>
                    <input type="text" name="department" value="${feedback.department}">
                </div>
            </div>
            
            <input type="submit" value="Update Feedback">
        </form>
    </div>
    
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