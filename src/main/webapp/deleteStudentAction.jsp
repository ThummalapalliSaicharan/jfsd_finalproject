<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String studentId = request.getParameter("studentId");
    String message = "";

    if (studentId != null && !studentId.isEmpty()) {
        try {
            // Database connection details
            String jdbcURL = "jdbc:mysql://localhost:3306/ExtracurricularAchievementsDB";
            String dbUser = "root";
            String dbPassword = "Vardhan@99";

            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Step 1: Delete related records from the `student_certifications` table
            String deleteCertificationsSQL = "DELETE FROM student_certifications WHERE student_id = ?";
            PreparedStatement deleteCertificationsStatement = connection.prepareStatement(deleteCertificationsSQL);
            deleteCertificationsStatement.setString(1, studentId);
            deleteCertificationsStatement.executeUpdate();
            deleteCertificationsStatement.close();

            // Step 2: Delete related records from the `student_achievements` table
            String deleteAchievementsSQL = "DELETE FROM student_achievements WHERE student_id = ?";
            PreparedStatement deleteAchievementsStatement = connection.prepareStatement(deleteAchievementsSQL);
            deleteAchievementsStatement.setString(1, studentId);
            deleteAchievementsStatement.executeUpdate();
            deleteAchievementsStatement.close();

            // Step 3: Delete the student record from the `student_profiles` table
            String deleteSQL = "DELETE FROM student_profiles WHERE id = ?";
            PreparedStatement deleteStatement = connection.prepareStatement(deleteSQL);
            deleteStatement.setString(1, studentId);

            int rowsDeleted = deleteStatement.executeUpdate();
            if (rowsDeleted > 0) {
                message = "Student record and all related data deleted successfully.";
            } else {
                message = "Student not found or failed to delete the record.";
            }

            deleteStatement.close();
            connection.close();

        } catch (SQLException e) {
            message = "Database error while deleting student record: " + e.getMessage();
            e.printStackTrace();
        } catch (Exception e) {
            message = "Error while deleting student record: " + e.getMessage();
            e.printStackTrace();
        }
    } else {
        message = "Invalid student ID.";
    }

    request.setAttribute("message", message);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Student - Extracurricular Achievements Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Delete Student</h2>
        <p><%= request.getAttribute("message") %></p>
        <a href="adminDashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</body>
</html>
