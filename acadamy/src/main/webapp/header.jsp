<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Panda Academy</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
  .imga1 {
    background-size: cover;
    background-image: url("assert/img/.png");
    
  }

  .text-white1 {
    font-weight: 1000;
    font-size: large;
    font: optional;
    font-size-adjust: inherit;
    color: aliceblue;
  }

  .logo1 {
    border-radius: 14px;
    margin-right: 5px;
  }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-dark imga1 ">
  <img src="assert/img/log.jpeg" class="logo1" width="50px">
  <a class="navbar-brand text-white1 text-white" href="index.jsp">Learners Academy</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse text-white1" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link text-white" href="index.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="about.jsp">About</a>
      </li>
       <li class="nav-item" id="registrationLink">
        <a class="nav-link text-white" href="registration.jsp">Registration</a>
      </li>
       <li class="nav-item" id="loginLink">
        <a class="nav-link text-white" href="login.jsp">Login</a>
      </li>
      
      
       <!-- teacher -->
      
    	 <li class="nav-item" id="teacher_course_reg" class="teacher" style="display: none;">
          <a class="nav-link text-white" href="teacher_reg_course.jsp">Course Dashboard</a>
      </li>
       <li class="nav-item" id="teacher_dashboard" class="teacher" style="display: none;">
          <a class="nav-link text-white" href="teacherDashboard">profile</a>
      </li>
      
     <!-- student -->
      
      <li class="nav-item" id="std_dashboard"class="student" style="display: none;">
          <a class="nav-link text-white" href="std_course_reg.jsp">Course Dashboard</a>
      </li>
       <li class="nav-item" id="std_course_reg" class="student" style="display: none;">
          <a class="nav-link text-white" href="dashboard">profile</a>
      </li>
      
     <!-- Admin -->
      
        <li class="nav-item" id="add_course" class="admin" style="display: none;">
          <a class="nav-link text-white" href="add_course.jsp">Course Dashboard</a>
      </li>
      <li class="nav-item" id="admin_dashboard" class="admin" style="display: none;">
          <a class="nav-link text-white" href="adminDashboard">profile</a>
      </li>
      <li class="nav-item" id="enrollment" class="admin" style="display: none;">
          <a class="nav-link text-white" href="enrollment.jsp">Enrollment</a>
      </li>
      
      <li class="nav-item" id="logoutLink" style="display: none;">
    <a class="nav-link text-white" href="javascript:handleLogout()">Logout</a>
</li>


    
    </ul>
  </div>
</nav>
<script src="toggle.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
