function handleLogin(userRole) {
    // Get the elements representing navbar items for different roles
    const loginTab = document.getElementById('loginLink');
    const registerTab = document.getElementById('registrationLink');
    const logoutTab = document.getElementById('logoutLink');
    
    // Get elements representing items for different roles
    const studentItems = document.querySelectorAll(".student"); 
    const instructorItems = document.querySelectorAll(".teacher"); 
    const adminItems = document.querySelectorAll(".admin");
    
    // Hide login and register tabs by default
    loginTab.style.display = "none";
    registerTab.style.display = "none";
    logoutTab.style.display = "block";

    // Hide all items by default
   // studentItems.forEach(item => item.style.display = "none");
   // instructorItems.forEach(item => item.style.display = "none");
   // adminItems.forEach(item => item.style.display = "none");
    
    // Show items based on the user's role
    if (userRole === "student") {
        studentItems.forEach(item => item.style.display = "block");
    } else if (userRole === "instructor") {
        instructorItems.forEach(item => item.style.display = "block");
    } else if (userRole === "admin") {
        adminItems.forEach(item => item.style.display = "block");
    }

    // Show logout tab
    
}

function handleLogout() {
    // Get the elements representing navbar items for different roles
    const loginTab = document.getElementById('loginLink');
    const registerTab = document.getElementById('registrationLink');
    const logoutTab = document.getElementById('logout');
    
    // Get elements representing items for different roles
    const studentItems = document.querySelectorAll(".student"); 
    const instructorItems = document.querySelectorAll(".teacher"); 
    const adminItems = document.querySelectorAll(".admin");
    
    // Show login and register tabs
    loginTab.style.display = "block";
    registerTab.style.display = "block";

    // Hide all items by default
    studentItems.forEach(item => item.style.display = "none");
    instructorItems.forEach(item => item.style.display = "none");
    adminItems.forEach(item => item.style.display = "none");

    // Hide logout tab
    logoutTab.style.display = "none";
}
