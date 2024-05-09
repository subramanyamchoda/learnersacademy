<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
     <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <style>
        body {
            background-color: #f8f9fa;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        /* Hover effect for buttons */
        .btn-primary:hover {
            background-color: #0069d9;
        }

        /* Additional animation after fadeInUp */
        .fadeInUpComplete {
            animation-name: fadeInUpComplete;
            animation-duration: 1s;
            animation-delay: 0.5s;
            animation-fill-mode: both;
        }

        @keyframes fadeInUpComplete {
            0% {
                transform: translateY(20px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %><br><br><br>
 <div class="container mt-5 mt-md-9"> <!-- Add mt-5 to add margin-top -->
    <div class="d-flex justify-content-center">
        <div class="col-md-5 animate__animated animate__fadeInDown p-4 border rounded">
            <h2 class="text-center">Login</h2>
            <form action="login" method="post">
                <div class="form-group animate__animated animate__fadeInUp">
                    <label for="userType">User Type:</label>
                    <select class="form-control" id="role" name="userType" required>
                        <option value="#">select</option>
                        <option value="student">Student</option>
                        <option value="teacher">Teacher</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <div class="form-group animate__animated animate__fadeInUp">
                    <label for="uname">Username:</label>
                    <input type="text" class="form-control" id="uname" name="uname" required>
                </div>
                <div class="form-group animate__animated animate__fadeInUp">
                    <label for="pass">Password:</label>
                    <input type="password" class="form-control" id="pass" name="pass" required>
                </div>
                <!-- Add the fadeInUpComplete class to the button -->
                <button type="submit" class="btn btn-primary btn-block animate__animated animate__fadeInUp fadeInUpComplete">Login</button>
            </form>
            <% String error = (String) request.getSession().getAttribute("error");
                if (error != null) { %>
            <div class="alert alert-danger mt-3 animate__animated animate__fadeIn fadeInUpComplete" role="alert">
                <%= error %>
            </div>
            <% request.getSession().removeAttribute("error"); } %>
        </div>
    </div>
</div>


<br><br><br>

<br><br>	
<%@ include file="footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
