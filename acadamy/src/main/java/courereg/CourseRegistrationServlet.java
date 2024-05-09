package courereg;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;

@WebServlet("/courseRegistration")
public class CourseRegistrationServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form data
        String courseId = request.getParameter("course_id");
        String courseName = request.getParameter("course_name").trim();
        String teacherId = request.getParameter("teacher_id");
        String courseDuration = request.getParameter("course_dure");
        String courseTimings = request.getParameter("course_timing");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/acadamy";
        String user = "root";
        String password = "subbu";

        // SQL query to insert the course registration details
        String sql = "INSERT INTO course_teacher (course_id, course_name, teacher_id, course_dure, course_timing) VALUES (?, ?, ?, ?, ?)";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 // Create a prepared statement
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                // Set the parameters for the prepared statement
                stmt.setString(1, courseId);
                stmt.setString(2, courseName);
                stmt.setString(3, teacherId);
                stmt.setString(4, courseDuration);
                stmt.setString(5, courseTimings);

                // Execute the query
                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    // Redirect back to the page indicating success
                    response.sendRedirect("teacher_reg_course.jsp");
                } else {
                    // Redirect back to the page indicating failure
                    response.sendRedirect("failure.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle any errors
            e.printStackTrace();
            // Redirect back to the page indicating failure
            response.sendRedirect("failure.jsp");
        }
    }
}
