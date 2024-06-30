<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.MechanicDao"%>
<%@page import="com.entity.Mechanic"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>


<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>


<link href="../component2/css/bootstrap.min.css" rel="stylesheet">
<link href="../component2/css/style.css" rel="stylesheet">
<style type="text/css">

.paint-card {
 box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
 background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
  url("img/.jpg");
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
    <img alt="" src="img/.jpg">
   </div>

   <div class="col-md-6">
    <div class="card paint-card">
     <div class="card-body">
      <p class="text-center fs-3">User Appointment</p>
      
      
      <c:if test="${not empty errorMsg}">
       <p class="fs-4 text-center text-danger">${errorMsg}</p>
       <c:remove var="errorMsg" scope="session" />
      </c:if>
      <c:if test="${not empty succMsg}">
       <p class=" fs-4 text-center text-success">${succMsg}</p>
       <c:remove var="succMsg" scope="session" />
      </c:if>
      <form class="row g-3" action="../addAppointment" method="post">

       <input type="hidden" name="userid" value="${cusObj.id }">

       <div class="col-md-6">
        <label for="inputEmail4" class="form-label">First Name</label> 
        <input required type="text" class="form-control" name="firstname">
       </div>

       <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Last Name</label> 
        <input required type="text" class="form-control" name="lastname">
       </div>
       
       
       <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Mobile No</label> 
        <input maxlength="10" required type="number" class="form-control" name="phno">
       </div>
       
       <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Email</label> 
        <input required type="email" class="form-control" name="email">
       </div>
       

       
       
       
       <div class="col-md-6">
        <label>Service Type </label> 
        <select class="form-control" name="type" required>
         <option value="">Select Service Type</option>
         <option value="Free Service">Free Service</option>
         <option value="Warranty Service">Warranty Service</option>
         <option value="General Service">General Service</option>
         <option value="Express Lube">Express Lube</option>
         <option value="Other">Other</option>
         
        </select>
       </div>
       
       
       
       <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Preferred Date</label> 
        <input type="date" class="form-control" required name="appoint_date">
       </div>
       

       <div class="col-md-6">
        <label>Preferred Time </label> 
        <select class="form-control" name="time"
         required>
         <option value="">Select Preferred Time</option>
         <option value="10">10.00 A.M.</option>
         <option value="11">11.00 A.M.</option>
         <option value="12">12.00 A.M.</option>
         
        </select>
       </div>
       
       <div class="col-md-6">
        <label>Preferred Location </label> 
        <select class="form-control" name="location" required>
         <option value="">Select Preferred Time</option>
         <option value="Homagama">Homagama</option>
         <option value="Anuradhapura">Anuradhapura</option>
         <option value="Wattala">Wattala</option>
         <option value="Maharagama">Maharagama</option>
         <option value="Negombo">Negombo</option>
         <option value="Ampara">Ampara</option>
         <option value="Rathnapura">Rathnapura</option>
         
        </select>
       </div>

       <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Vehicle Registration No</label> 
        <input required type="number" class="form-control" name="regno">
       </div>


       <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Mileage</label>
         <input required type="text" class="form-control" name="mileage">
       </div>

       <div class="col-md-6">
        <label for="inputPassword4" class="form-label">Mechanic</label> 
        <select class="form-control" name="mech">
         <option value="">--select--</option>

         <%

          MechanicDao dao = new MechanicDao(DBConnect.getConnection());
          List<Mechanic> list = dao.getAllMechanic();
          for (Mechanic m : list) {
         %>
         <option value="<%=m.getId()%>"><%=m.getFullName()%> 
         </option>
         <%
         }
         %>
         
        </select>
       </div>

       <div class="col-md-12">
        <label>Message</label>
        <textarea required name="message" class="form-control" rows="3" cols=""></textarea>
       </div>

       <c:if test="${empty cusObj }">
        <a href="customer_login.jsp" class="col-md-6 offset-md-3 btn btn-primary">Submit</a>
       </c:if>

       <c:if test="${not empty cusObj }">
        <button class="col-md-6 offset-md-3 btn btn-primary">Submit</button>
         
       </c:if>
      </form>
     </div>
    </div>
   </div>
  </div>

 </div>

<%@include file="../component2/footer.jsp"%>

</body>
</html>