<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<style>
		/* Define a class to ensure the footer remains fixed at the bottom */
		.fixed-footer {
			
			width: 100%;
			
			background-color: gray;
			background-size: cover;
			z-index: 9999; /* Ensure the footer appears above other content */
		}
	</style>
</head>
<body>
<footer class="text-center text-lg-start text-white fixed-footer" id="footer">
    <div class=" p-4 pb-4">
        <section>
            <div class="row">
                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">Learners Academy</h6>
                    <p>A great Place To Learn Through the Online!<br><br> Join us today and start your learning journey!</p>
                </div>
                <hr class="w-100 clearfix d-md-none" />
                <div class="col-md-1 col-lg-1 col-xl-1 mx-auto mt-1">
                    <h6 class="text-uppercase mb-4 font-weight-bold">Links</h6>
                    <p><a class="text-white" href="index.jsp">Home</a></p>
                    <p><a class="text-white" href="about.jsp">About</a></p>
                    <p><a class="text-white" href="login.jsp">Login</a></p>
                </div>
                <hr class="w-100 clearfix d-md-none" />
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
                    <p><i class="fas fa-phone mr-3"></i> + 91 891938949</p>
                    <p><i class="fas fa-envelope mr-3"></i>LearnersAcadamy@gmail.com</p>
                </div>
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">Follow us</h6>
                     <a class="btn btn-primary btn-floating m-1" style="background-color: #3b5998" href="#!" role="button"><i class="fab fa-facebook-f fa-beat"></i></a>
         <a class="btn btn-primary btn-floating m-1 fa=beat" style="background-color: #55acee" href="#!" role="button"><i class="fab fa-twitter fa-beat"></i></a>
         <a class="btn btn-primary btn-floating m-1 " style="background-color: #dd4b39" href="#!" role="button"><i class="fab fa-google fa-beat "></i></a>
         <a class="btn btn-primary btn-floating m-1" style="background-color: #ac2bac" href="#!" role="button"><i class="fab fa-instagram fa-beat" ></i></a>
         <a class="btn btn-primary btn-floating m-1" style="background-color: #0082ca" href="#!" role="button"><i class="fab fa-linkedin-in fa-beat"></i></a>
         <a class="btn btn-primary btn-floating m-1" style="background-color: #333333" href="#!" role="button"><i class="fab fa-github fa-beat"></i></a>
                </div>
            </div>
        </section>
    </div>
</footer>
<script>
    // JavaScript to fix the footer after the first 100vh
    window.addEventListener('DOMContentLoaded', function() {
        const footer = document.getElementById('footer');
        const bodyHeight = document.body.clientHeight;
        const viewportHeight = window.innerHeight;

        if (bodyHeight < viewportHeight) {
            footer.style.position = 'fixed';
            footer.style.bottom = '0';
        } else {
            footer.style.position = 'static';
        }
    });
</script>
</body>
</html>
