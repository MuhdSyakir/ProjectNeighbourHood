<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Event Requests</title>
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
            margin: 150px auto;
            padding: 20px;
/*            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;*/
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            background: white;
            color: black;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .pending { color: orange; }
        .approved { color: green; }
        .rejected { color: red; }
        .cancel-btn {
            padding: 8px 12px;
            background: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .cancel-btn:hover {
            background: #a71d2a;
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

    <%--<jsp:include page="navbar_user.jsp" />--%>

    <div class="container">
        <h2 style="color:black">Event Available</h2>

        <table>
            <tr>
                <th>Event ID</th>
                <th>Title</th>
                <th>Details</th>
                <th>Date</th>
                <th>Status</th>
            </tr>

            <%
//                HttpSession session = request.getSession();
                Integer userId = (Integer) session.getAttribute("user_id");  // Get logged-in user ID
                
                if (userId == null) {
                    response.sendRedirect("login.jsp"); // Redirect if not logged in
                    return;
                }

                Connection conn = DBConnection.getConnection();
                String query = "SELECT event_id, title, details, DATE_FORMAT(date, '%Y-%m-%d') as date, status FROM events WHERE created_by = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                boolean hasRequests = false;
                while (rs.next()) {
                    hasRequests = true;
                    int eventId = rs.getInt("event_id");
                    String title = rs.getString("title");
                    String details = rs.getString("details");
                    String eventDate = rs.getString("date");
                    String status = rs.getString("status");

                    String statusClass = "";
                    if ("Pending".equals(status)) statusClass = "pending";
                    else if ("Approved".equals(status)) statusClass = "approved";
                    else if ("Rejected".equals(status)) statusClass = "rejected";
            %>
            <tr>
                <td><%= eventId %></td>
                <td><%= title %></td>
                <td><%= details %></td>
                <td><%= eventDate %></td>
                <td class="<%= statusClass %>"><%= status %></td>
                
            </tr>
            <% } 
                if (!hasRequests) { %>
                <tr>
                    <td colspan="6" style="text-align: center; font-weight: bold; color: gray;">No event requests found</td>
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
