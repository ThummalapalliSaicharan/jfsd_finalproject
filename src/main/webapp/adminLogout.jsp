<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidating the session to log out the admin
    session.invalidate();
    
    // Redirecting to the login page
    response.sendRedirect("index.jsp");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Logout</title>
</head>
<body>
    <div class="container mt-5">
        <h2>You have been logged out successfully.</h2>
        <a href="index.jsp">Click here to login again.</a>
    </div>
</body>
</html>
