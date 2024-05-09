<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <title>Courses</title>
    <!-- Bootstrap CSS -->
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
            animation: slideInFromTop 1s ease-in-out;
        }
        
        .slide-in-right {
            animation: slideInRight 1s ease forwards;
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
            animation: slideLeft 2s ease forwards;
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp" %>
<div class="container mt-2">
    <div class="row justify-content-center">
        <div class="col-md-8 text-center">
            <!-- Add Course button to open modal -->
            <button type="button" class="btn btn-primary slideInFromTop btn-lg" data-toggle="modal" data-target="#addCourseModal">Course Registration</button>
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
                <form id="courseRegistration" action="enroll1" method="post">
                    <div class="form-group">
                        <label for="course_id">Available courses to register:</label>
                        <div class="form-group">
                            <sql:query dataSource="${dataSource}" var="courses">
                                SELECT 
                                    c.course_name,
                                    ct.course_id,
                                    ct.course_dure,
                                    ct.course_timing,
                                    ct.teacher_id,
                                    t.f_name,
                                    t.experience,
                                    t.education
                                FROM  
                                    course_teacher ct
                                JOIN 
                                    teacher t ON ct.teacher_id = t.teacher_id
                                JOIN 
                                    courses c ON c.course_id = ct.course_id;
                            </sql:query>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="courseSelect">Select Course:</label>
                        <select class="form-control" id="courseSelect" name="course_name">
                            <option value="">Select Course</option>
                            <c:forEach var="course" items="${courses.rows}">
                                <option value="${course.course_name}"
                                        data-timings="${course.course_timing}"
                                        data-duration="${course.course_dure}"
                                        data-teacher-name="${course.f_name}"
                                          data-teacher-id="${course.teacher_id}" 
                                        data-teacher-experience="${course.experience}"
                                        data-teacher-education="${course.education}"
                                        data-course-id="${course.course_id}">
                                    ${course.course_name} (${course.f_name})
                                </option>
                            </c:forEach>
                
                        </select>
                    </div>

                    <!-- Display teacher details -->
                    <div id="teacherDetails" style="display: none;">
                        <div class="form-group">
                            <label for="teacherExperience">Teacher Experience:</label>
                            <input type="text" class="form-control" id="teacherExperience" name="teacher_experience" readonly>
                        </div>
                        <div class="form-group">
                            <label for="teacherEducation">Teacher Education:</label>
                            <input type="text" class="form-control" id="teacherEducation" name="teacher_education" readonly>
                        </div>
                    </div>

                    <!-- Course ID field -->
                    <div class="form-group" id="courseIdGroup">
                        <label for="course_id">Course ID:</label>
                        <input type="text" class="form-control" id="course_id" name="course_id" readonly>
                    </div>
                     <div class="form-group" id="courseIdGroup">
                        <label for="teacher_id">teacher ID:</label>
                        <input type="text" class="form-control" id="teacher_id" name="teacher_id" readonly>
                    </div>

                    <!-- Student ID field -->
                    <div class="form-group">
                        <label for="student_id">Student ID:</label>
                        <c:set var="studentId" value="" />
                        <sql:query dataSource="${dataSource}" var="student">
                            SELECT student_id FROM student WHERE uname=?
                            <sql:param value="${username}" />
                        </sql:query>
                        <c:if test="${not empty student.rows}">
                            <c:set var="studentId" value="${student.rows[0].student_id}" />
                        </c:if>
                        <input type="text" class="form-control" id="student_id" name="student_id" value="${studentId}" readonly>
                    </div>

                    <button type="submit" class="btn btn-primary">Register Course</button>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="container-fluid mt-3">
    <h3 class="text-center mb-3 slide-in-left">Registered courses:</h3>
    
        <sql:query dataSource="${dataSource}" var="enrollmentStructure">
            SELECT e.*, ct.course_dure, ct.course_timing, ct.course_name
            FROM enrollment e
            JOIN courses ct ON e.course_id = ct.course_id
            WHERE e.student_id = ?
            <sql:param value="${studentId}" />
        </sql:query>
        <div class="row">
        <c:forEach var="column" items="${enrollmentStructure.rows}">
            <div class="col-md-3 mb-3">
                <div class="container rounded p-3 text-center border-1 slideInFromTop">
                    
                        <h5 class="card-title">${column.course_name}</h5><hr class="border">
                        <p class="card-text"><strong>Course Id:</strong> ${column.course_id}</p>
                        <p class="card-text"><strong>Teacher Id:</strong> ${column.teacher_id}</p>
                        <p class="card-text"><strong>Course Duration:</strong> ${column.course_dure}</p>
                        <p class="card-text"><strong>Course Timing:</strong> ${column.course_timing}</p>
                    </div>
                </div>
            
        </c:forEach>
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

<script>
    $(document).ready(function() {
        $('#courseSelect').change(function() {
            var selectedOption = $(this).find('option:selected');
            var teacherId = selectedOption.data('teacher-id'); // Change to 'teacher-id'

            if (teacherId !== undefined) {
                // Show teacher details
                $('#teacherDetails').show();
                // Populate teacher details
                var timings = selectedOption.data('timings');
                var duration = selectedOption.data('duration');
                var teacherExperience = selectedOption.data('teacher-experience');
                var teacherEducation = selectedOption.data('teacher-education');

                $('#courseTimings').val(timings);
                $('#courseDuration').val(duration);
                $('#teacherExperience').val(teacherExperience);
                $('#teacherEducation').val(teacherEducation);
                $('#teacher_id').val(teacherId); // Set teacher_id value in the form
            } else {
                // Hide teacher details if no teacher id found
                $('#teacherDetails').hide();
            }
        });
    });
</script>


<script>
    // Function to update course ID when a course is selected
    document.getElementById('courseSelect').addEventListener('change', function() {
        var selectedIndex = this.selectedIndex;
        var courseId = this.options[selectedIndex].dataset.courseId;
        document.getElementById('course_id').value = courseId;
    });
</script>

<!-- Bootstrap JS and dependencies (optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
