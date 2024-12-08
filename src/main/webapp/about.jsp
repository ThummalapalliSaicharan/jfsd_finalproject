<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About - Extracurricular Achievements Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(rgba(0, 123, 255, 0.7), rgba(0, 123, 255, 0.7)), 
                        url('https://camudigitalcampus.com/wp-content/uploads/2021/04/College-Management-System.png') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .about-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            max-width: 900px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        .about-container h1 {
            font-size: 2.5em;
            color: #007BFF;
            margin-bottom: 20px;
        }
        .about-container p {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .features-list, .benefits-list {
            text-align: left;
            margin-top: 20px;
            color: #333;
        }
        .features-list li, .benefits-list li {
            margin-bottom: 10px;
            line-height: 1.5;
        }
        .btn-primary {
            background-color: #007BFF;
            border-color: #007BFF;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="about-container">
        <h1>About the Extracurricular Achievements Portal</h1>
        <p>The Extracurricular Achievements Portal is a dedicated platform designed to help students and administrators manage and showcase extracurricular accomplishments effectively. This portal encourages students to keep a record of their non-academic achievements, providing a digital portfolio that highlights their talents, skills, and interests outside the classroom.</p>
        
        <h2>Key Features</h2>
        <ul class="features-list">
            <li><strong>Student Profiles:</strong> Each student has a personal profile to view, update, and showcase their extracurricular activities.</li>
            <li><strong>Achievements Submission:</strong> Students can submit details of their awards, certifications, and participation in various events.</li>
            <li><strong>Admin Dashboard:</strong> Administrators have access to manage student submissions, update records, and generate reports.</li>
            <li><strong>Public Visibility:</strong> Achievements, certifications, and articles submitted are visible to all students, fostering a collaborative and inspiring environment.</li>
            <li><strong>Data Security:</strong> Access-controlled environment to ensure data privacy and integrity.</li>
        </ul>

        <h2>Benefits</h2>
        <ul class="benefits-list">
            <li><strong>Comprehensive Portfolio:</strong> Enables students to document and share their extracurricular achievements, supporting their applications for universities or jobs.</li>
            <li><strong>Enhanced Student Engagement:</strong> Encourages students to participate more actively in extracurricular activities by providing them with a platform to showcase their skills.</li>
            <li><strong>Streamlined Management:</strong> Administrators can easily manage and verify achievements, keeping records organized and up-to-date.</li>
            <li><strong>Networking Opportunities:</strong> Students can explore peers' achievements, fostering inspiration and collaboration.</li>
        </ul>

        <p>Our goal is to provide students and administrators with a smooth, efficient way to manage and celebrate accomplishments beyond academics. By centralizing these achievements, we aim to recognize and value the diverse talents and hard work of each student.</p>

        <a href="index.jsp" class="btn btn-primary">Go Back to Home</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
