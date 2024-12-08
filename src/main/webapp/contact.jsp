<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Extracurricular Achievements Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://camudigitalcampus.com/wp-content/uploads/2021/04/College-Management-System.png') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            width: 100vw;
            color: #fff;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.7);
        }
        .navbar-brand {
            font-weight: bold;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly opaque for better contrast */
            padding: 30px;
            border-radius: 10px;
            margin-top: 50px;
        }
        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-primary {
            background-color: #007BFF;
            border: none;
            padding: 10px 20px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #ADD8E6;">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Extracurricular Achievements Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="studentLogin.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogin.jsp">Admin Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup.jsp">Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container text-dark">
        <h1 class="text-center">Contact Us</h1>
        <p class="text-center">Have any questions or feedback? We'd love to hear from you!</p>
        <form action="submitContact.jsp" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Your Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="message" class="form-label">Message</label>
                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    