package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;
import javax.servlet.annotation.WebServlet;

@WebServlet("/EventRequestServlet")

public class EventRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("login.jsp?error=Please login first.");
            return;
        }

        String title = request.getParameter("title");
        String details = request.getParameter("details");
        String eventDate = request.getParameter("date"); // Expected format: YYYY-MM-DD
//        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO events (title, details, date, created_by, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, details);
            ps.setString(3, eventDate);
            ps.setInt(4, userId);
            ps.setString(5, "Pending"); // Admin needs to approve it
//            ps.setTimestamp(6, createdAt);
            ps.executeUpdate();

            response.sendRedirect("dashboard.jsp?success=Event request submitted successfully and is pending approval.");
        } catch (Exception e) {
    e.printStackTrace();  // Print SQL errors
    response.sendRedirect("event_request.jsp?error=Database error: " + e.getMessage());
}

    }
}
