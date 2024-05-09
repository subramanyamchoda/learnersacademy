<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
     <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <title> Profile   </title>
    <meta name="author" content="Codeconvey" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .gradient-custom {
            /* fallback for old browsers */
            background: #f6d365;
            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));
            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));
        }

        /* Animation for text coming from the top */
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

        /* Animation for text coming from the right */
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

        /* Animation for text coming from the left */
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

        /* Apply animations to specific elements */
        .slide-in-from-top {
            animation: slideInFromTop 0.9s ease-out;
        }

        .slide-in-from-right {
            animation: slideInFromRight 1s ease-out;
        }

        .slide-in-from-left {
            animation: slideInFromLeft 1s ease-out;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>
<% profile.User user = (profile.User) request.getAttribute("user"); %>

<section class="vh-100" style="background-color: #f4f5f7; padding-top: 20px; padding-bottom: 10px;">
    <div class="container py-9n h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-10 mb-6 mb-lg-0">
                <div class="card mb-5" style="border-radius: .5rem;">
                    <div class="row g-0">
                        <div class="col-md-5 gradient-custom text-center text-white slide-in-from-left" style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                            <img src="std.jpg" alt="Avatar" class="img-fluid my-5" style="width: 120px;" />
                            <h5 class="slide-in-from-left">${user.uname}</h5>
                            <h5 class="slide-in-from-left">${user.email}</h5>
                            <i class="far fa-edit mb-5"></i>
                            <div class="social-icons mt-3">
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #3b5998" href="#!" role="button"><i class="fab fa-facebook-f fa-beat"></i></a>
                                <a class="btn btn-primary btn-floating m-1 fa=beat" style="background-color: #55acee" href="#!" role="button"><i class="fab fa-twitter fa-beat"></i></a>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #dd4b39" href="#!" role="button"><i class="fab fa-google fa-beat"></i></a>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #ac2bac" href="#!" role="button"><i class="fab fa-instagram fa-beat" ></i></a>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #0082ca" href="#!" role="button"><i class="fab fa-linkedin-in fa-beat"></i></a>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #333333" href="#!" role="button"><i class="fab fa-github fa-beat"></i></a>
                                <!-- Add more icons as needed -->
                            </div>
                            <p></p>
                        </div>

                        <div class="col-md-7">
                            <div class="card-body p-5 slide-in-from-right">
                                <h6>Information</h6>
                                <hr class="mt-0 mb-4">
                                <div class="row pt-1">
                                    <div class="col-6 mb-4 slide-in-from-left">
                                        <h6>first Name</h6>
                                        <p class="text-muted">${user.name}</p>
                                    </div>
                                    <div class="col-6 mb-4 slide-in-from-right">
                                        <h6>Email</h6>
                                        <p class="text-muted">${user.email }</p>
                                    </div>
                                    <div class="col-6 mb-4 slide-in-from-left">
                                        <h6>Phone</h6>
                                        <p class="text-muted">${user.mobile }</p>
                                    </div>
                                    <div class="col-6 mb-4 slide-in-from-right">
                                        <h6>Address</h6>
                                        <p class="text-muted">${user.address }</p>
                                    </div>
                                    <div class="col-6 mb-4 slide-in-from-left">
                                        <h6>Date Of Birth</h6>
                                        <p class="text-muted">${user.dob}</p>
                                    </div>
                                    <div class="col-6 mb-4 slide-in-from-right">
                                        <h6>Age</h6>
                                        <p class="text-muted">${user.age}</p>
                                    </div>
                                    <div class="col-6 mb-4 slide-in-from-left">
                                        <h6>Gender</h6>
                                        <p class="text-muted">${user.gender}</p>
                                    </div>
                                    <div class="col-6 mb-4 slide-in-from-right">
                                        <h6>College</h6>
                                        <p class="text-muted">${user.college}</p>
                                    </div>
                                    <div class="col-6 mb-4 slide-in-from-left">
                                        <h6>Education</h6>
                                        <p class="text-muted">${user.education}</p>
                                    </div>
                                    <div class="col-6 mb-4 slide-in-from-right">
                                        <h6>Year of pass</h6>
                                        <p class="text-muted">${user.yop}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%! String uname=null; %>
<%! String userRole=null; %>
<% if(session !=null)
    uname=(String)session.getAttribute("uname");
	userRole=(String)session.getAttribute("userType");
%>

<%@ include file="footer.jsp" %>
<script src="toggle.js"></script>

<script>

    window.addEventListener('DOMContentLoaded', (event) => {
        console.log("success");

        const uname = "<%= uname%>";
        const userRole = "<%= userRole%>";
        
        console.log(userRole);

        
        console.log(uname);
        if (uname != null) {
        	
            handleLogin(userRole);
          
          
        }
        
    });
</script>	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome Script -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
<!-- Analytics -->
</body>
</html>
