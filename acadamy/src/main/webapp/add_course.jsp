<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
       <style>
        /* Custom CSS for centering the button */
        .centered {
            display: flex;
            justify-content: center;
            align-items: center;
             /* Adjust this value as needed */
        }
        
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

        .slideInFromTop {
            animation: slideInFromTop 0.9s ease-in-out;
        }
         .border-1 {
            border: 2px solid gray;
        }
           .slide-in-right {
            animation: slideInRight 0.6s ease forwards;
            opacity: 0;
            transform: translateX(100%);
        }
        
        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
		
			
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<br>
    <!-- Add Course Button Section -->
     <div class="container-fluid">
        <div class="row centered-top">
            <div class="col-md-12 text-center">
                <button type="button" class="btn btn-primary btn-lg book-btn slideInFromTop" data-toggle="modal" data-target="#addCourseModal">Add Course</button>
            </div>
        </div>
    </div>
    <!-- Add Course Modal -->
    <div class="modal fade" id="addCourseModal" tabindex="-1" role="dialog" aria-labelledby="addCourseModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title " id="addCourseModalLabel">Add Course</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="courseadd" method="post">
                        <div class="form-group">
                            <label for="course_name">Course Name:</label>
                            <input type="text" class="form-control" id="course_name" name="course_name" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="course_duration">Course Duration:</label>
                            <input type="text" class="form-control" id="course_duration" name="course_duration" required>
                        </div>
                        <div class="form-group">
                            <label for="course_timing">Course Timing:</label>
                            <input type="text" class="form-control" id="course_timing" name="course_timing" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Course</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Course Details Section -->


	<div class="container-fluid mt-3 mb-3">
    <h2 class="text-center mb-3 slide-in-right">Added Course Details</h2>
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/acadamy" user="root" password="subbu"/>
    <sql:query dataSource="${dataSource}" var="courses">
        SELECT course_name, course_dure, course_timing FROM courses
    </sql:query>
    <div class="row">
        <c:forEach var="course" items="${courses.rows}" varStatus="rowStatus">
            <div class="col-md-3 mb-3">
                <div class="container rounded p-3 text-center border-1 slideInFromTop">
                    <h4>${course.course_name}</h4><hr class="border">
                    <p><strong>Duration:</strong> ${course.course_dure}</p>
                    <p><strong>Timing:</strong> ${course.course_timing}</p>
                </div>
            </div>
        </c:forEach>
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
        if (uname != null) {
        	
            handleLogin(userRole);
          
          
        }
        
    });
</script>	





    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

