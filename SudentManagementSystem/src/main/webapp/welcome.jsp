<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.StudentManagementSystemDTO.StudentManagementSystemDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background:linear-gradient(to right, #74ebd5, #9face6);
            font-family: 'Arial', sans-serif;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            padding: 30px;
        }

        h2 {
            color: #0056b3;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
            font-size: 1.1rem;
        }

        .btn-primary:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .btn-outline-secondary {
            border-color: #ffc107;
            color: #ffc107;
            font-size: 1rem;
        }

        .btn-outline-secondary:hover {
            background-color: #ffc107;
            color: white;
        }

        .card p {
            color: #555;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="card">
            
            
            <% HttpSession ses=request.getSession(false);
            StudentManagementSystemDTO st=(StudentManagementSystemDTO) ses.getAttribute("std");
            
            
            %>
            <h1 style="color:blue ,font:bold">Welcome........!!! <%=st.getFirstName() %></h1>
<h2 class="text-center mb-4">Student Management System</h2>
            <form action="StudentManagementSystemController_2" method="post" class="text-center mb-4">
                <button type="submit" class="btn btn-primary btn-lg w-100">Show All Students</button>
            </form>

            
        </div>
    </div>

</body>
</html>
