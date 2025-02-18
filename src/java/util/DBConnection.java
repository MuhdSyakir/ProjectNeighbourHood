package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/event_management?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root"; // Replace with your DB username
    private static final String PASSWORD = ""; // Replace with your DB password

    // Static method to get a connection
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Return a connection to the database
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
