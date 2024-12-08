<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String resetStatus = "";
    
    // Handle form submission for password reset request
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String username = request.getParameter("username");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/ExtracurricularAchievementsDB"; // Replace with your database name
        String dbUser = "root"; // Replace with your database username
        String dbPassword = "Vardhan@99"; // Your database password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            // SQL query to check if the username exists
            String sql = "SELECT * FROM student_profiles WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                // If username exists, send an email or show reset instructions here
                resetStatus = "Instructions to reset your password have been sent to your email.";
            } else {
                resetStatus = "No account found with that username.";
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            resetStatus = "Database error occurred!";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password - Extracurricular Achievements Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Center content */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url("https://example.com/path-to-your-best-background.jpg") no-repeat center center fixed;
            background-size: cover;
            color: white;
        }
        .container {
            max-width: 400px;
            width: 100%;
            background: rgba(0, 0, 0, 0.75);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.2);
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .text-danger {
            color: #f8d7da;
        }
        /* Compress input box */
        .form-control {
            max-width: 300px; /* Limit width of input box */
            margin: 0 auto;  /* Center the input box */
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Forgot Password</h2>
        <form action="forgotPassword.jsp" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            <div class="text-danger text-center mt-2">
                <%= resetStatus %>
            </div>
        </form>
    </div>
</body>
</html>
