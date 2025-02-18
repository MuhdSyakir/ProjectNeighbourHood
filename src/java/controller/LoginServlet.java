package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;

import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT user_id, name, role, status FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String status = rs.getString("status");

                if (!"Active".equalsIgnoreCase(status)) {
                    // If the user is not active, redirect to login page with an error
                    response.sendRedirect("login.jsp?error=Your account is deactivated. Contact admin.");
                    return;
                }

                // If active, store user details in session
                HttpSession session = request.getSession();
                session.setAttribute("user_id", rs.getInt("user_id"));
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("role", rs.getString("role"));

                response.sendRedirect("dashboard.jsp"); // Redirect to dashboard
            } else {
                response.sendRedirect("login.jsp?error=Invalid email or password.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Something went wrong. Try again.");
        }
    }
}
