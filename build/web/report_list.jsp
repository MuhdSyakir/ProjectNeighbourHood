<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Reports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background: url('images/userbg.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }
        .container {
            width: 90%;
            margin: 180px auto;
            padding: 20px;
            /*background: rgba(0, 0, 0, 0.7);*/
            /*border-radius: 10px;*/
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
            color: black;
        }
        tr:nth-child(odd) {
            background-color: white;
            color: black;
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
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }
        .back-btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%--<jsp:include page="navbar_user.jsp" />--%>

    <div class="container">
        <h2 style='color: black'>My Reports</h2>

        <table>
            <tr>
                <th>Report ID</th>
                <th>Category</th>
                <th>Description</th>
                <th>Date Reported</th>
                <th>Status</th>
            </tr>
            <%
                Integer userId = (Integer) session.getAttribute("user_id");

                if (userId == null) {
                    response.sendRedirect("login.jsp?error=Please login first.");
                    return;
                }

                Connection conn = DBConnection.getConnection();
                String query = "SELECT report_id, category, description, timestamp, status FROM reports WHERE user_id = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                boolean hasReports = false;
                while (rs.next()) {
                    hasReports = true;
                    int reportId = rs.getInt("report_id");
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
                <td><%= category %></td>
                <td><%= description %></td>
                <td><%= timestamp %></td>
                <td class="<%= statusClass %>"><%= status %></td>
            </tr>
            <% } 
                if (!hasReports) { %>
                <tr>
                    <td colspan="5" style="text-align: center; font-weight: bold; color: gray;">No reports found</td>
                </tr>
            <% }
                rs.close();
                ps.close();
                conn.close();
            %>
        </table>

        <a href="dashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>
    </div>

</body>
</html>
