package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import util.DBConnection;

public final class admindashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Admin Dashboard - Manage Reports</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        table {\n");
      out.write("            width: 80%;\n");
      out.write("            margin: 20px auto;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("        }\n");
      out.write("        th, td {\n");
      out.write("            padding: 10px;\n");
      out.write("            border: 1px solid #ddd;\n");
      out.write("        }\n");
      out.write("        th {\n");
      out.write("            background-color: #f4f4f4;\n");
      out.write("        }\n");
      out.write("        .status-pending {\n");
      out.write("            color: red;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        .status-in-progress {\n");
      out.write("            color: orange;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        .status-resolved {\n");
      out.write("            color: green;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <h2>Admin - View & Manage Reports</h2>\n");
      out.write("    <table>\n");
      out.write("        <tr>\n");
      out.write("            <th>Report ID</th>\n");
      out.write("            <th>User ID</th>\n");
      out.write("            <th>Category</th>\n");
      out.write("            <th>Description</th>\n");
      out.write("            <th>Date Reported</th>\n");
      out.write("            <th>Status</th>\n");
      out.write("            <th>Action</th>\n");
      out.write("        </tr>\n");
      out.write("        ");

            Connection conn = DBConnection.getConnection();
            String query = "SELECT report_id, user_id, category, description, date_report, status FROM reports";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int reportId = rs.getInt("report_id");
                int userId = rs.getInt("user_id");
                String category = rs.getString("category");
                String description = rs.getString("description");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String status = rs.getString("status");

                String statusClass = "";
                if ("Pending".equals(status)) statusClass = "status-pending";
                else if ("In Progress".equals(status)) statusClass = "status-in-progress";
                else if ("Resolved".equals(status)) statusClass = "status-resolved";
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( reportId );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( userId );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( category );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( description );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( timestamp );
      out.write("</td>\n");
      out.write("            <td class=\"");
      out.print( statusClass );
      out.write('"');
      out.write('>');
      out.print( status );
      out.write("</td>\n");
      out.write("            <td>\n");
      out.write("                <form action=\"UpdateStatusServlet\" method=\"POST\">\n");
      out.write("                    <input type=\"hidden\" name=\"report_id\" value=\"");
      out.print( reportId );
      out.write("\">\n");
      out.write("                    <select name=\"status\">\n");
      out.write("                        <option value=\"Pending\" ");
      out.print( status.equals("Pending") ? "selected" : "" );
      out.write(">Pending</option>\n");
      out.write("                        <option value=\"In Progress\" ");
      out.print( status.equals("In Progress") ? "selected" : "" );
      out.write(">In Progress</option>\n");
      out.write("                        <option value=\"Resolved\" ");
      out.print( status.equals("Resolved") ? "selected" : "" );
      out.write(">Resolved</option>\n");
      out.write("                    </select>\n");
      out.write("                    <button type=\"submit\">Update</button>\n");
      out.write("                </form>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        ");
 } 
            rs.close();
            ps.close();
            conn.close();
        
      out.write("\n");
      out.write("    </table>\n");
      out.write("\n");
      out.write("    <p><a href=\"logout.jsp\">Logout</a></p>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
