<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Manage Reports</title>
    <style>
       body { 
    font-family: Arial, sans-serif; 
    text-align: center; 
    background-color: #f8f9fa; /* Light gray background for better contrast */
    background: url('images/adminbg.jpg') no-repeat center center fixed;
    background-size: cover;
}

table { 
    width: 80%; 
    margin: 100px auto; 
    border-collapse: collapse; 
    border-radius: 10px; 
    overflow: hidden;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* Soft shadow effect */
    background: white;
}

th, td { 
    padding: 10px; 
    border: 1px solid #ddd; 
    text-align: center; /* Ensures text stays centered */
}

th { 
    background-color: #007bff; /* Blue header */
    color: white;
    text-transform: uppercase;
}

tr:nth-child(even) { 
    background-color: #f2f2f2; /* Light gray alternate row color */
}

.status-pending { 
    color: red; 
    font-weight: bold; 
}

.status-in-progress { 
    color: orange; 
    font-weight: bold; 
}

.status-resolved { 
    color: green; 
    font-weight: bold; 
}

/* Hover effect for better interaction */
tr:hover { 
    background-color: #e9ecef; 
    transition: 0.3s;

}

    </style>
</head>
<body>
    <h2>Admin - View & Manage Reports</h2>

    <%
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
    %>
                <p style="color: red;">Database connection failed. Please check DBConnection.</p>
    <%
            } else {
                String query = "SELECT r.report_id, u.name AS user_name, r.category, r.description, r.timestamp, r.status " +
                   "FROM reports r " +
                   "INNER JOIN users u ON r.user_id = u.user_id";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
    %>
    
                <table>
                    <tr>
                        <th>Report ID</th>
                        <th>User ID</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Date Reported</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
    <%
                while (rs.next()) {
                    int reportId = rs.getInt("report_id");
                    String userId = rs.getString("user_name");
                    String category = rs.getString("category");
                    String description = rs.getString("description");
                    Timestamp timestamp = rs.getTimestamp("timestamp");
                    String status = rs.getString("status");

                    String statusClass = "";
                    if ("Pending".equals(status)) statusClass = "status-pending";
                    else if ("In Progress".equals(status)) statusClass = "status-in-progress";
                    else if ("Resolved".equals(status)) statusClass = "status-resolved";
    %>
                    <tr>
                        <td><%= reportId %></td>
                        <td><%= userId %></td>
                        <td><%= category %></td>
                        <td><%= description %></td>
                        <td><%= timestamp %></td>
                        <td class="<%= statusClass %>"><%= status %></td>
                        <td>
                            <form action="UpdateStatusServlet" method="POST">
                                <input type="hidden" name="report_id" value="<%= reportId %>">
                                <select name="status">
                                    <option value="Pending" <%= "Pending".equals(status) ? "selected" : "" %>>Pending</option>
                                    <option value="In Progress" <%= "In Progress".equals(status) ? "selected" : "" %>>In Progress</option>
                                    <option value="Resolved" <%= "Resolved".equals(status) ? "selected" : "" %>>Resolved</option>
                                </select>
                                <br></br>
                                <button type="submit">Update</button>
                            </form>
                        </td>
                    </tr>
    <%
                }
            }
        } catch (Exception e) {
    %>
            <p style="color: red;">Error: <%= e.getMessage() %></p>
    <%
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    %>
    
    <% String success = request.getParameter("success");
   String error = request.getParameter("error");
   if (success != null) { %>
    <p style="color: green;"><%= success %></p>
<% } else if (error != null) { %>
    <p style="color: red;"><%= error %></p>
<% } %>

                </table>
<button><a href="admindashboard.jsp">Back</a></button>
</body>
</html>
