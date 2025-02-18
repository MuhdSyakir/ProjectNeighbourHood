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


@WebServlet("/EventServlet")
public class EventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

        // Allow only admins to manage events
        if (!"admin".equals(role)) {
            response.sendRedirect("dashboard.jsp?error=Unauthorized Access");
            return;
        }

        String action = request.getParameter("action");
        int eventId;
        String title, details;
        Timestamp date;
        
        try (Connection conn = DBConnection.getConnection()) {
            if ("create".equals(action)) {
                title = request.getParameter("title");
                details = request.getParameter("details");
                date = Timestamp.valueOf(request.getParameter("date"));
                int createdBy = (int) session.getAttribute("user_id");

                String query = "INSERT INTO events (title, details, date, created_by) VALUES (?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, title);
                ps.setString(2, details);
                ps.setTimestamp(3, date);
                ps.setInt(4, createdBy);
                ps.executeUpdate();
            } else if ("update".equals(action)) {
                eventId = Integer.parseInt(request.getParameter("event_id"));
                title = request.getParameter("title");
                details = request.getParameter("details");
                date = Timestamp.valueOf(request.getParameter("date"));

                String query = "UPDATE events SET title=?, details=?, date=? WHERE event_id=?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, title);
                ps.setString(2, details);
                ps.setTimestamp(3, date);
                ps.setInt(4, eventId);
                ps.executeUpdate();
            } else if ("delete".equals(action)) {
                eventId = Integer.parseInt(request.getParameter("event_id"));
                String query = "DELETE FROM events WHERE event_id=?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, eventId);
                ps.executeUpdate();
            }
            
            response.sendRedirect("manage_events.jsp?success=Action completed");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_events.jsp?error=Something went wrong");
        }
    }
}
