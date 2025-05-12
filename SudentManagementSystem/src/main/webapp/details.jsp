<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.StudentManagementSystemDTO.StudentManagementSystemDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>
<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<style>
body {
	background:linear-gradient(to right, #74ebd5, #9face6);
	font-family: 'Segoe UI', sans-serif;
}

.container {
	margin-top: 50px;
}

.table-container {
	background-color: white;
	border-radius: 15px;
	padding: 30px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #0d6efd;
	font-weight: bold;
}

.btn-update {
	background-color: #ffc107;
	color: black;
}

.btn-update:hover {
	background-color: #e0a800;
	color: white;
}

.btn-delete {
	background-color: #dc3545;
}

.btn-delete:hover {
	background-color: #bd2130;
}

.logout-btn {
	position: absolute;
	top: 20px;
	right: 50px;
}
.margin{
	margin-right:50px;
}
</style>
</head>
<body>
	<!-- <!-- search button -->
	
 
	<!-- Logout Button -->
	<div class="logout-btn">
		<form action="LogoutServlet" method="post">
			<button type="submit" class="btn btn-outline-danger btn-sm">
			<i class="bi bi-box-arrow-right"></i>Logout</button>
		</form>
	</div>
	<br><br><br>
	 <div class="margin">
		<form action="SearchServlet" method="get"
			class="d-flex justify-content-end mb-3">
			<input type="text" name="query" class="form-control w-25 me-2"
				placeholder="Search by Name, ID, Email..." required>
			<button type="submit" class="btn btn-primary btn-sm">
			<i class="bi bi-search"></i>Search</button>
		</form>

	</div> 

	<div class="container">
		<div class="table-container">
			<h2 class="text-center mb-4">Student Details</h2>

			<table
				class="table table-bordered table-hover align-middle text-center">
				<thead class="table-primary">
					<tr>
						<th>Student Id</th>
						<th>User Name</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Phone Number</th>
<!-- 						<th>Password</th>
 -->						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<StudentManagementSystemDTO> students = (List<StudentManagementSystemDTO>) request.getAttribute("students");
					if (students != null) {
						for (StudentManagementSystemDTO s : students) {
					%>
					<tr>
						<td><%=s.getStudentid()%></td>
						<td><%=s.getUserName()%></td>
						<td><%=s.getFirstName()%></td>
						<td><%=s.getLastName()%></td>
						<td><%=s.getEmail()%></td>
						<td><%=s.getPhoneNumber()%></td>
<%-- 						<td><%=s.getPassword()%></td>
 --%>						<td><a
							href="Update.jsp?studentid=<%=s.getStudentid()%>&username=<%=s.getUserName()%>&firstname=<%=s.getFirstName()%>&lastname=<%=s.getLastName()%>&email=<%=s.getEmail()%>&phonenumber=<%=s.getPhoneNumber()%>&password=<%=s.getPassword()%>"
							class="btn btn-warning btn-sm me-1">
							<i class="bi bi-pencil-fill"></i>Update</a>
							
							<form action="DeleteServlet" method="post"
								style="display: inline;"
								onsubmit="return confirm('Are you sure you want to delete this record?');">
								<input type="hidden" name="studentid"
									value="<%=s.getStudentid()%>">
								<button type="submit" class="btn btn-delete btn-sm">
								<i class="bi bi-trash-fill"></i>Delete</button>
							</form></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="8" class="text-center">No data found.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
