<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Successful</title>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right, #f0f8ff, #e6f2ff);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    font-family: 'Segoe UI', sans-serif;
}
.success-card {
    background-color: white;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
    text-align: center;
}
.success-card h1 {
    color: #198754;
    margin-bottom: 20px;
} 
.success-card p {
    font-size: 18px;
    color: #555;
}
.btn-back {
    margin-top: 20px;
}
</style>
</head>
<body>

<div class="success-card">
    <h1>✅ Update Successful!</h1>
    <p>The student record has been updated successfully.</p>
    <form action="StudentManagementSystemController_2" method="post">
    <button type="submit" class="btn btn-success btn-back">🔙 Go Back to Student List</button>
    </form>
</div>

</body>
</html>
