<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get the session but don't create a new one if it doesn't exist
    HttpSession sessionUser = request.getSession(false);
    String role = "guest"; // Default role

    if (sessionUser != null) {
        Object roleObj = sessionUser.getAttribute("role");
        if (roleObj != null) {
            role = roleObj.toString();
        }
    }

    // Redirect if the user is not an admin
    if (!"admin".equals(role)) {
        response.sendRedirect("login.jsp?error=Access Denied");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
             background: url('images/adminbg.jpg') no-repeat center center fixed;
              background-size: cover;
        }
        .container {
            margin-top: 50px;
        }
        a {
            display: block;
            margin: 10px auto;
            padding: 10px;
            width: 200px;
            text-align: center;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
        .logout {
            background-color: red;
        }
        .logout:hover {
            background-color: darkred;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Dashboard</h2>
        <p>Your role: <strong><%= role %></strong></p>
        
        <a href="view_report.jsp">Manage Reports</a>
        <a href="manage_events.jsp">Manage Events</a>
        <a href="manage_user.jsp">Manage Users</a>
        <a href="announcement.jsp">Manage Announcement</a>
        <br>
        <a href="dashboard.jsp">Back</a>
        <a href="logout.jsp" class="logout">Logout</a>
    </div>
</body>
</html>

