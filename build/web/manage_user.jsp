<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Users</title>
    <style>
        body { 
    font-family: Arial, sans-serif; 
    text-align: center; 
    background-color: #f8f9fa; /* Light background for contrast */
    margin: 0;
    padding: 0;
     background: url('images/adminbg.jpg') no-repeat center center fixed;
            background-size: cover;
}

table { 
    width: 80%; 
    margin: 140px auto; 
    border-collapse: collapse; 
    border-radius: 10px; 
    overflow: hidden;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* Soft shadow */
    background: white;
}

th, td { 
    padding: 10px; 
    border: 1px solid #ddd; 
    text-align: center;
}

th { 
    background-color: #007bff; /* Blue header */
    color: white;
    text-transform: uppercase;
}

tr:nth-child(even) { 
    background-color: #f2f2f2; /* Light gray alternate row */
}

tr:hover { 
    background-color: #e9ecef; 
    transition: 0.3s;
}

/* Status Styles */
.status-pending { 
    color: red; 
    font-weight: bold; 
}

.status-in-progress { 
    color: orange; 
    font-weight: bold; 
}

.status-resolved { 
    color: green; 
    font-weight: bold; 
}

/* Button Styles */
.btn { 
    padding: 6px 12px; 
    margin: 3px; 
    cursor: pointer; 
    border: none; 
    border-radius: 5px; 
    font-size: 14px;
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

.status { 
    background-color: #28a745; 
    color: white; 
}

.status:hover { 
    background-color: #1e7e34; 
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

    <% 
//        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

        if (role == null || !role.equals("admin")) { 
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <h2>Admin - Manage Users</h2>

    <table>
        <tr>
            <th>User ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                conn = DBConnection.getConnection();
                if (conn != null) {
                    String query = "SELECT user_id, name, email, role, status FROM users";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        int userId = rs.getInt("user_id");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String userRole = rs.getString("role");
                        String status = rs.getString("status");
        %>
        <tr>
            <td><%= userId %></td>
            <td><%= name %></td>
            <td><%= email %></td>
            <td>
                <form action="UpdateUserServlet" method="POST" style="display: inline;">
                    <input type="hidden" name="user_id" value="<%= userId %>">
                    <select name="role">
                        <option value="user" <%= userRole.equals("user") ? "selected" : "" %>>User</option>
                        <option value="admin" <%= userRole.equals("admin") ? "selected" : "" %>>Admin</option>
                    </select>
                    <button type="submit" class="btn edit">Update</button>
                </form>
            </td>
            <td>
                <form action="UpdateUserStatusServlet" method="POST" style="display: inline;">
                    <input type="hidden" name="user_id" value="<%= userId %>">
                    <select name="status">
                        <option value="Active" <%= status.equals("Active") ? "selected" : "" %>>Active</option>
                        <option value="Inactive" <%= status.equals("Inactive") ? "selected" : "" %>>Inactive</option>
                    </select>
                    <button type="submit" class="btn status">Change</button>
                </form>
            </td>
            <td>
                <form action="DeleteUserServlet" method="POST" style="display: inline;">
                    <input type="hidden" name="user_id" value="<%= userId %>">
                    <button type="submit" class="btn delete" onclick="return confirm('Are you sure you want to delete this user?');">Delete</button>
                </form>
            </td>
        </tr>
        <% 
                    }
                } else { 
        %>
            <p style="color: red;">Error: Database connection failed!</p>
        <% 
                }
            } catch (Exception e) {  
        %>
            <p style="color: red;">Error: <%= e.getMessage() %></p>
        <%
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (ps != null) try { ps.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
    </table>

   <a href="admindashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>
</body>
</html>
