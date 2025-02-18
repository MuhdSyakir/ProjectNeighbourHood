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

@WebServlet("/RegisterServlet") // This makes sure the servlet is accessible at this URL

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String houseNumber = request.getParameter("house_number");

        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO users (name, email, password, house_number, role, no_phone, status) VALUES (?, ?, ?, ?, ?, ?,?)";


            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, houseNumber);
            ps.setString(5, "user"); // Default role
            ps.setString(6, ""); // Empty phone number (if optional)
             ps.setString(7, "Active");
            ps.executeUpdate();

            response.sendRedirect("login.jsp?success=Registration successful");
        } 
//        catch (Exception e) {
//            e.printStackTrace();
//        }
//        
        catch (Exception e) {
    e.printStackTrace(); // Logs error in Tomcat console
    response.getWriter().println("Error: " + e.getMessage()); // Show error on webpage
}

    }
}
