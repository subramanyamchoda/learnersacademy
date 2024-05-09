package register;

import profile.Database;
import profile.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/teacher")
public class RegisterServlet3 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Validate input fields
        if (!validateInput(request, response)) {
            return;
        }

        // Create a new Teacher object
        Teacher teacher = new Teacher();

        // Set attributes from request parameters
        teacher.setF_name(request.getParameter("f_name"));
        teacher.setL_name(request.getParameter("l_name"));
        teacher.setMobile(Long.parseLong(request.getParameter("mobile")));
        teacher.setEmail(request.getParameter("email"));
        teacher.setDob(request.getParameter("dob"));
        teacher.setAge(Integer.parseInt(request.getParameter("age")));
        teacher.setGender(request.getParameter("gender"));
        teacher.setUname(request.getParameter("uname"));
        teacher.setPass(request.getParameter("pass")); // Assuming pass is required for teacher registration
        teacher.setExperience(request.getParameter("experience"));
        teacher.setEducation(request.getParameter("education"));
        teacher.setAddress(request.getParameter("address"));

        // Store the Teacher object in the session
        session.setAttribute("user", teacher);

        // Insert the teacher into the database
        Database db = new Database("academy");
        try {
            db.insert(teacher);
            response.sendRedirect("login.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Registration failed: " + e.getMessage());
        }
    }

    private boolean validateInput(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Validate input fields here
        // You can perform validation checks and return false if any input is invalid
        // For example, check if required fields are not empty, validate email format, etc.
        // If input is invalid, send appropriate error response to the user and return false
        return true; // Return true if input is valid
    }
}
