<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

	%>
	<form action="DeleteServlet" method="post" style="display: inline;">
		<%--     <input type="hidden" name="studentid" value="<%=s.getStudentid()%>">
 --%>
		<button type="submit" class="btn btn-delete btn-sm"
			onclick="return confirm('Are you sure you want to delete this record?');">Delete</button>
	</form>

</body>
</html>