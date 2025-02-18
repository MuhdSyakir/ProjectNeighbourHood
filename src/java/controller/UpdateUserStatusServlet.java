package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnection;

import javax.servlet.annotation.WebServlet;


@WebServlet("/UpdateUserStatusServlet")
public class UpdateUserStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("user_id");
        String newStatus = request.getParameter("status");

        if (userIdStr == null || newStatus == null) {
            response.sendRedirect("manage_user.jsp?error=Invalid+request");
            return;
        }

        int userId = Integer.parseInt(userIdStr);

        try (Connection conn = DBConnection.getConnection()) {
            String query = "UPDATE users SET status = ? WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newStatus);
            ps.setInt(2, userId);
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("manage_user.jsp?success=Status+updated+successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_user.jsp?error=Internal+server+error");
        }
    }
}
