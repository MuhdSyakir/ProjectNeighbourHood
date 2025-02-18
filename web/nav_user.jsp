<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #007bff;
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            align-items: center;
        }
        .navbar .logo {
            font-size: 22px;
            font-weight: bold;
            color: white;
        }
        .nav-links {
            list-style: none;
            display: flex;
        }
        .nav-links li {
            padding: 10px 15px;
        }
        .nav-links li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            padding: 8px 12px;
            border-radius: 5px;
        }
        .nav-links li a:hover {
            background-color: #0056b3;
        }
        .logout {
            background-color: red;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
        }
        .logout:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="logo">USER</div>
        <ul class="nav-links">
            <li><a href="report.jsp">Create a Report</a></li>
            <li><a href="event_request.jsp">Request Event</a></li>
            <li><a href="report_list.jsp">Report List</a></li>
            <!--<li><a href="logout.jsp" class="logout">Logout</a></li>-->
        </ul>
    </div>

</body>
</html>
