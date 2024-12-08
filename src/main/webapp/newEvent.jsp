<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 30px;
        }

        .event-table th, .event-table td {
            text-align: center;
        }

        .btn-register, .btn-nav {
            background-color: #007bff;
            color: white;
            border-radius: 8px;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-register:hover, .btn-nav:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2 class="text-center mb-4">Upcoming Events</h2>

        <!-- Navigation to Register Event Page -->
        

        <% 
            // Database connection variables
            String jdbcURL = "jdbc:mysql://localhost:3306/ExtracurricularAchievementsDB"; 
            String dbUser = "root";
            String dbPassword = "Vardhan@99";

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                // Load database driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                // SQL query to fetch events
                String sql = "SELECT * FROM events ORDER BY from_date ASC";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                // Check if there are events and display them
                if (resultSet != null) {
                    out.println("<table class='table table-bordered event-table'>");
                    out.println("<thead><tr><th>Event ID</th><th>Event Type</th><th>From Date</th><th>To Date</th><th>Created At</th><th>Register</th></tr></thead>");
                    out.println("<tbody>");

                    while (resultSet.next()) {
                        int eventId = resultSet.getInt("event_id");
                        String eventType = resultSet.getString("event_type");
                        Date fromDate = resultSet.getDate("from_date");
                        Date toDate = resultSet.getDate("to_date");
                        Timestamp createdAt = resultSet.getTimestamp("created_at");

                        out.println("<tr>");
                        out.println("<td>" + eventId + "</td>");
                        out.println("<td>" + eventType + "</td>");
                        out.println("<td>" + fromDate + "</td>");
                        out.println("<td>" + toDate + "</td>");
                        out.println("<td>" + createdAt + "</td>");
                        out.println("<td>");
                        out.println("<form action='registerevent.jsp' method='get'>");
                        out.println("<input type='hidden' name='eventId' value='" + eventId + "'>");
                        out.println("<button type='submit' class='btn btn-register'>Register</button>");
                        out.println("</form>");
                        out.println("</td>");
                        out.println("</tr>");
                    }
                    out.println("</tbody>");
                    out.println("</table>");
                } else {
                    out.println("<div class='alert alert-info'>No upcoming events found.</div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='alert alert-danger'>An error occurred while fetching events: " + e.getMessage() + "</div>");
            } finally {
                // Close database resources
                try {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>

</html>
