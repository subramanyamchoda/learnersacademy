<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <title>Instructor Registration</title>
    <style>
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

        /* Apply animation to form elements */
        .animate-left {
            animation: slideInFromLeft 0.6s ease forwards;
        }

        /* Apply animation to image */
        .animate-right {
            animation: slideInFromRight 0.6s ease forwards;
        }
    
    </style>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
<body>
    <%@ include file="header.jsp" %>
    <!-- First Row --><br><br>
<div class="container mt-5">
    <div class="row justify-content-center">
        <!-- Image Column -->
        <div class="col-md-4 d-flex align-items-left justify-content-left animate-right">
            <img src="inst.jpg" alt="Left Side Image" class="img-fluid">
        </div>
        <!-- Form Column -->
        <div class="col-md-8 animate-left">
            <div class="card">
                <div class="card-header">
                    Instructor Registration
                </div>
                <div class="card-body">
                    <!-- Form -->
                    <form action="teacher" method="post">
                        <!-- Form Rows -->
                        <div class="form-row ">
                            <!-- First Name -->
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" id="f_name" name="f_name" placeholder="First Name" required>
                            </div>
                            <!-- Last Name -->
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" id="l_name" name="l_name" placeholder="Last Name" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <!-- Mobile -->
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Mobile" required>
                            </div>
                            <!-- Email Address -->
                            <div class="form-group col-md-6">
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required>
                            </div>
                        </div>
                       <!-- Date of Birth -->
						<div class="form-row">
						    <div class="form-group col-md-6">
						        <input type="date" class="form-control" id="dob" name="dob" placeholder="Date of Birth" required>
						    </div>
						    <!-- Age -->
						    <div class="form-group col-md-6">
						        <input type="number" class="form-control" id="age" name="age" placeholder="Age" required readonly>
						    </div>
						</div>
						
						<div class="form-row">
						    <!-- Gender -->
						    <div class="form-group col-md-6">
						        <select class="form-control" id="gender" name="gender" required>
						            <option value="no">Select Gender</option>
						            <option value="Male">Male</option>
						            <option value="Female">Female</option>
						        </select>
						    </div>
						    <!-- Username -->
						    <div class="form-group col-md-6">
						        <input type="text" class="form-control" id="uname" name="uname" placeholder="Username" required>
						    </div>
						</div>
						
						<div class="form-row">
						    <!-- Password -->
						    <div class="form-group col-md-6">
						        <input type="password" class="form-control" id="pass" name="pass" placeholder="Password" required>
						    </div>
						    <!-- Experience -->
						    <div class="form-group col-md-6">
						        <input type="text" class="form-control" id="experience" name="experience" placeholder="Experience" required>
						    </div>
						</div>
						
						<div class="form-row">
						    <!-- Education -->
						    <div class="form-group col-md-6">
						        <input type="text" class="form-control" id="education" name="education" placeholder="Education" required>
						    </div>
						    <!-- Address -->
						    <div class="form-group col-md-6">
						        <input type="text" class="form-control" id="address" name="address" placeholder="Address" required>
						    </div>
						</div>
						
						<button type="submit" class="btn btn-primary">Register</button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div><br><br><br>

<%@ include file="footer.jsp" %>
    <!-- End of First Row -->

    <!-- JavaScript to calculate age -->
   <!-- JavaScript to calculate age -->
<script>
    document.getElementById('dob').addEventListener('change', function() {
        const dob = new Date(this.value);
        const today = new Date();
        let age = today.getFullYear() - dob.getFullYear();
        const month = today.getMonth() - dob.getMonth();
        if (month < 0 || (month === 0 && today.getDate() < dob.getDate())) {
            age--;
        }
        document.getElementById('age').value = age;
    });
</script>
   

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
