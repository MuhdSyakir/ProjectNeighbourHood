package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Login | Safe Neighborhood Network</title>\n");
      out.write("    <style>\n");
      out.write("       body {\n");
      out.write("    font-family: Arial, sans-serif;\n");
      out.write("/*    background: url('images/background.jpg') no-repeat center center fixed;*/\n");
      out.write("/*background: url('images/rumah1.jpg') no-repeat center center fixed ;\n");
      out.write("background-size: cover;*/\n");
      out.write("  background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), \n");
      out.write("                url('images/rumah1.jpg') no-repeat center center fixed;\n");
      out.write("    background-size: cover;\n");
      out.write("display: flex;\n");
      out.write("\n");
      out.write("    justify-content: center;\n");
      out.write("    align-items: center;\n");
      out.write("    height: 100vh;\n");
      out.write("    margin: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        .container {\n");
      out.write("            background: white;\n");
      out.write("            padding: 20px;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);\n");
      out.write("            text-align: center;\n");
      out.write("            width: 300px;\n");
      out.write("        }\n");
      out.write("        h2 {\n");
      out.write("            color: #333;\n");
      out.write("        }\n");
      out.write("        input {\n");
      out.write("            width: 90%;\n");
      out.write("            padding: 10px;\n");
      out.write("            margin: 10px 0;\n");
      out.write("            border: 1px solid #ccc;\n");
      out.write("            border-radius: 5px;\n");
      out.write("        }\n");
      out.write("        button {\n");
      out.write("            background-color: #28a745;\n");
      out.write("            color: white;\n");
      out.write("            padding: 10px;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            width: 100%;\n");
      out.write("        }\n");
      out.write("        button:hover {\n");
      out.write("            background-color: #218838;\n");
      out.write("        }\n");
      out.write("        p {\n");
      out.write("            margin-top: 15px;\n");
      out.write("        }\n");
      out.write("        .error-message {\n");
      out.write("            color: red;\n");
      out.write("            margin-top: 10px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h2>Login to Safe Neighborhood Network</h2>\n");
      out.write("        <form action=\"LoginServlet\" method=\"POST\">\n");
      out.write("            <input type=\"email\" name=\"email\" placeholder=\"Enter your email\" required>\n");
      out.write("            <input type=\"password\" name=\"password\" placeholder=\"Enter your password\" required>\n");
      out.write("            <button type=\"submit\">Login</button>\n");
      out.write("        </form>\n");
      out.write("        <p><a href=\"register.jsp\">Don't have an account? Register here.</a></p>\n");
      out.write("        \n");
      out.write("        ");
 String error = request.getParameter("error");
           if (error != null) { 
      out.write("\n");
      out.write("            <p class=\"error-message\">");
      out.print( error );
      out.write("</p>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("    </div>\n");
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
