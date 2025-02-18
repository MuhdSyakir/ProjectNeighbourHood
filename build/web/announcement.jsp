<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Announcements</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background: url('images/adminbg.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }
        .container {
            width: 90%;
            margin: 50px auto;
            padding: 20px;
           
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
        .edit {
            background-color: #007bff;
            color: white;
        }
        .edit:hover {
            background-color: #0056b3;
        }
        .delete {
            background-color: #dc3545;
            color: white;
        }
        .delete:hover {
            background-color: #a71d2a;
        }
        .create-btn {
            display: inline-block;
            padding: 10px 20px;
            background: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }
        .create-btn:hover {
            background: #218838;
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
        textarea, input[type="text"] {
            width: 80%;
            padding: 8px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        button {
            padding: 10px 15px;
            margin-top: 10px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background: #218838;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%--<jsp:include page="navbar_admin.jsp" />--%>

    <div class="container">
        <h2 style="color:black">Manage Announcements</h2>

        <!-- Form to Add a New Announcement -->
        <h3 style="color:black" >Create New Announcement</h3>
        <form action="AddAnnouncementServlet" method="POST">
            <input type="text" name="title" placeholder="Enter title" required><br><br>
            <textarea name="content" rows="4" cols="50" placeholder="Enter announcement details" required></textarea><br><br>
            <button type="submit">Post Announcement</button>
        </form>

        <hr>

        <!-- Table to Display Announcements -->
        <h3 style="color:black">Existing Announcements</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Content</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            <%
                Connection conn = DBConnection.getConnection();
                String query = "SELECT announcement_id, title, content, date_posted FROM announcements ORDER BY date_posted DESC";
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                boolean hasAnnouncements = false;
                while (rs.next()) {
                    hasAnnouncements = true;
                    int announcementId = rs.getInt("announcement_id");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String datePosted = rs.getString("date_posted");
            %>
            <tr>
                <td><%= announcementId %></td>
                <td><%= title %></td>
                <td><%= content %></td>
                <td><%= datePosted %></td>
                <td>
                    <form action="DeleteAnnouncementServlet" method="POST" style="display:inline;">
                        <input type="hidden" name="announcement_id" value="<%= announcementId %>">
                        <button type="submit" class="btn delete">Delete</button>
                    </form>
                </td>
            </tr>
            <% } 
                if (!hasAnnouncements) { %>
                <tr>
                    <td colspan="5" style="text-align: center; font-weight: bold; color: gray;">No announcements found</td>
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
