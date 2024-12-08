<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Event Registrations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #c3cfe2, #c6e2ff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }

        .container {
            margin-top: 30px;
        }

        .form-container, .table-container {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
        }

        .table-container {
            background: linear-gradient(135deg, #ffffff, #f0f8ff);
            border: none;
        }

        h3 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #1abc9c;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #d9d9d9;
        }

        .alert {
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .alert-success {
            background-color: #28a745;
            color: white;
            border: 1px solid #218838;
        }

        .alert-danger {
            background-color: #dc3545;
            color: white;
            border: 1px solid #c82333;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
</head>

<body>
    <!-- Display event registrations -->
    <div class="table-container">
        <h3 class="text-center mb-4">Event Registrations</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Registration ID</th>
                    <th>College ID</th>
                    <th>Name</th>
                    <th>Branch</th>
                    <th>Event Type</th>
                    <th>Registration Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Database connection details
                    String jdbcURL = "jdbc:mysql://localhost:3306/extracurricularachievementsdb";
                    String dbUser = "root";
                    String dbPassword = "Vardhan@99";
                    Connection connection = null;
                    PreparedStatement preparedStatement = null;
                    ResultSet resultSet = null;

                    // Handle form submission to register for an event
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String collegeId = request.getParameter("collegeId");
                        String name = request.getParameter("name");
                        String branch = request.getParameter("branch");
                        String eventType = request.getParameter("eventType");

                        try {
                            // Connect to the database
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                            // Insert registration data
                            String insertQuery = "INSERT INTO event_registrations (college_id, name, branch, event_type) VALUES (?, ?, ?, ?)";
                            preparedStatement = connection.prepareStatement(insertQuery);
                            preparedStatement.setString(1, collegeId);
                            preparedStatement.setString(2, name);
                            preparedStatement.setString(3, branch);
                            preparedStatement.setString(4, eventType);

                            int rowsInserted = preparedStatement.executeUpdate();
                            if (rowsInserted > 0) {
                                out.println("<div class='alert alert-success' role='alert'>Registration successful!</div>");
                            } else {
                                out.println("<div class='alert alert-danger' role='alert'>Registration failed. Please try again.</div>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<div class='alert alert-danger' role='alert'>An error occurred: " + e.getMessage() + "</div>");
                        } finally {
                            // Close resources
                            try {
                                if (preparedStatement != null) preparedStatement.close();
                                if (connection != null) connection.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }

                    // Fetch and display existing event registrations
                    try {
                        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                        String eventQuery = "SELECT registration_id, college_id, name, branch, event_type, registration_date FROM event_registrations";
                        preparedStatement = connection.prepareStatement(eventQuery);
                        resultSet = preparedStatement.executeQuery();

                        while (resultSet.next()) {
                            int registrationId = resultSet.getInt("registration_id");
                            String collegeId = resultSet.getString("college_id");
                            String name = resultSet.getString("name");
                            String branch = resultSet.getString("branch");
                            String eventType = resultSet.getString("event_type");
                            Date registrationDate = resultSet.getDate("registration_date");
                %>
                <tr>
                    <td><%= registrationId %></td>
                    <td><%= collegeId %></td>
                    <td><%= name %></td>
                    <td><%= branch %></td>
                    <td><%= eventType %></td>
                    <td><%= registrationDate %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<div class='alert alert-danger' role='alert'>An error occurred while fetching event registrations: " + e.getMessage() + "</div>");
                    } finally {
                        // Close resources
                        try {
                            if (resultSet != null) resultSet.close();
                            if (preparedStatement != null) preparedStatement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>

</html>
