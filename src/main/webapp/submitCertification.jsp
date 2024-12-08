<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Certification</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Submit Certification</h2>
        
        <!-- Success and error messages -->
        <div class="alert alert-success" style="<%= request.getParameter("message") == null ? "display:none;" : "" %>">
            <%= request.getParameter("message") %>
        </div>
        <div class="alert alert-danger" style="<%= request.getParameter("error") == null ? "display:none;" : "" %>">
            <%= request.getParameter("error") %>
        </div>
        
        <form action="SubmitCertificationServlet" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="certificationName" class="form-label">Certification Title</label>
                <input type="text" class="form-control" id="certificationName" name="certificationName" required>
            </div>
            <div class="mb-3">
                <label for="fileName" class="form-label">Upload Certification Image</label>
                <input type="file" class="form-control" id="fileName" name="fileName" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>
