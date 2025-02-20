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

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("user_id");

        if (userIdStr == null) {
            response.sendRedirect("manage_user.jsp?error=Invalid+request");
            return;
        }

        int userId = Integer.parseInt(userIdStr);

        try (Connection conn = DBConnection.getConnection()) {
            String query = "DELETE FROM users WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("manage_user.jsp?success=User+deleted+successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_user.jsp?error=Internal+server+error");
        }
    }
}
