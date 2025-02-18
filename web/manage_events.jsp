<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Events</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background: url('images/adminbg.jpg') no-repeat center center fixed;
            background-size: cover;
            /*color: white;*/
        }
        .container {
            width: 90%;
            margin: 50px auto;
            padding: 20px;
/*            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;*/
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
        .btn {
            padding: 8px 12px;
            margin: 2px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            transition: 0.3s;
        }
        .approve {
            background-color: #28a745;
            color: white;
        }
        .approve:hover {
            background-color: #1e7e34;
        }
        .reject {
            background-color: #dc3545;
            color: white;
        }
        .reject:hover {
            background-color: #a71d2a;
        }
        .delete {
            background-color: #ffcc00;
            color: black;
        }
        .delete:hover {
            background-color: #d4a600;
        }
        .create-btn {
            display: inline-block;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }
        .create-btn:hover {
            background: #0056b3;
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
    <%--<jsp:include page="navbar_admin.jsp" />--%>

    <div class="container">
        <h2 style='color: black'>Manage Event Requests</h2>

        <a href="event_request.jsp" class="create-btn">➕ Create Event</a>

        <table>
            <tr>
                <th>Event ID</th>
                <th>Title</th>
                <th>Details</th>
                <th>Date</th>
                <th>Requested By</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                Connection conn = DBConnection.getConnection();
                String query = "SELECT e.event_id, e.title, e.details, DATE_FORMAT(e.date, '%Y-%m-%d') as date, " +
                               "u.name AS created_by, e.status, u.role " +
                               "FROM events e " +
                               "INNER JOIN users u ON e.created_by = u.user_id";

                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                boolean hasEvents = false;
                while (rs.next()) {
                    hasEvents = true;
                    int eventId = rs.getInt("event_id");
                    String title = rs.getString("title");
                    String details = rs.getString("details");
                    String eventDate = rs.getString("date");
                    String createdBy = rs.getString("created_by");
                    String status = rs.getString("status");
                    String role = rs.getString("role");
            %>
            <tr>
                <td><%= eventId %></td>
                <td><%= title %></td>
                <td><%= details %></td>
                <td><%= eventDate %></td>
                <td><%= role %> : <%= createdBy %></td>
                <td><%= status %></td>
                <td>
                    <% if ("Pending".equals(status)) { %>
                        <form action="UpdateEventStatusServlet" method="POST" style="display:inline;">
                            <input type="hidden" name="event_id" value="<%= eventId %>">
                            <button type="submit" name="status" value="Approved" class="btn approve">Approve</button>
                            <button type="submit" name="status" value="Rejected" class="btn reject">Reject</button>
                        </form>
                    <% } %>
                    
                    <!-- Delete button for all events -->
                    <form action="DeleteEventServlet" method="POST" style="display:inline;">
                        <input type="hidden" name="event_id" value="<%= eventId %>">
                        <button type="submit" class="btn delete">Delete</button>
                    </form>
                </td>
            </tr>
            <% } 
                if (!hasEvents) { %>
                <tr>
                    <td colspan="7" style="text-align: center; font-weight: bold; color: gray;">No events found</td>
                </tr>
            <% }
                rs.close();
                ps.close();
                conn.close();
            %>
        </table>

        <a href="admindashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>
    </div>

</body>
</html>
