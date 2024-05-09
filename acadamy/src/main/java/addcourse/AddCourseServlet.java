package addcourse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/courseadd")
public class AddCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static final Object Teacher_id = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseName = request.getParameter("course_name");
        String courseDuration = request.getParameter("course_duration");
        String courseTiming = request.getParameter("course_timing");
        HttpSession session = request.getSession(); // This creates a new session or returns the existing session if available

        session.setAttribute("teacher_id", Teacher_id); // Here, "teacherId" is the ID of the logged-in teacher

//        int teacherId = 123; // Predefined teacher ID

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/acadamy", "root", "subbu");

            // Create the SQL query to insert a new course
            String query = "INSERT INTO courses (course_name,  course_dure, course_timing) VALUES (?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, courseName);
            pstmt.setString(2, courseDuration);
            pstmt.setString(3, courseTiming);

            // Execute the query
            int rowsAffected = pstmt.executeUpdate();

            // Close resources
            pstmt.close();
            con.close();

            // Redirect to a success page or show a success message
            response.sendRedirect("add_course.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            // Handle any errors
            e.printStackTrace();
            // Redirect to an error page or show an error message
            response.sendRedirect("error.jsp");
        }
    }
}
