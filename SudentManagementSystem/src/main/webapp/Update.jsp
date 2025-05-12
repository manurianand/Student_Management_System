<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
        }
        .card {
            border-radius: 1rem;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow p-4">
                <h2 class="text-center mb-4">Update Student Details</h2>
                <form action="UpdateServlet" method="post">
                 <div class="mb-3">
                        <label class="form-label">Student id</label>
                        <input type="text" name="studentid" class="form-control" value="<%= request.getParameter("studentid") %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">User Name</label>
                        <input type="text" name="username" class="form-control" value="<%= request.getParameter("username") %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">First Name</label>
                        <input type="text" name="firstname" class="form-control" value="<%= request.getParameter("firstname") %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="lastname" class="form-control" value="<%= request.getParameter("lastname") %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email (cannot change)</label>
                        <input type="email" name="email" class="form-control" value="<%= request.getParameter("email") %>" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="text" name="phonenumber" class="form-control" value="<%= request.getParameter("phonenumber") %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="text" name="password" class="form-control" value="<%= request.getParameter("password") %>" required>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">Update Student</button>
                    </div>
                </form>
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
