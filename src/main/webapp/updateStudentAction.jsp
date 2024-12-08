<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    // Initialize variables to store updated data
    String studentId = request.getParameter("studentId");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/ExtracurricularAchievementsDB";
    String dbUser = "root";
    String dbPassword = "Vardhan@99";
    
    // Variables for feedback
    boolean isUpdated = false;
    String message = "";

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // SQL query to update student information
        String updateSQL = "UPDATE student_profiles SET username = ?, email = ?, password = ? WHERE id = ?";
        PreparedStatement updateStatement = connection.prepareStatement(updateSQL);
        updateStatement.setString(1, username);
        updateStatement.setString(2, email);
        updateStatement.setString(3, password);
        updateStatement.setString(4, studentId);

        // Execute the update query
        int rowsUpdated = updateStatement.executeUpdate();
        
        if (rowsUpdated > 0) {
            isUpdated = true;
            message = "Student information updated successfully.";
        } else {
            message = "Failed to update student information.";
        }

        // Close resources
        updateStatement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        message = "Error while updating student information.";
    }

    // Set feedback message as a request attribute to display it in the view
    request.setAttribute("message", message);
    request.setAttribute("isUpdated", isUpdated);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Student - Extracurricular Achievements Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Student</h2>

        <% if (request.getAttribute("isUpdated") != null && (Boolean)request.getAttribute("isUpdated")) { %>
            <div class="alert alert-success">
                <%= request.getAttribute("message") %>
            </div>
        <% } else if (request.getAttribute("message") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

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

        <div class="mt-4">
            <a href="studentDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
