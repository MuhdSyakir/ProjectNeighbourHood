package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;
import javax.servlet.annotation.WebServlet;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet("/ReportServlet")

public class ReportServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ReportServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        Integer userId = (session != null) ? (Integer) session.getAttribute("user_id") : null;
        if (userId == null) {
            response.sendRedirect("login.jsp?error=Please log in to report an incident.");
            return;
        }

        String description = request.getParameter("description");
        String category = request.getParameter("category");
        Timestamp timestamp = Timestamp.valueOf(LocalDateTime.now());
        String status = "Pending";

        if (description == null || description.trim().isEmpty()) {
            response.sendRedirect("report.jsp?error=Description cannot be empty.");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO reports (user_id, description, category, status, timestamp) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userId);
            ps.setString(2, description);
            ps.setString(3, category);            
            ps.setString(4, status); 
            ps.setTimestamp(5, timestamp);
            
            ps.executeUpdate();

            // Retrieve the generated report_id
            ResultSet rs = ps.getGeneratedKeys();
            int reportId = -1; // Default to -1 if not retrieved
            if (rs.next()) {
                reportId = rs.getInt(1);
            }
            
//            LOGGER.info("Report submitted successfully! Report ID: " + reportId ", Date: " + timestamp);
             LOGGER.info("Report submitted successfully! Report ID: " + reportId + ", Status: " + status);

            response.sendRedirect("dashboard.jsp?success=Report submitted successfully");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in ReportServlet", e);
            response.sendRedirect("report.jsp?error=Something went wrong. Please check the logs.");
        }
    }
}
