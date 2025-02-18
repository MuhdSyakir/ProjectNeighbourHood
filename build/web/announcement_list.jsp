<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Latest Announcements</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

    <h2>Latest Announcements</h2>
    <div style="text-align: center;">
    <table border="1">
        <tr>
            <th>Title</th>
            <th>Content</th>
            <th>Date Posted</th>
        </tr>
        
        <%
            Connection conn = DBConnection.getConnection();
            String query = "SELECT title, content, DATE_FORMAT(date_posted, '%Y-%m-%d %H:%i') as formatted_date FROM announcements ORDER BY date_posted DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            boolean hasAnnouncements = false;

            while (rs.next()) {
                hasAnnouncements = true;
        %>
        <tr>
            <td><strong><%= rs.getString("title") %></strong></td>
            <td><%= rs.getString("content") %></td>
            <td><%= rs.getString("formatted_date") %></td>
        </tr>
        <% } 
            rs.close();
            ps.close();
            conn.close();

            if (!hasAnnouncements) { // If no announcements, show a message
        %>
        <tr>
            <td colspan="3" style="text-align: center; color: gray; font-weight: bold;">No announcements available</td>
        </tr>
        <% } %>
    </table>
    </div>

</body>
</html>
