package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class incident_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Report Incident</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <h2>Report an Incident</h2>\n");
      out.write("    <form action=\"ReportServlet\" method=\"POST\">\n");
      out.write("        <label for=\"category\">Category:</label>\n");
      out.write("        <select name=\"category\" required>\n");
      out.write("            <option value=\"Security\">Security</option>\n");
      out.write("            <option value=\"Maintenance\">Maintenance</option>\n");
      out.write("            <option value=\"Other\">Other</option>\n");
      out.write("        </select><br><br>\n");
      out.write("        <label for=\"description\">Description:</label><br>\n");
      out.write("        <textarea name=\"description\" rows=\"5\" cols=\"30\" required></textarea><br><br>\n");
      out.write("        <button type=\"submit\">Submit Report</button>\n");
      out.write("    </form>\n");
      out.write("    <p><a href=\"dashboard.jsp\">Back to Dashboard</a></p>\n");
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
