package enroll;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/enroll1")
public class Enrollmentservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        
        // Retrieving form data
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        int teacherId = Integer.parseInt(request.getParameter("teacher_id"));
        
        // Set current date as enrollment date
        Date enrollmentDate = new Date(System.currentTimeMillis());

        // Set status to "register" automatically
        String status = "register";

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/acadamy";
        String username = "root";
        String password = "subbu";

        try {
            // Loading the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establishing the database connection
            Connection conn = DriverManager.getConnection(url, username, password);

            // SQL query to insert enrollment data into the database
            String sql = "INSERT INTO enrollment (student_id, course_id, teacher_id, enrollment_date, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, studentId);
            pstmt.setInt(2, courseId);
            pstmt.setInt(3, teacherId);
            pstmt.setDate(4, enrollmentDate);
            pstmt.setString(5, status);

            // Executing the query
            int rowsAffected = pstmt.executeUpdate();

            // Closing resources
            pstmt.close();
            conn.close();

            // Redirecting to a success page
            response.sendRedirect("std_course_reg.jsp");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Redirecting to an error page
            response.sendRedirect("enrollment_error.jsp");
        }
    }
}
