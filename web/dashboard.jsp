<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Safely get the session, but don't create a new one if it doesn't exist
    HttpSession sessionUser = request.getSession(false);
    String role = "guest"; // Default role

    if (sessionUser != null) {
        Object roleObj = sessionUser.getAttribute("role");
        if (roleObj != null) {
            role = roleObj.toString();
        }
    }

    // Redirect if the user is not logged in
    if ("guest".equals(role)) {
        response.sendRedirect("login.jsp?error=Access Denied");
        return;
    }
%>
<!DOCTYPE html>
<html>
    
<head>
   

    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background: url('images/userbg.jpg') no-repeat center center fixed;

background-size: cover;
   
        }
        
        bg{
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

    .section {
margin: 20px auto;
width: 80%;
}
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to the Dashboard</h2>
        <!--<p>Your role: <strong><%= role %></strong></p>-->
        <div id='bg'>
        <% if ("admin".equals(role)) { %>
            <a href="admindashboard.jsp">Management</a>
            </div>

        <% } else { %>
            <%--<jsp:include page="nav_user.jsp" />--%>
            <a href="report.jsp">Create a Report</a>
            
            <a href="report_list.jsp">Report List</a>
            <a href="event_request.jsp">Request Event</a>
            <a href="user_event.jsp">List Event</a>
            <!--<a href="incident.jsp">View Incidents</a>-->
        <% } %>
        <div class="section">
                                <jsp:include page="announcement_list.jsp" />

        </div>
                                
        <a href="logout.jsp" class="logout">Logout</a>
    </div>

</body>
</html>

Need Help? Contact us : 03 8000 8000