import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnection;

@WebServlet("/DeleteAnnouncementServlet")
public class DeleteAnnouncementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String announcementIdStr = request.getParameter("announcement_id");

        if (announcementIdStr == null || announcementIdStr.isEmpty()) {
            response.sendRedirect("announcement.jsp?error=Invalid%20announcement%20ID");
            return;
        }

        int announcementId = Integer.parseInt(announcementIdStr);

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "DELETE FROM announcements WHERE announcement_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, announcementId);
            int rowsDeleted = ps.executeUpdate();

            ps.close();
            conn.close();

            if (rowsDeleted > 0) {
                response.sendRedirect("announcement.jsp?success=Announcement%20deleted%20successfully");
            } else {
                response.sendRedirect("announcement.jsp?error=Announcement%20not%20found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("announcement.jsp?error=Database%20error");
        }
    }
}
