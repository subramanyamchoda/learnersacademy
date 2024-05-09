package login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Admin;
import profile.Database;
import profile.User;
import profile.Teacher;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet({"/dashboard", "/teacherDashboard", "/adminDashboard"}) // Add adminDashboard mapping
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null && session.getAttribute("userType") != null) {
            String userType = (String) session.getAttribute("userType");

            if ("student".equals(userType)) {
                handleStudentDashboard(request, response, session);
            } else if ("teacher".equals(userType)) {
                handleTeacherDashboard(request, response, session);
            } else if ("admin".equals(userType)) {
                handleAdminDashboard(request, response, session);
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    private void handleStudentDashboard(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        String uname = (String) session.getAttribute("username");

        // Assuming you have a method to retrieve student data from the database in your Database class
        Database db = new Database("acadamy");
        try {
            User user = db.read(uname, "student");
            request.setAttribute("user", user);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }

    private void handleTeacherDashboard(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        String uname = (String) session.getAttribute("username");

        // Assuming you have a method to retrieve teacher data from the database in your Database class
        Database db = new Database("acadamy");
        try {
            Teacher teacher = db.readTeacher(uname);
            request.setAttribute("teacher", teacher);
            request.getRequestDispatcher("teacherdashboard.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }
    
    private void handleAdminDashboard(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        String uname = (String) session.getAttribute("username");

        // Assuming you have a method to retrieve admin data from the database in your Database class
        Database db = new Database("acadamy");
        try {
            Admin admin = db.readAdmin(uname); // Assuming you have a method to read admin details
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("admindashboard.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }
}
