<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Extracurricular Achievements Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom CSS for Admin Login page */
        body {
            background-color: #f0f8ff; /* Light blue background */
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 500px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h2 {
            color: #0056b3;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .form-label {
            color: #333333;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #0056b3;
            border-color: #0056b3;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #003d80;
            border-color: #003d80;
        }

        .alert {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Admin Login</h2>

        <!-- Display error message if exists -->
        <%
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) {
                out.println("<div class='alert alert-danger text-center'>" + errorMessage + "</div>");
                session.removeAttribute("errorMessage"); // Clear the message after displaying
            }
        %>

        <form action="adminLoginAction.jsp" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>
    </div>
</body>
</html>
