<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Registration</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
body {
	background: linear-gradient(to right, #74ebd5, #9face6);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.container {
	background: white;
	border-radius: 16px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
	padding: 40px 30px;
	width: 100%;
	max-width: 600px;
}

h2 {
	text-align: center;
	color: #4a3f8c;
	font-weight: bold;
	margin-bottom: 30px;
}

.form-control {
	margin-bottom: 15px;
	border-radius: 8px;
	border: 1px solid #ccc;
	transition: 0.3s ease-in-out;
}

.form-control:focus {
	border-color: #6a5acd;
	box-shadow: 0 0 5px rgba(106, 90, 205, 0.5);
}

.btn-primary {
	width: 100%;
	font-size: 18px;
	background: linear-gradient(to right, #6a5acd, #8a2be2);
	border: none;
	border-radius: 30px;
	padding: 10px;
	font-weight: bold;
	transition: 0.3s ease-in-out;
}

.btn-primary:hover {
	background: linear-gradient(to right, #5d50c6, #7b1fa2);
}

.form-group p {
	font-size: 13px;
	color: red;
	margin-top: 5px;
}

.sign-in-link {
	text-align: center;
	margin-top: 20px;
	font-size: 14px;
}

.sign-in-link a {
	color: #6a5acd;
	text-decoration: none;
	font-weight: bold;
}

.sign-in-link a:hover {
	text-decoration: underline;
}

@media (max-width: 767px) {
	.container {
		padding: 25px 20px;
	}
	h2 {
		font-size: 22px;
	}
	.form-control,
	.btn-primary {
		font-size: 16px;
	}
}
</style>
</head>
<body>

	<div class="container">
		<h2>STUDENT REGISTRATION FORM</h2>
		<form name="register" action="StudentRegister" method="post"
			onsubmit="return validatePassword()">
			
			<div class="form-group">
				<input type="text" placeholder="User Name" class="form-control"
					id="username" onfocus="foc()" onblur="blu()" name="username">
				<p id="label"></p>
			</div>
			
			<div class="form-group">
				<input type="text" placeholder="First Name" class="form-control"
					id="firstname" onfocus="foc()" onblur="blu()" name="firstName">
				<p id="label"></p>
			</div>

			<div class="form-group">
				<input type="text" placeholder="Last Name" class="form-control"
					id="lastname" onfocus="foc()" onblur="blu()" name="lastName">
				<p id="label1"></p>
			</div>

			<div class="form-group">
				<input type="email" placeholder="Email" class="form-control"
					id="mail" name="email">
			</div>
			
			<div class="form-group">
				<input type="text" placeholder="Mobile Number" class="form-control"
					id="number" maxlength="10" name="phonenumber">
			</div>

			<div class="form-group">
				<input type="password" placeholder="Password" class="form-control"
					id="password" maxlength="20" name="password">
			</div>

			<div class="form-group">
				<input type="password" placeholder="Confirm Password"
					class="form-control" id="confirmPassword" name="confirmPassword">
				<p id="passwordError"></p>
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>

			<div class="sign-in-link">
				<p>
					Already have an account? <a href="./index1.jsp">Log in here</a>
				</p>
			</div>
		</form>
	</div>

	<script>
		document.getElementById("firstname").addEventListener("keypress", blurr);
		document.getElementById("lastname").addEventListener("keypress", blurr);
		document.getElementById("number").addEventListener("keypress", num);

		function foc() {
			document.getElementById("label").innerHTML = "";
			document.getElementById("label").style.color = "black";
		}

		function blu() {
			let a = document.getElementById("firstname").value;
			if (a === "") {
				document.getElementById("label").innerHTML = "First name is mandatory";
				document.getElementById("label").style.color = "red";
			} else {
				document.getElementById("label").innerHTML = "";
			}
		}

		function num(event) {
			let a = event.which;
			if (!(a >= 48 && a <= 57)) {
				event.preventDefault();
			}
		}

		function blurr(event) {
			let a = event.which;
			if (!((a >= 65 && a <= 90) || (a >= 97 && a <= 122) || a === 32)) {
				event.preventDefault();
			}
		}

		function validatePassword() {
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirmPassword").value;

			if (password !== confirmPassword) {
				document.getElementById("passwordError").innerHTML = "Passwords do not match!";
				return false;
			}
			document.getElementById("passwordError").innerHTML = "";
			return true;
		}
	</script>

</body>
</html>
