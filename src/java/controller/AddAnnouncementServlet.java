import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnection;

@WebServlet("/AddAnnouncementServlet")
public class AddAnnouncementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (title == null || title.isEmpty() || content == null || content.isEmpty()) {
            response.sendRedirect("announcement.jsp?error=All%20fields%20are%20required");
            return;
        }

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO announcements (title, content, date_posted) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));

            int rowsInserted = ps.executeUpdate();
            ps.close();
            conn.close();

            if (rowsInserted > 0) {
                response.sendRedirect("announcement.jsp?success=Announcement%20posted%20successfully");
            } else {
                response.sendRedirect("announcement.jsp?error=Failed%20to%20post%20announcement");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("announcement.jsp?error=Database%20error");
        }
    }
}
