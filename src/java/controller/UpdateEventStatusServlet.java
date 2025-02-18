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


@WebServlet("/UpdateEventStatusServlet")
public class UpdateEventStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventId = request.getParameter("event_id");
        String status = request.getParameter("status");

        try (Connection conn = DBConnection.getConnection()) {
            String query = "UPDATE events SET status = ? WHERE event_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(eventId));
            ps.executeUpdate();

            response.sendRedirect("manage_events.jsp?success=Event status updated successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_events.jsp?error=Something went wrong.");
        }
    }
}
