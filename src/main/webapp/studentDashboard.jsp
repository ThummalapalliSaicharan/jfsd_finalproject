<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Extract username from session or request
    String username = request.getParameter("username");
    String email = "";

    // Database credentials
    String jdbcURL = "jdbc:mysql://localhost:3306/ExtracurricularAchievementsDB";
    String dbUser = "root";
    String dbPassword = "Vardhan@99";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Query to fetch email based on username
        String sql = "SELECT email FROM student_profiles WHERE username = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            height: 100vh;
            overflow: hidden;
        }

        .sidebar {
            background-color: #333;
            color: white;
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
            padding-left: 20px;
            overflow-y: auto;
            box-shadow: 4px 0 8px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #3498db;
        }

        .sidebar .logout-btn {
            margin-top: auto;
            background-color: #e74c3c;
            color: white;
            font-weight: bold;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 80%;
            text-align: center;
        }

        .sidebar .logout-btn:hover {
            background-color: #c0392b;
        }

        .content {
            margin-left: 260px;
            padding: 20px;
            height: 100vh;
            overflow-y: auto;
        }

        .profile-card {
            background-color: #fff;
            padding: 20px;
            margin: 20px 0;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .module-card {
            background-color: #fff;
            padding: 20px;
            margin: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .module-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .module-card i {
            font-size: 3rem;
            margin-bottom: 15px;
        }

        .module-card h4 {
            margin-top: 10px;
        }

        .btn-custom {
            width: 80%;
            padding: 10px;
            border-radius: 5px;
            background-color: #3498db;
            color: white;
            border: none;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }

        .btn-custom:hover {
            background-color: #2980b9;
        }

        .notification {
            background-color: #e74c3c;
            color: white;
            font-size: 0.9rem;
            padding: 5px 10px;
            border-radius: 5px;
            position: absolute;
            top: 20px;
            right: 20px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .content {
                margin-left: 210px;
            }

            .module-card i {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Student Dashboard</h2>
        
        <a href="submitAchievement.jsp?username=<%= username %>">Submit Achievement</a>
        <a href="viewAchievements.jsp?username=<%= username %>">View Achievements</a>
        <a href="submitEvent.jsp?username=<%= username %>">Submit Event</a>
        <a href="viewEvents.jsp?username=<%= username %>">View Events</a>
        <a href="submitAssignment.jsp?username=<%= username %>">Submit Assignment</a>
        <a href="viewAssignments.jsp?username=<%= username %>">View Assignments</a>
        <a href="submitFeedback.jsp?username=<%= username %>">Submit Feedback</a>
        <a href="viewFeedback.jsp?username=<%= username %>">View Feedback</a>
        <a href="viewAllSubmissions.jsp?username=<%= username %>">View All Submissions</a>
        <a href="submitCertification.jsp?username=<%= username %>">Submit Certification</a>
        <a href="viewCertifications.jsp?username=<%= username %>">View Certifications</a>
        <a href="submitArticle.jsp?username=<%= username %>">Submit Article</a>
        <a href="newEvent.jsp?username=<%= username %>">Add New Event</a> <!-- New button added -->
        
        <form action="logout.jsp" method="POST">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <div class="content">
        <div class="profile-card">
            <h3>Your Profile</h3>
            <p>Email: <%= email %></p>
        </div>

        <div class="row">
            <div class="col-sm-6 col-md-4">
                <div class="module-card">
                    <i class="fas fa-trophy"></i>
                    <h4>Submit Achievement</h4>
                    <a href="submitAchievement.jsp?username=<%= username %>" class="btn-custom">Go</a>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="module-card">
                    <i class="fas fa-calendar-alt"></i>
                    <h4>Submit Event</h4>
                    <a href="submitEvent.jsp?username=<%= username %>" class="btn-custom">Go</a>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="module-card">
                    <i class="fas fa-book"></i>
                    <h4>Submit Assignment</h4>
                    <a href="submitAssignment.jsp?username=<%= username %>" class="btn-custom">Go</a>
                </div>
            </div>
            <!-- Add a new event button to the content area -->
            <div class="col-sm-6 col-md-4">
                <div class="module-card">
                    <i class="fas fa-calendar-plus"></i>
                    <h4> New Events</h4>
                    <a href="newEvent.jsp?username=<%= username %>" class="btn-custom">Go</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
