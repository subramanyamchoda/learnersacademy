<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home </title>
      <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
    
    <style>
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-20px);
            }
            60% {
                transform: translateY(-10px);
            }
        }

        .animated {
            animation-duration: 1s;
            animation-fill-mode: both;
        }

        .bounce {
            animation-name: bounce;
        }

        @keyframes bounceInDown {
            0% {
                opacity: 0;
                transform: translateY(-2000px);
            }
            60% {
                opacity: 1;
                transform: translateY(30px);
            }
            80% {
                transform: translateY(-10px);
            }
            100% {
                transform: translateY(0);
            }
        }

        .bounceInDown {
            animation-name: bounceInDown;
        }

        /* Additional styles */
        .img {
            animation-name: slideIn;
            animation-duration: 2s;
            animation-delay: 0.5s; /* Delay for the image animation */
            animation-fill-mode: both;
        }

        .additional-text {
            animation-name: slideIn;
            animation-duration: 2s;
            animation-delay: 1s; /* Delay for the text animation */
            animation-fill-mode: both;
        }

        @keyframes slideIn {
            0% {
                opacity: 0;
                transform: translateY(-100px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Custom styles */
        .text-bold {
            font-weight: 700;
            font-size: 90px;
        }
        
        body {
            overflow-x: hidden;
        }
        
            /* Animation */
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

        .animated-from-top {
            animation: slideInFromTop 1s ease-in-out;
        }

        /* Custom Styles */
        .matter h2 {
            font-size: 24px;
        }
        .matter p {
            font-size: 16px;
        }
          .fa-beat {
            animation-duration: 3s; /* Change this value to adjust the speed */
        }
        
    </style>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
 
<%@ include file="header.jsp" %>
        
<div class="my-2 py-2 mt-1">
    <div class="row align-items-center py-1 g-2">
        <div class="col-md-6 text-center">
            <div class="matter">
                <h1 class="fw-bold animated bounceInDown text-bold">Learners <br>Academy</h1><br><br>
                <h2 class="additional-text animated fadeIn">A great Place To Learn Through the Online!</h2>
                <h4 class="additional-text animated fadeIn">Join us today and start your learning journey!</h4>
            </div>
        </div>
        <div class="col-md-6">
            <div class="img">
                <img src="assert/img/1.svg" class="img-fluid animated bounce" width="650px" height="650px" alt="">
            </div>
        </div>
    </div>
</div>





    <div class="row animated-from-top">
        <!-- First row: Free Online Courses -->
        <div class="col-md-4 my-2 text-center">
         <img src="assert/img/education.png" alt="Expert Instructor Icon" class="img-fluid fa-beat" width="70px">
           <div class="matter mt-3">
                <h5 class="animated fadeIn">Free Online Courses</h5>
                <p>Access a variety of high-quality courses for free.</p>
            </div>
        </div>
        
        <!-- Second row: Expert Instructors -->
        <div class="col-md-4 my-2 text-center">
            <img src="assert/img/instructor.png" alt="Expert Instructor Icon" class="img-fluid fa-beat" width="70px">
            <div class="matter mt-3">
                <h5 class="fw-bold">Expert Instructors</h5>
                <p>Learn from experienced professionals who are experts in their fields.</p>
            </div>
        </div>
        
        <!-- Third row: Lifetime Access -->
        <div class="col-md-4 my-2 text-center">
            <img src="assert/img/lifetime.png" alt="Lifetime Access Icon" class="img-fluid fa-beat" width="70px">
            <div class="matter mt-3">
                <h5 class="fw-bold">Lifetime Access</h5>
                <p>Enjoy lifetime access to all course materials and updates.</p>
            </div>
        </div>
    </div>
    
    
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
        if (uname != null && userRole!= null) {
        	
        	 handleLogin(userRole);
          
          
        }
        
        
        
        
    });
</script>	


<script>	
//Assuming you have a logout link with the ID "logoutButton"
const logoutButton = document.getElementById('logoutButton');

// Attach an event listener to the logout link
logoutButton.addEventListener('click', function(event) {
    // Prevent the default action of the link (i.e., navigating to the href)
    event.preventDefault();

    window.location.href = "index.jsp";
    handleLogout();
    
});


</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
