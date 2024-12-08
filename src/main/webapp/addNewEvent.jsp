<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add New Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ece9e6, #ffffff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        .container {
            margin-top: 50px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        h2 {
            color: #007bff;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
            color: #007bff;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #d1d1d1;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .form-select {
            border-radius: 8px;
            border: 1px solid #d1d1d1;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-select:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .alert {
            border-radius: 8px;
            margin-top: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <div class="container">
        <h2 class="text-center mb-4">Add New Event</h2>
        <form method="post">
            <div class="mb-3">
                <label for="eventType" class="form-label">Event Type</label>
                <select class="form-select" id="eventType" name="eventType" required>
                    <option value="">Select an event type</option>
                    <option value="Sports">Sports</option>
                    <option value="Cultural">Cultural</option>
                    <option value="NCC">NCC</option>
                    <option value="Seminar">Seminar</option>
                    <option value="Workshop">Workshop</option>
                    <option value="Conference">Conference</option>
                    <option value="Webinar">Webinar</option>
                    <option value="Community Service">Community Service</option>
                    <option value="Music">Music</option>
                    <option value="Dance">Dance</option>
                    <option value="Art">Art</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="startDate" class="form-label">Start Date</label>
                <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>
            <div class="mb-3">
                <label for="endDate" class="form-label">End Date</label>
                <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Event</button>
        </form>

        <% 
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String eventType = request.getParameter("eventType");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");

                String jdbcURL = "jdbc:mysql://localhost:3306/ExtracurricularAchievementsDB";
                String dbUser = "root";
                String dbPassword = "Vardhan@99";
                Connection connection = null;
                PreparedStatement statement = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                    String sql = "INSERT INTO events (event_type, from_date, to_date) VALUES (?, ?, ?)";
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, eventType);
                    statement.setDate(2, Date.valueOf(startDate));
                    statement.setDate(3, Date.valueOf(endDate));

                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        out.println("<div class='alert alert-success mt-3'>Event added successfully!</div>");
                    } else {
                        out.println("<div class='alert alert-danger mt-3'>Error adding event.</div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<div class='alert alert-danger mt-3'>An error occurred: " + e.getMessage() + "</div>");
                } finally {
                    try {
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
</body>

</html>
