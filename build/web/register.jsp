<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register | Safe Neighborhood Network</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/regis1.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            display: flex;
            width: 60%;
            background: white;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .form-container {
            width: 50%;
            padding: 20px;
            text-align: left;
        }
        .image-container {
            width: 50%;
            padding: 5px;
            margin: 70px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background: url('images/regis.jpg') no-repeat center center;
            background-size: cover;
        }
        h2 {
            color: #333;
        }
        input {
            width: 100%;
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
        <div class="form-container">
            <h2>Register for Safe Neighborhood Network</h2>
            <form action="RegisterServlet" method="post">
                <input type="text" name="name" placeholder="Enter your name" required>
                <input type="email" name="email" placeholder="Enter your email" required>
                <input type="password" name="password" placeholder="Enter your password" required>
                <input type="text" name="house_number" placeholder="Enter your house number" required>
                <button type="submit">Register</button>
            </form>
            <p><a href="login.jsp">Already have an account? Login here.</a></p>
        </div>
        <div class="image-container"></div>
    </div>
</body>
</html>
