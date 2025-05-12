<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign In Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
body {
	background: linear-gradient(to right, #74ebd5, #9face6);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.container {
	background-color: white;
	border-radius: 12px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	padding: 40px 30px;
	width: 100%;
	max-width: 500px;
}

h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #343a40;
	font-weight: 600;
}

.form-control {
	margin-bottom: 15px;
	border: 1px solid #ced4da;
	border-radius: 6px;
	box-shadow: none;
	transition: all 0.3s ease-in-out;
}

.form-control:focus {
	border-color: #6c63ff;
	box-shadow: 0 0 5px rgba(108, 99, 255, 0.5);
}

.form-group p {
	color: red;
	font-size: 14px;
	margin-top: 5px;
}

.btn-primary {
	width: 100%;
	font-size: 18px;
	background-color: #6c63ff;
	border: none;
	border-radius: 25px;
	padding: 10px 0;
	transition: background-color 0.3s ease;
}

.btn-primary:hover {
	background-color: #574b90;
}

.sign-in-link {
	text-align: center;
	margin-top: 15px;
	font-size: 14px;
}

.sign-in-link a {
	color: #6c63ff;
	text-decoration: none;
	font-weight: bold;
}

.sign-in-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Sign In to Access Your Account</h2>
		<form name="register" action="loginRegister" method="post">
			<div class="form-group">
				<input type="text" placeholder="Email" class="form-control"
					id="email" onfocus="foc()" onblur="blu()" name="email">
				<p id="label"></p>
			</div>

			<div class="form-group">
				<input type="password" placeholder="Password" class="form-control"
					id="password" onfocus="foc()" onblur="blu()" name="password">
				<p id="label1"></p>
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>

			<div class="sign-in-link">
				<p>
					Create a new account? <a href="./index.jsp">Sign up here</a>
				</p>
			</div>
		</form>
	</div>

	<script>
		document.getElementById("firstname")
				.addEventListener("keypress", blurr);

		function foc() {
			document.getElementById("label").innerHTML = "";
			document.getElementById("label").style.color = "black";
		}

		function blu() {
			let a = document.getElementById("email").value;

			if (a === "") {
				document.getElementById("label").innerHTML = "Email is mandatory";
				document.getElementById("label").style.color = "red";
			} else {
				document.getElementById("label").innerHTML = "";
			}
		}

		function blurr(event) {
			let a = event.which;
			if (!((a >= 65 && a <= 90) || (a >= 97 && a <= 122) || a === 32 || (a >= 48 && a <= 57) || a === 64 || a === 46)) {
				event.preventDefault();
			}
		}
	</script>

</body>
</html>
