package register;

import profile.User;
import profile.Database;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/student")
public class RegisterServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = new User();
        user.setName(request.getParameter("name"));
        user.setMobile(Long.parseLong(request.getParameter("mobile")));
        user.setEmail(request.getParameter("email"));
        user.setDob(request.getParameter("dob"));
        user.setAge(Integer.parseInt(request.getParameter("age")));
        user.setGender(request.getParameter("gender"));
        user.setUname(request.getParameter("uname"));
        user.setPass(request.getParameter("pass"));
        user.setCollege(request.getParameter("college"));
        user.setEducation(request.getParameter("education"));
        user.setAddress(request.getParameter("address"));
        user.setYop(request.getParameter("yop"));

        session.setAttribute("user", user);

        Database db = new Database("academy");
        try {
            db.insert(user);
            response.sendRedirect("login.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Registration failed: " + e.getMessage());
        }
    }
}
