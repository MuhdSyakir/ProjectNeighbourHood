<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection" %>
<!DOCTYPE html>
<html>
    <style>
    table {
        border-collapse: collapse;
        border-radius: 10px;
        overflow: hidden;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ddd;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .event-table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
}

</style>

<h3>Upcoming Events</h3>


<head>
    <title>Approved Events</title>
</head>
<body>
    <h2>Approved Events</h2>
    <div style="text-align: center;">
    <table border="1" width="50%" style="margin: auto; text-align: center;" >
        <tr>
            <th>Event ID</th>
            <th>Title</th>
            <th>Details</th>
            <th>Date</th>
        </tr>
        <%
         Connection conn = DBConnection.getConnection();
        String query = "SELECT event_id, title, details,  DATE_FORMAT(date, '%Y-%m-%d') as date FROM events WHERE status = 'Approved'";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        boolean hasEvents = false; // Flag to check if events exist

        while (rs.next()) {
            hasEvents = true;
    %>
        <tr>
            <td><%= rs.getInt("event_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("details") %></td>
            <td><%= rs.getString("date") %></td>
        </tr>
        <% } 
            rs.close();
            ps.close();
            conn.close();
        if (!hasEvents) { // If no events found, show a message
    %>
    <tr>
        <td colspan="4" style="text-align: center; color: gray; font-weight: bold;">No upcoming events</td>
    </tr>
    <% } %>
    </table>
    </div>
</body>
</html>
