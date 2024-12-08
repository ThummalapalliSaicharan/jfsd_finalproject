<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Register for an Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 30px;
        }

        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            border-radius: 8px;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="form-container">
            <h3 class="text-center mb-4">Register for an Event</h3>

            <%
                String jdbcURL = "jdbc:mysql://localhost:3306/extracurricularachievementsdb";
                String dbUser = "root";
                String dbPassword = "Vardhan@99";

                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;

                // Processing form data
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String collegeId = request.getParameter("collegeId");
                    String name = request.getParameter("name");
                    String branch = request.getParameter("branch");
                    String eventType = request.getParameter("eventType");

                    try {
                        // Connect to the database
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                        // Insert data into the database
                        String insertQuery = "INSERT INTO event_registrations (college_id, name, branch, event_type) VALUES (?, ?, ?, ?)";
                        preparedStatement = connection.prepareStatement(insertQuery);
                        preparedStatement.setString(1, collegeId);
                        preparedStatement.setString(2, name);
                        preparedStatement.setString(3, branch);
                        preparedStatement.setString(4, eventType);

                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            out.println("<div class='alert alert-success' role='alert'>Registration successful!</div>");
                        } else {
                            out.println("<div class='alert alert-danger' role='alert'>Registration failed. Please try again.</div>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<div class='alert alert-danger' role='alert'>An error occurred: " + e.getMessage() + "</div>");
                    } finally {
                        try {
                            if (preparedStatement != null) preparedStatement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }

                // Fetch event type if eventId is provided
                String eventId = request.getParameter("eventId");
                String eventType = "";

                if (eventId != null && !eventId.isEmpty()) {
                    try {
                        // Connect to the database
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                        // Fetch the event details based on eventId
                        String query = "SELECT event_type FROM events WHERE event_id = ?";
                        preparedStatement = connection.prepareStatement(query);
                        preparedStatement.setInt(1, Integer.parseInt(eventId));
                        resultSet = preparedStatement.executeQuery();

                        if (resultSet.next()) {
                            eventType = resultSet.getString("event_type");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (resultSet != null) resultSet.close();
                            if (preparedStatement != null) preparedStatement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>

            <form method="post">
                <div class="mb-3">
                    <label for="collegeId" class="form-label">College ID</label>
                    <input type="text" class="form-control" id="collegeId" name="collegeId" required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="branch" class="form-label">Branch</label>
                    <select class="form-select" id="branch" name="branch" required>
                        <option value="">Select your branch</option>
                        <option value="CSE">Computer Science and Engineering (CSE)</option>
                        <option value="IT">Information Technology (IT)</option>
                        <option value="ECE">Electronics and Communication Engineering (ECE)</option>
                        <option value="EEE">Electrical and Electronics Engineering (EEE)</option>
                        <option value="Mechanical">Mechanical Engineering</option>
                        <option value="Civil">Civil Engineering</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="eventType" class="form-label">Select Event Type</label>
                    <select class="form-select" id="eventType" name="eventType" required>
                        <option value="">Select an event type</option>
                        <option value="Sports" <%= eventType.equals("Sports") ? "selected" : "" %>>Sports</option>
                        <option value="Cultural" <%= eventType.equals("Cultural") ? "selected" : "" %>>Cultural</option>
                        <option value="NCC" <%= eventType.equals("NCC") ? "selected" : "" %>>NCC</option>
                        <option value="Seminar" <%= eventType.equals("Seminar") ? "selected" : "" %>>Seminar</option>
                        <option value="Workshop" <%= eventType.equals("Workshop") ? "selected" : "" %>>Workshop</option>
                        <option value="Conference" <%= eventType.equals("Conference") ? "selected" : "" %>>Conference</option>
                        <option value="Webinar" <%= eventType.equals("Webinar") ? "selected" : "" %>>Webinar</option>
                        <option value="Community Service" <%= eventType.equals("Community Service") ? "selected" : "" %>>Community Service</option>
                        <option value="Music" <%= eventType.equals("Music") ? "selected" : "" %>>Music</option>
                        <option value="Dance" <%= eventType.equals("Dance") ? "selected" : "" %>>Dance</option>
                        <option value="Art" <%= eventType.equals("Art") ? "selected" : "" %>>Art</option>
                    </select>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-submit">Submit</button>
                </div>
            </form>
        </div>
    </div>
</body>

</html>
