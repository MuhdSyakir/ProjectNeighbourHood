<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Request an Event</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
              background: url('images/reqevnt.jpg') no-repeat center center fixed;
              background-size: cover;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: 200px auto;
        }
        h2 {
            color: #333;
        }
        input, textarea {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
        }
        p {
            margin-top: 15px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Request an Event</h2>
        <form action="EventRequestServlet" method="POST">
            <label for="title">Event Title:</label><br>
            <input type="text" name="title" required><br>

            <label for="details">Event Details:</label><br>
            <textarea name="details" rows="4" required></textarea><br>

            <label for="date">Event Date:</label><br>
            <input type="date" name="date" required><br>

            <button type="submit">Submit Request</button>
        </form>
        <p><a href="dashboard.jsp">Back to Dashboard</a></p>
    </div>

</body>
</html>
