<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>

<div class="navbar">
    <a href="view_report.jsp">Manage Reports</a>
    <a href="manage_events.jsp">Manage Events</a>
    <a href="manage_user.jsp">Manage Users</a>
    <a href="announcement.jsp">Manage Announcement</a>
    <a href="dashboard.jsp">Back</a>
    <a href="logout.jsp" class="logout">Logout</a>
</div>
</body>
<style>
    .navbar {
        background-color: #007BFF;
        padding: 10px;
        text-align: center;
    }
    .navbar a {
        color: white;
        text-decoration: none;
        padding: 10px 20px;
        display: inline-block;
        border-radius: 5px;
    }
    .navbar a:hover {
        background-color: #0056b3;
    }
    .logout {
        background-color: red;
    }
    .logout:hover {
        background-color: darkred;
    }
</style>
