<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String studentId = request.getParameter("studentId");
    String username = "";
    String email = "";
    String password = "";

    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/ExtracurricularAchievementsDB";
    String dbUser = "root";
    String dbPassword = "Vardhan@99";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "SELECT * FROM student_profiles WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, studentId);

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            username = resultSet.getString("username");
            email = resultSet.getString("email");
            password = resultSet.getString("password");
        }

        resultSet.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Student - Extracurricular Achievements Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .form-label {
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        .form-control {
            border-radius: 10px;
            box-shadow: none;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .mb-3 {
            margin-bottom: 20px;
        }

        .btn {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Student</h2>
        <form action="updateStudentAction.jsp" method="post">
            <input type="hidden" name="studentId" value="<%= studentId %>">
            <div class="mb-3">
                <label for="studentUsername" class="form-label">Username</label>
                <input type="text" class="form-control" id="studentUsername" name="username" value="<%= username %>" required>
            </div>
            <div class="mb-3">
                <label for="studentEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="studentEmail" name="email" value="<%= email %>" required>
            </div>
            <div class="mb-3">
                <label for="studentPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="studentPassword" name="password" value="<%= password %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Student</button>
        </form>
    </div>
</body>
</html>
