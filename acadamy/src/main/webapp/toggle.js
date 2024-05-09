
	 function handleLogin(userRole) {
	        const loginTab = document.getElementById('loginLink');
            const registerTab = document.getElementById('registrationLink');
            
            //student
            const std_dashboard = document.getElementById('std_dashboard');
            const std_course_reg =document.getElementById('std_course_reg');
            const logoutTab = document.getElementById('logoutLink');
            
            //teacher
            
             const  teacher_course_reg= document.getElementById('teacher_course_reg');
            const teacher_dashboard =document.getElementById('teacher_dashboard');
            
            //admin
            
              const add_course = document.getElementById('add_course');
            const admin_dashboard =document.getElementById('admin_dashboard');
            const enrollment=document.getElementById('enrollment');


          
             
               if (userRole === "student") {
     			std_dashboard.style.display = 'block';
     			std_course_reg.style.display = 'block';
     			
     			  loginTab.style.display = 'none';
		          registerTab.style.display = 'none';
		          logoutTab.style.display = 'block';
     					
    			}else if (userRole === "teacher") {
        			teacher_course_reg.style.display = 'block';
        			teacher_dashboard.style.display = 'block';
        			
        			  loginTab.style.display = 'none';
			          registerTab.style.display = 'none';
			          logoutTab.style.display = 'block';
   			 } else if (userRole === "admin") {
        			add_course.style.display = 'block';
        			admin_dashboard.style.display = 'block';
        			enrollment.style.display = 'block';
        			
		        	 loginTab.style.display = 'none';
		            registerTab.style.display = 'none';
		             logoutTab.style.display = 'block';
        			
    }
    }

              function handleLogout() {
   				
     		const loginTab = document.getElementById('loginLink');
            const registerTab = document.getElementById('registrationLink');
            
            //student
            const std_dashboard = document.getElementById('std_dashboard');
            const std_course_reg =document.getElementById('std_course_reg');
            const logoutTab = document.getElementById('logoutLink');
            
            //teacher
            
             const  teacher_course_reg= document.getElementById('teacher_course_reg');
            const teacher_dashboard =document.getElementById('teacher_dashboard');
            
            //admin
            
              const add_course = document.getElementById('add_course');
            const admin_dashboard =document.getElementById('admin_dashboard');
            const enrollment=document.getElementById('enrollment');
    
   				
		    loginTab.style.display = "block";
		    registerTab.style.display = "block";
			std_dashboard.style.display = 'none';
			std_course_reg.style.display = 'none';
     		teacher_course_reg.style.display = 'none';
			teacher_dashboard.style.display = 'none';
        	add_course.style.display = 'none';
			admin_dashboard.style.display = 'none';
			enrollment.style.display = 'none';
 			logoutTab.style.display = "none";
 			
 			
}


	 
	 
	 