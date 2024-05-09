<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registrations</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
  <style>
    .imga {
      background-size: cover;
      background-image: url("assert/img/back.png");
    }
    /* Fade-in animation */
    @keyframes fadeIn {
      0% {
        opacity: 0;
      }
      100% {
        opacity: 1;
      }
    }

    .fade-in {
      animation-name: fadeIn;
      animation-duration: 2s; /* Slower fade-in animation */
      animation-fill-mode: both;
    }
    /* Slide-in from left animation */
    @keyframes slideInFromLeft {
      0% {
        transform: translateX(-100%);
        opacity: 0;
      }
      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }

    .slide-in-left {
      animation-name: slideInFromLeft;
      animation-duration: 1s; /* Slower slide-in from left animation */
      animation-fill-mode: both;
    }
    /* Slide-in from right animation */
    @keyframes slideInFromRight {
      0% {
        transform: translateX(100%);
        opacity: 0;
      }
      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }

    .slide-in-right {
      animation-name: slideInFromRight;
      animation-duration: 1s; /* Slower slide-in from right animation */
      animation-fill-mode: both;
    }
    /* Slide-in from top animation */
    @keyframes slideInFromTop {
      0% {
        transform: translateY(-100%);
        opacity: 0;
      }
      100% {
        transform: translateY(0);
        opacity: 1;
      }
    }

    .slide-in-top {
      animation-name: slideInFromTop;
      animation-duration: 2s; /* Slower slide-in from top animation */
      animation-fill-mode: both;
    }
  </style>
</head>
<body class="fade-in"> <!-- Apply fade-in animation to the body -->

<%@ include file="header.jsp" %>

<div class="container-fluid">
  <div class="row align-items-center justify-content-center imga" style="height: 85vh;">
    <div class="col text-center mr-3 mb-3 mb-md-0 mt-3 mt-md-0 slide-in-left"> <!-- Apply slide-in from left animation to the first column -->
      <img src="std.jpg" class="mx-auto d-block mt-4 img-fluid rounded" alt="Centered Image" style="max-width: 100%; height: 300px;"><br>
      <button class="btn btn-primary mt-3 btn-lg slide-in-top" onclick="student()">Student Registration</button> <!-- Apply slide-in from top animation to the button -->
    </div>
    <div class="col text-center ml-3 mt-3 mt-md-0 slide-in-right"> <!-- Apply slide-in from right animation to the second column -->
      <img src="inst.jpg" class="mx-auto d-block mt-4 img-fluid rounded" alt="Centered Image" style="max-width: 100%; height: 300px;"><br>
      <button class="btn btn-primary mt-3 btn-lg slide-in-top" onclick="teacher()">Instructor Registration</button> <!-- Apply slide-in from top animation to the button -->
    </div>
  </div>
</div>
<br>

<%@ include file="footer.jsp" %>
<script>
  function student() {
    var menu = "student.jsp";

    // Redirect the user to the specified page
    window.location.href = menu;
  }

  function teacher() {
    var table = "teacher.jsp";

    // Redirect the user to the specified page
    window.location.href = table;
  }

</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
