<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    
     <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
    <style>
    	body{
	 overflow-x: hidden; 
	}
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
            font-size: 60px;
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

        .animated-from-left {
            animation: slideInFromLeft 1s ease-in-out;
        }

        /* Animation from right */
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

        .animated-from-right {
            animation: slideInFromRight 1s ease-in-out;
        }
    </style>
</head>
<body >
    <!-- Navigation Bar for nav -->
    	<%@ include file="header.jsp" %>
    <br>
    <h5 class="text-primary  text-center animated-from-top text-bold">About Us</h5>
<div class="py-1 mt-3 mx-3">
    <div class="row g-1 align-items-center">
    
       <div class="col-lg-6 text-center animated-from-right">
    <h1 class="mb-4">Welcome to Learners Academy</h1>
    
   
    <p class="mb-4">
        <i class="fa-solid fa-arrow-right fa-beat fa-lg text-primary"></i> 
        <em> Education is the most powerful weapon which you can use to change the world, The beautiful thing about learning is that no one can take it away from you, Education makes a people easy to lead but difficult to drive: easy to govern, but impossible to enslave.</em>
    </p>
    
    <p class="mb-4">
        <i class="fa-solid fa-arrow-right fa-beat fa-lg text-primary"></i> 
        <em> 
        Discover a world of learning at your fingertips with our online courses. Whether you're aiming to boost your skills for work, explore new hobbies, or simply expand your knowledge, we've got you covered. Our courses offer the freedom to learn at your own pace, wherever you are.
        </em>
    </p>
    
     <p class="mb-4">
        <i class="fa-solid fa-arrow-right fa-beat fa-lg text-primary"></i> 
        <em> Learning experiences are like journeys, A great Place To Learn Through the Online, Join us today and start your learning journey, The roots of education are bitter, but the fruit is sweet, Education is not the filling of a pail, but the lighting of a fire.</em>
    </p>
    
    
    <p class="mb-4">
        <i class="fa-solid fa-arrow-right fa-beat fa-lg text-primary"></i> 
        <em> 
        Led by experienced instructors, our interactive lessons make learning engaging and enjoyable. From business and technology to arts and humanities, there's a course for everyone. Start your learning journey today and open the door to endless possibilities.
        </em>
    </p>
</div>


       <div class="col-lg-6 animated-from-left">
            <div class="row g-3">
                <div class="col-6 text-start">
                    <img class="img-fluid rounded w-100 wow zoomIn" src="assert/img/about2.jpeg">
                </div>
                <div class="col-6 text-start">
                    <img class="img-fluid rounded w-75 wow zoomIn" src="assert/img/about1.jpg" style="margin-top: 20%;">
                </div>
                <div class="col-6 text-end">
                    <img class="img-fluid rounded w-75 wow zoomIn" src="assert/img/about4.png">
                </div>
                <div class="col-6 text-end">
                    <img class="img-fluid rounded w-100 wow zoomIn" src="assert/img/about3.jpeg">
                </div>
            </div>
        </div>
    </div>
</div>


<br><br>
    
    
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

<script src="asserts/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
