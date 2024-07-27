<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 80%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
}

.modal-content {
	background-color: #fefefe;
	margin: 2% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 25%;
	color: green;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.login-container {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 500px;
}

.login-container h1 {
	margin-left: 180px;
}

.login-container label {
	display: block;
	margin: 5px 12px;
	font-weight: bold;
}

.login-container input[type="email"], .login-container input[type="password"]
	{
	width: 90%;
	padding: 10px;
	margin: 2px 10px 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.login-container input[type="checkbox"] {
	margin-right: 5px;
	margin: 20px 12px;
}

.login-container button {
	width: 90%;
	margin-left: 20px;
	padding: 10px;
	background-color: #142FF7;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.login-container button:hover {
	background-color: #06038E;
}

.login-container a {
	display: block;
	text-align: center;
	margin-top: 10px;
	color: #333;
	text-decoration: none;
	margin: 12px 0;
}

.login-container a:hover {
	text-decoration: underline;
}

.error {
	color: red;
	margin-left: 12px;
	font-size: 15px;
	display: none;
}
</style>
</head>
<body>

	<div class="login-container">
		<h1>Đăng Nhập</h1>
		<form id="loginForm" action="LoginServlet" method="post">
			<label for="email">Email:</label> <input type="email" id="email"
				name="email" required> <span class="error" id="emailError">Email
				phải đúng định dạng</span> <label for="password">Mật khẩu:</label> <input
				type="password" id="password" name="password" required>


			<c:if test="${not empty error}">
				<div style="color: red; margin-left:10px ">${error}</div>
			</c:if>
			
			<c:if test="${not empty sessionScope.message}">
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span class="close">&times;</span>
						<p>${sessionScope.message}</p>
					</div>
				</div>
				<c:remove var="message" scope="session" />
			</c:if>
			
			<input type="checkbox" name="remember"> Ghi nhớ đăng nhập

			<button type="submit">Đăng Nhập</button>

			<a href="/forgot-password">Quên mật khẩu?</a> 
			<a href="Register.jsp">Bạn
				chưa có tài khoản? Đăng ký ngay</a> 
			<a href="index.jsp"
				style="text-align: left; color: blue;"><i
				class='fa fa-arrow-left'></i> Trang chủ</a>
		</form>
	</div>

	<script>
		document.getElementById('loginForm').addEventListener(
				'submit',
				function(event) {
					let valid = true;

					const emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

					const email = document.getElementById('email');
					const password = document.getElementById('password');
					const emailError = document.getElementById('emailError');
					const passwordError = document
							.getElementById('passwordError');

					if (!emailPattern.test(email.value.trim())) {
						emailError.style.display = 'block';
						valid = false;
					} else {
						emailError.style.display = 'none';
					}

					if (!valid) {
						event.preventDefault();
					}
				});
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
		// Tự động đóng modal sau 2-3 giây
		setTimeout(function() {
			modal.style.display = "none";
		}, 1300); // 2000 milliseconds = 2 seconds

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

		// Show the modal if it exists
		if (modal) {
			modal.style.display = "block";
		}
	</script>

</body>
</html>