package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import util.DBConnection;

public final class manage_005fuser_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Manage Users</title>\n");
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
      out.write("        .status-active {\n");
      out.write("            color: green;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        .status-suspended {\n");
      out.write("            color: orange;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        .status-banned {\n");
      out.write("            color: red;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <h2>Admin - Manage Users</h2>\n");
      out.write("\n");
      out.write("    <!-- Success/Error Messages -->\n");
      out.write("    ");
 String success = request.getParameter("success");
       String error = request.getParameter("error");
       if (success != null) { 
      out.write("\n");
      out.write("        <p style=\"color: green;\">");
      out.print( success );
      out.write("</p>\n");
      out.write("    ");
 } else if (error != null) { 
      out.write("\n");
      out.write("        <p style=\"color: red;\">");
      out.print( error );
      out.write("</p>\n");
      out.write("    ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("    <table>\n");
      out.write("        <tr>\n");
      out.write("            <th>User ID</th>\n");
      out.write("            <th>Name</th>\n");
      out.write("            <th>Email</th>\n");
      out.write("            <th>Role</th>\n");
      out.write("            <th>Status</th>\n");
      out.write("            <th>Actions</th>\n");
      out.write("        </tr>\n");
      out.write("        ");

            Connection conn = DBConnection.getConnection();
            String query = "SELECT user_id, name, email, role, status FROM users";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("user_id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String role = rs.getString("role");
                String status = rs.getString("status");

                String statusClass = "";
                if ("Active".equals(status)) statusClass = "status-active";
                else if ("Suspended".equals(status)) statusClass = "status-suspended";
                else if ("Banned".equals(status)) statusClass = "status-banned";
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( userId );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( name );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( email );
      out.write("</td>\n");
      out.write("            <td>\n");
      out.write("                <form action=\"UpdateUserServlet\" method=\"POST\">\n");
      out.write("                    <input type=\"hidden\" name=\"user_id\" value=\"");
      out.print( userId );
      out.write("\">\n");
      out.write("                    <select name=\"role\">\n");
      out.write("                        <option value=\"user\" ");
      out.print( role.equals("user") ? "selected" : "" );
      out.write(">User</option>\n");
      out.write("                        <option value=\"admin\" ");
      out.print( role.equals("admin") ? "selected" : "" );
      out.write(">Admin</option>\n");
      out.write("                    </select>\n");
      out.write("                    <button type=\"submit\">Update Role</button>\n");
      out.write("                </form>\n");
      out.write("            </td>\n");
      out.write("            <td class=\"");
      out.print( statusClass );
      out.write("\">\n");
      out.write("                <form action=\"UpdateUserStatusServlet\" method=\"POST\">\n");
      out.write("                    <input type=\"hidden\" name=\"user_id\" value=\"");
      out.print( userId );
      out.write("\">\n");
      out.write("                    <select name=\"status\">\n");
      out.write("                        <option value=\"Active\" ");
      out.print( status.equals("Active") ? "selected" : "" );
      out.write(">Active</option>\n");
      out.write("                        <option value=\"Suspended\" ");
      out.print( status.equals("Suspended") ? "selected" : "" );
      out.write(">Suspended</option>\n");
      out.write("                        <option value=\"Banned\" ");
      out.print( status.equals("Banned") ? "selected" : "" );
      out.write(">Banned</option>\n");
      out.write("                    </select>\n");
      out.write("                    <button type=\"submit\">Update Status</button>\n");
      out.write("                </form>\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                <form action=\"DeleteUserServlet\" method=\"POST\">\n");
      out.write("                    <input type=\"hidden\" name=\"user_id\" value=\"");
      out.print( userId );
      out.write("\">\n");
      out.write("                    <button type=\"submit\" style=\"background-color: red; color: white;\">Delete</button>\n");
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
      out.write("    <p><a href=\"admin_dashboard.jsp\">Back to Dashboard</a></p>\n");
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
