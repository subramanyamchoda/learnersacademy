<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
     <link rel="icon" type="image/x-icon" href="assert/img/log.jpeg">
    <style>
        /* Animation */
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
</head>
<body>
    <%@ include file="header.jsp" %>
    <!-- First Row --><br><br>
    <div class="container mt-5 my-4 py-3">
        <div class="row justify-content-center">
            <!-- Image Column -->
            <div class="col-md-4 d-flex align-items-left justify-content-left animate-right">
                <img src="std.jpg" alt="Left Side Image" class="img-fluid">
            </div>
            <!-- Form Column -->
            <div class="col-md-8 animate-left">
                <div class="card">
                    <div class="card-header">
                        Student Registration
                    </div>
                    <div class="card-body">
                        <form action="student" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="Mobile" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="date" class="form-control" id="dob" name="dob" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input type="number" class="form-control" id="age" name="age" placeholder="Age" required readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <select class="form-control" id="gender" name="gender" required>
                                        <option value="">Select Gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input type="text" class="form-control" id="uname" name="uname" placeholder="Username" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="password" class="form-control" id="pass" name="pass" placeholder="Password" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input type="text" class="form-control" id="address" name="address" placeholder="Address" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="text" class="form-control" id="college" name="college" placeholder="College" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input type="text" class="form-control" id="education" name="education" placeholder="Education" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="text" class="form-control" id="yop" name="yop" placeholder="Year Of Pass" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><br>
    <!-- End of First Row -->
	<%@ include file="footer.jsp" %>
    <!-- JavaScript to calculate age -->
    <script>
        document.getElementById('dob').addEventListener('change', function() {
            const dob = new Date(this.value);
            const today = new Date();
            const age = today.getFullYear() - dob.getFullYear();
            document.getElementById('age').value = age;
        });
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
