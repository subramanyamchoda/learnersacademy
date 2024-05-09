package login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Database;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");
        String userType = request.getParameter("userType");

        // Check if any of the parameters are null or empty
        if (username == null || username.isEmpty() || password == null || password.isEmpty() || userType == null || userType.isEmpty()) {
            session.setAttribute("error", "Invalid request parameters");
            response.sendRedirect("login.jsp");
            return;
        }

        Database db = new Database("academy");

        try {
            int result = db.validate(username, password, userType);

            switch (result) {
                case 1:
                    session.setAttribute("error", "Username is wrong");
                    response.sendRedirect("login.jsp");
                    break;
                case 2:
                    session.setAttribute("username", username);
                    session.setAttribute("userType", userType);
                    if ("admin".equals(userType)) {
                        response.sendRedirect("adminDashboard"); // Redirect to admin dashboard
                    } else if ("teacher".equals(userType)) {
                        response.sendRedirect("teacherDashboard"); // Redirect to teacher dashboard
                    } else {
                        response.sendRedirect("dashboard"); // Redirect to student dashboard
                    }
                    break;
                case 3:
                    session.setAttribute("error", "Password is wrong");
                    response.sendRedirect("login.jsp");
                    break;
                default:
                    session.setAttribute("error", "An unexpected error occurred");
                    response.sendRedirect("login.jsp");
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            session.setAttribute("error", "Database error");
            response.sendRedirect("login.jsp");
        }
    }
}