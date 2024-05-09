<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses </title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <style>
        .border-1 {
            border: 2px solid gray;
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

        .slideInFromTop {
            animation: slideInFromTop 0.9s ease-in-out;
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
        
        .slide-in-left {
            animation: slideLeft 0.5s ease forwards;
            opacity: 0;
            transform: translateX(-100%);
        }
        
        @keyframes slideLeft {
            0% {
                opacity: 0;
                transform: translateX(-100%);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
     <!-- Modal -->
<div class="container mt-2"> <!-- Added animation class -->
    <div class="row">
        <div class="col-md-6 offset-md-5">
            <button type="button" class="btn btn-primary btn-lg algin-center slide-in-left" data-toggle="modal" data-target="#addCourseModal">Add Course</button>
        </div>
    </div>
</div>

<sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/acadamy" user="root" password="subbu" />

<!-- Modal -->
<div class="modal fade" id="addCourseModal" tabindex="-1" role="dialog" aria-labelledby="addCourseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCourseModalLabel">Add Course</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Enrollment form inside the modal -->
                <form id="courseRegistration" action="courseRegistration" method="post">

                    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                                        url="jdbc:mysql://localhost:3306/acadamy" user="root" password="subbu" />

                    <div class="form-group">
                        <label for="course_id">Available courses to register:</label>
                        <sql:query dataSource="${dataSource}" var="courses">
                            SELECT course_id, course_name, course_dure, course_timing FROM courses
                        </sql:query>

                        <select class="form-control" id="courseSelect" name="course_id">
                            <option value="" disabled selected>Select a Course</option>
                            <c:forEach var="course" items="${courses.rows}">
                                <option value="${course.course_id}" data-timings="${course.course_timing}" data-duration="${course.course_dure}">
                                    ${course.course_name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    
                    <input type="hidden" class="form-control" id="courseName" name="course_name" readonly>
					<div class="form-group">
                        <label for="courseDuration">Course ID:</label>
                       <input type="text" class="form-control" id="course_id" name="course_id" readonly>
                    </div>
                    
                    <div class="form-group">
                        <label for="courseDuration">Course Duration:</label>
                        <input type="text" class="form-control" id="courseDuration" name="course_dure" readonly>
                    </div>

                    <div class="form-group">
                        <label for="courseTimings">Course Timings:</label>
                        <input type="text" class="form-control" id="courseTimings" name="course_timing" readonly>
                    </div>

                    <div class="form-group">
                        <label for="teacher_id">Teacher ID:</label>
                        <c:set var="teacherId" value="" />
                        <sql:query dataSource="${dataSource}" var="teacher">
                            SELECT teacher_id FROM teacher WHERE uname=?
                            <sql:param value="${username}" />
                        </sql:query>
                        <c:if test="${not empty teacher.rows}">
                            <c:set var="teacherId" value="${teacher.rows[0].teacher_id}" />
                        </c:if>
                        <input type="text" class="form-control" id="teacher_id" name="teacher_id" value="${teacherId}" readonly>
                    </div>

                    <button type="submit" class="btn btn-primary">Register Course</button>
                </form>
            </div>
        </div>
    </div>
</div>


 <div class="container-fluid mt-5 mb-4">
    <h2 class="text-center mb-3 slide-in-right">Registered Courses</h2>
    <%-- Fetch course information using SQL --%>
    <sql:query dataSource="${dataSource}" var="courses">
        SELECT course_id, course_name, course_dure, course_timing FROM course_teacher WHERE teacher_id = ?
        <sql:param value="${teacherId}" />
    </sql:query>
    
    <div class="row">
        <c:forEach var="course" items="${courses.rows}" varStatus="rowStatus">
            <div class="col-md-3 mb-3">
                <div class="container rounded p-3 text-center border-1 slideInFromTop">
                    <h4>${course.course_name}</h4><hr class="border">
                    <p><strong>Course ID:</strong> ${course.course_id}</p>
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

    <script>
    $(document).ready(function() {
        $('#courseSelect').change(function() {
            var selectedOption = $(this).find('option:selected');
            var selectedCourseName = selectedOption.text(); // Get the selected course name
            $('#courseName').val(selectedCourseName); // Update the input field with the selected course name
            var timings = selectedOption.data('timings');
            var duration = selectedOption.data('duration');    
            var courseId = selectedOption.val(); // Get the selected course ID
            $('#courseTimings').val(timings);
            $('#courseDuration').val(duration);
            $('#course_id').val(courseId); // Set the selected course ID in the hidden input field
        });
    });

    </script>
</body>
</html>
