
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%//db connection 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
PreparedStatement ps = con.prepareStatement("select * from parts_inventory");
ResultSet rs = ps.executeQuery(); 
%>

<body>
<%
//allow access only if session exists/logged in
String user = null;
if(session.getAttribute("user") == null){
	response.sendRedirect("./");
}else user = (String) session.getAttribute("user");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}
%>
  
</body>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Inventory Management</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
<link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<link rel="stylesheet" href="resources/dist/css/adminlte.min2167.css?v=3.2.0">
<script nonce="b9737b9b-7648-47d1-93ba-db1b1c5065b6">(function(w,d){!function(j,k,l,m){j[l]=j[l]||{};j[l].executed=[];j.zaraz={deferred:[],listeners:[]};j.zaraz.q=[];j.zaraz._f=function(n){return async function(){var o=Array.prototype.slice.call(arguments);j.zaraz.q.push({m:n,a:o})}};for(const p of["track","set","debug"])j.zaraz[p]=j.zaraz._f(p);j.zaraz.init=()=>{var q=k.getElementsByTagName(m)[0],r=k.createElement(m),s=k.getElementsByTagName("title")[0];s&&(j[l].t=k.getElementsByTagName("title")[0].text);j[l].x=Math.random();j[l].w=j.screen.width;j[l].h=j.screen.height;j[l].j=j.innerHeight;j[l].e=j.innerWidth;j[l].l=j.location.href;j[l].r=k.referrer;j[l].k=j.screen.colorDepth;j[l].n=k.characterSet;j[l].o=(new Date).getTimezoneOffset();if(j.dataLayer)for(const w of Object.entries(Object.entries(dataLayer).reduce(((x,y)=>({...x[1],...y[1]})),{})))zaraz.set(w[0],w[1],{scope:"page"});j[l].q=[];for(;j.zaraz.q.length;){const z=j.zaraz.q.shift();j[l].q.push(z)}r.defer=!0;for(const A of[localStorage,sessionStorage])Object.keys(A||{}).filter((C=>C.startsWith("_zaraz_"))).forEach((B=>{try{j[l]["z_"+B.slice(7)]=JSON.parse(A.getItem(B))}catch{j[l]["z_"+B.slice(7)]=A.getItem(B)}}));r.referrerPolicy="origin";r.src="resources/resources/cdn-cgi/zaraz/sd0d9.js?z="+btoa(encodeURIComponent(JSON.stringify(j[l])));q.parentNode.insertBefore(r,q)};["complete","interactive"].includes(k.readyState)?zaraz.init():j.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script></head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

<nav class="main-header navbar navbar-expand navbar-white navbar-light">

<ul class="navbar-nav">
<li class="nav-item">
<a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
</li>
<li class="nav-item d-none d-sm-inline-block">
<a href="https://adminlte.io/themes/v3/index3.html" class="nav-link">Home</a>
</li>
<li class="nav-item d-none d-sm-inline-block">

</li>
</ul>

<ul class="navbar-nav ml-auto">

<li class="nav-item">
<a class="nav-link" data-widget="navbar-search" href="#" role="button">
<i class="fas fa-search"></i>
</a>
<div class="navbar-search-block">
<form class="form-inline">
<div class="input-group input-group-sm">
<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
<div class="input-group-append">
<button class="btn btn-navbar" type="submit">
<i class="fas fa-search"></i>
</button>
<button class="btn btn-navbar" type="button" data-widget="navbar-search">
<i class="fas fa-times"></i>
</button>
</div>
</div>
</form>
</div>
</li>




<li class="nav-item">
<a class="nav-link" data-widget="fullscreen" href="#" role="button">
<i class="fas fa-expand-arrows-alt"></i>
</a>
</li>

</ul>
</nav>


<aside class="main-sidebar sidebar-dark-primary elevation-4">

<a href="#" class="brand-link">
&nbsp
<span class="brand-text font-weight-light">Inventory Management</span>
</a>

<div class="sidebar">

<div class="user-panel mt-3 pb-3 mb-3 d-flex">
<div class="image">
<img src="data:image/png;base64,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" class="img-circle elevation-2" alt="User Image">
</div>
<div class="info">
<a href="#" class="d-block">Admin</a>
</div>
</div>

<div class="form-inline">
<div class="input-group" data-widget="sidebar-search">
<input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
<div class="input-group-append">
<button class="btn btn-sidebar">
<i class="fas fa-search fa-fw"></i>
</button>
</div>
</div>
</div>

<nav class="mt-2">
<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

<li class="nav-item">
<a href="#" class="nav-link">
<i class="nav-icon fas fa-tachometer-alt "></i>
<p>
Dashboard

</p>
</a>

</li>







</ul>
</nav>

</div>

</aside>

<div class="content-wrapper">

<section class="content-header">
<div class="container-fluid">
<div class="row mb-2">
<div class="col-sm-6">
<h1>Inventory Management</h1>
</div>
<div class="col-sm-6">
<ol class="breadcrumb float-sm-right">
<li class="breadcrumb-item"><a href="./">Home</a></li>
<li class="breadcrumb-item active">Inventory Management</li>
</ol>
</div>
</div>
</div>
</section>

<section class="content">
<div class="container-fluid">
<div class="row">
<div class="col-12">


<div class="card">
<div class="card-header">
<h3 class="card-title">Inventory Table</h3>
</div>

<div class="card-body">
<table id="example1" class="table table-bordered table-striped">
<thead>
<tr>
  <th>ID</th>
  <th>Name</th>
  <th>Available Quantity</th>
  <th>Availability</th>
  <th>Price</th>
  <th>Action</th>
</tr>
</thead>

<tbody>
<% while(rs.next()){ %>
      <TR>
      <form action="inventoryactions" method="post"> 
       <TD><%= rs.getString(1) %> <input type="hidden" class="form-control"  value="<%= rs.getString(1) %>" name="id" ></td>
        <TD> <input type="text" class="form-control" value="<%= rs.getString(2) %>" name="name" placeholder="Name"> </td>
       <TD> <input type="number" class="form-control" value="<%= rs.getString(3) %>"name="quantity" placeholder="Quantity"> </td>
       <TD> <input type="text" class="form-control" value="<%= rs.getString(4) %>" name="availability" placeholder="Availability"> </td>
       <TD> <input type="text" class="form-control" value="<%= rs.getString(5) %>" name="price" placeholder="Price"> </td>
         <TD>
         
         <button type="submit" name="add" value="Add" class="btn-link" style=" border: none;"  > <i class="bi bi-pencil-square"></i></button>  
         
         <button type="submit" name="remove" value="Remove" class="btn-link" style=" border: none;"> <i class="bi bi-trash3-fill"></i></button>  
         
         </TD> 
      </TR>
      </form>
      <% } %>
<TR>
      <form action="inventoryactions" method="post"> 
       <TD>ID</td>
        <TD> <input type="text" class="form-control"  name="name" placeholder="Name"> </td>
       <TD> <input type="number" class="form-control" name="quantity" placeholder="Quantity"> </td>
       <TD> <input type="text" class="form-control"  name="availability" placeholder="Availability"> </td>
       <TD> <input type="text" class="form-control"  name="price" placeholder="Price"> </td>
         <TD>
         
         <button type="submit" name="addnew" value="Add" class="btn-link" style=" border: none;"  > <i class="bi bi-plus-square"></i></button>  
         
          
         
         </TD> 
      </TR>
      </form>

<style>
.btn-link {
    border: none;
    outline: none;
    background: none;
    cursor: pointer;
    color: #0000EE;
    padding: 0;
    text-decoration: underline;
    font-family: inherit;
    font-size: inherit;
}
</style>
</tbody>
<tfoot>
<tr>
  <th>ID</th>
  <th>Name</th>
  <th>Available Quantity</th>
  <th>Availability</th>
  <th>Price</th>
  <th>Action</th>
</tr>
</tfoot>
</table>
</div>

</div>

</div>

</div>

</div>

</section>

</div>

<footer class="main-footer">
<div class="float-right d-none d-sm-block">
<b>Version</b> 1.0.0
</div>
<strong>Copyright &copy; 2023 Inventory Management</a>.</strong> All rights reserved.
</footer>

<aside class="control-sidebar control-sidebar-dark">

</aside>

</div>


<script src="resources/plugins/jquery/jquery.min.js"></script>

<script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="resources/plugins/jszip/jszip.min.js"></script>
<script src="resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

<script src="resources/dist/js/adminlte.min2167.js?v=3.2.0"></script>

<script src="resources/dist/js/demo.js"></script>

<script>
  $(function () {
    $("#example1").DataTable({
    	"ordering":false,
      "responsive": true, "lengthChange": false, "autoWidth": false,
      
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    
    
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>

</html>
