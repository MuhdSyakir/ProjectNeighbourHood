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


@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportIdStr = request.getParameter("report_id");
        String newStatus = request.getParameter("status");

        if (reportIdStr == null || newStatus == null) {
            response.sendRedirect("view_reports.jsp?error=Invalid+request");
            return;
        }

        int reportId = Integer.parseInt(reportIdStr);

        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                String query = "UPDATE reports SET status = ? WHERE report_id = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, newStatus);
                ps.setInt(2, reportId);
                int rowsUpdated = ps.executeUpdate();

                ps.close();

                if (rowsUpdated > 0) {
                    response.sendRedirect("view_report.jsp?success=Status+updated+successfully");
                } else {
                    response.sendRedirect("view_report.jsp?error=Failed+to+update+status");
                }
            } else {
                response.sendRedirect("view_report.jsp?error=Database+connection+failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("view_report.jsp?error=Internal+server+error");
        }
    }
}
