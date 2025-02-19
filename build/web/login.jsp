<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Safe Neighborhood Network</title>
    <style>
       body {
    font-family: Arial, sans-serif;
/*    background: url('images/background.jpg') no-repeat center center fixed;*/
/*background: url('images/rumah1.jpg') no-repeat center center fixed ;
background-size: cover;*/
  background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), 
                url('images/rumah1.jpg') no-repeat center center fixed;
    background-size: cover;
display: flex;

    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}



        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
        }
        h2 {
            color: #333;
        }
        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #218838;
        }
        p {
            margin-top: 15px;
        }
        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login to Safe Neighborhood Network</h2>
        <form action="LoginServlet" method="POST">
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="password" name="password" placeholder="Enter your password" required>
            <button type="submit">Login</button>
        </form>
        <p><a href="register.jsp">Don't have an account? Register here.</a></p>
        
        <% String error = request.getParameter("error");
           if (error != null) { %>
            <p class="error-message"><%= error %></p>
        <% } %>
    </div>
</body>
</html>
