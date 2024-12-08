<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 30px;
        }

        .navbar {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control, .btn {
            border-radius: 8px;
        }

        .btn-info {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }

        .btn-info:hover {
            opacity: 0.9;
        }

        .table th, .table td {
            text-align: center;
        }

        .table th {
            background-color: #d3d3d3;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }

        .nav-links {
            margin-bottom: 20px;
            text-align: center;
        }

        .footer {
            margin-top: 20px;
            text-align: center;
            color: #6c757d;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2 class="text-center mb-4">Admin Dashboard</h2>

        <!-- Navigation Buttons -->
        <div class="nav-links mb-4">
           
            <a href="addNewEvent.jsp" class="btn btn-success">Add New Event</a>
            <a href="registeredStudents.jsp" class="btn btn-info">Registered Students</a> <!-- New button -->
        </div>

        <!-- Student List Table -->
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Student List</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String jdbcURL = "jdbc:mysql://localhost:3306/ExtracurricularAchievementsDB";
                            String dbUser = "root";
                            String dbPassword = "Vardhan@99";

                            Connection connection = null;
                            PreparedStatement statement = null;
                            ResultSet resultSet = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                                String sql = "SELECT * FROM student_profiles";
                                statement = connection.prepareStatement(sql);
                                resultSet = statement.executeQuery();

                                while (resultSet.next()) {
                                    String studentId = resultSet.getString("id");
                                    String username = resultSet.getString("username");
                                    String email = resultSet.getString("email");
                        %>
                        <tr>
                            <td><%= studentId %></td>
                            <td><%= username %></td>
                            <td><%= email %></td>
                            <td>
                                <a href="viewStudentDetails.jsp?studentId=<%= studentId %>" class="btn btn-info">View Details</a>
                                <a href="editStudent.jsp?studentId=<%= studentId %>" class="btn btn-warning">Edit</a>
                                <a href="deleteStudentAction.jsp?studentId=<%= studentId %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                            </td>
                        </tr>
                        <%
                                }
                                resultSet.close();
                                statement.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (resultSet != null) resultSet.close();
                                    if (statement != null) statement.close();
                                    if (connection != null) connection.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>
