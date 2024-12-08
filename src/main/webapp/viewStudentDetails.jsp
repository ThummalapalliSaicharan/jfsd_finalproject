<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String studentId = request.getParameter("studentId");
    String username = "";
    String email = "";

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
    <title>Student Details - Extracurricular Achievements Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Student Details</h2>
        <div class="mb-3">
            <label class="form-label">Username:</label>
            <p><%= username %></p>
        </div>
        <div class="mb-3">
            <label class="form-label">Email:</label>
            <p><%= email %></p>
        </div>
        <a href="adminDashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</body>
</html>
