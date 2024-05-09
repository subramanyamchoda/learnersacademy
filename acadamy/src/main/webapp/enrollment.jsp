<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>





<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <title>Enrollment </title>
    <!-- Bootstrap CSS -->
    <style>
    	/* Define keyframes for fade-in animation */
	/* Keyframes for fade-in animation */
			@keyframes fadeIn {
			  from {
			    opacity: 0;
			  }
			  to {
			    opacity: 1;
			  }
			}
			
			/* Keyframes for slide-in animation */
			@keyframes slideIn {
			  from {
			    transform: translateY(50px);
			    opacity: 0;
			  }
			  to {
			    transform: translateY(0);
			    opacity: 1;
			  }
			}
			
			/* Apply fade-in animation to the table */
			.table {
			  animation: fadeIn 1s ease forwards;
			}
			
			/* Apply slide-in animation to table rows */
			tbody tr {
			  animation: slideIn 0.5s ease forwards;
			}
			
			/* Optional: Add delay to each row for a staggered effect */
			tbody tr:nth-child(odd) {
			  animation-delay: 0.1s;
			}
			tbody tr:nth-child(even) {
			  animation-delay: 0.2s;
			}
				/* Apply background color to even rows */
			tbody tr:nth-child(even) {
			  background-color: #f2f2f2; /* Light gray background */
			}
			
			/* Apply background color to odd rows */
			tbody tr:nth-child(odd) {
			  background-color: #ffffff; /* White background */
			}
				/* Keyframes for sliding in from left */
			@keyframes slideInFromLeft {
			  from {
			    transform: translateX(-100%);
			    opacity: 0;
			  }
			  to {
			    transform: translateX(0);
			    opacity: 1;
			  }
			}
			
			/* Keyframes for sliding in from right */
			@keyframes slideInFromRight {
			  from {
			    transform: translateX(100%);
			    opacity: 0;
			  }
			  to {
			    transform: translateX(0);
			    opacity: 1;
			  }
			}
			
			/* Apply slide-in animation to odd rows (coming from left) */
			tbody tr:nth-child(odd) {
			  animation: slideInFromLeft 0.5s ease forwards;
			}
			
			/* Apply slide-in animation to even rows (coming from right) */
			tbody tr:nth-child(even) {
			  animation: slideInFromRight 0.5s ease forwards;
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
			   
    </style>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
			<%@ include file="header.jsp" %>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/acadamy" user="root" password="subbu" />

<div class="container-fluid mt-5">
    <div class="row">
        <div class="col-md-12">
            <h2 class=" slideInFromTop">Enrollment Data</h2>
            <p class="slideInFromTop">Total number of people enrolled: 
                <sql:query dataSource="${dataSource}" var="enrollmentCount">
                    SELECT COUNT(*) AS total FROM enrollment
                </sql:query>
                <c:forEach var="count" items="${enrollmentCount.rows}">
                    ${count.total}
                </c:forEach>
            </p>
            <table class="table table-bordered ">
                <thead>
                    <tr>
                    	 <th>Enrollment ID</th>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Teacher ID</th>
                        <th>Teacher Name</th>
                        <th>Enrollment Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                   <sql:query dataSource="${dataSource}" var="enrollments">
					    SELECT e.enrollment_id, e.student_id, s.name, e.course_id, c.course_name, e.teacher_id, t.f_name, e.enrollment_date, e.status
					    FROM enrollment e
					    INNER JOIN student s ON e.student_id = s.student_id
					    INNER JOIN courses c ON e.course_id = c.course_id
					    INNER JOIN teacher t ON e.teacher_id = t.teacher_id
					    ORDER BY e.enrollment_id ASC
					</sql:query>

                    <c:forEach var="enrollment" items="${enrollments.rows}">
                        <tr>
                        	<td>${enrollment.enrollment_id}</td>	
                            <td>${enrollment.student_id}</td>
                            <td>${enrollment.name}</td>
                            <td>${enrollment.course_id}</td>
                            <td>${enrollment.course_name}</td>
                            <td>${enrollment.teacher_id}</td>
                            <td>${enrollment.f_name}</td>
                            <td>${enrollment.enrollment_date}</td>
                            <td>${enrollment.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
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
</body>
</html>
