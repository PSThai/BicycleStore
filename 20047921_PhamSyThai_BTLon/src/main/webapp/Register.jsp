<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <style>
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
        .login-container h2 {
           margin-left: 185px;
        }
        .login-container label {
            display: block;
            margin: 5px 12px;
            font-weight: bold;
        }
        .login-container input[type="text"],
        .login-container input[type="password"],
         .login-container input[type="email"]{
            width: 90%;
            padding: 10px;
            margin: 2px 10px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
     
        .login-container button {
            width: 90%;
            margin-left:20px;
            padding: 10px;
            background-color:#142FF7;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
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
        }
        .login-container a:hover {
            text-decoration: underline;
        }
         .error {
            color: red;
           	margin-left:12px;
            font-size: 15px;
            display: none;
        }
    </style>
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
    <div class="login-container">
        <h2>Đăng Ký</h2>
        <form id="registerForm" action="RegisterServlet" method="post">
        
        	<label for="fName">Họ</label>
            <input type="text" id="fName" name="fName" required>
            
            <label for="lName">Tên</label>
            <input type="text" id="lName" name="lName" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
             <span class="error" id="emailError">Email phải đúng định dạng</span>
             
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required>
            
        
            <button type="submit">Đăng Ký</button>
            
            <a href="Login.jsp">Bạn đã có tài khoản? Đăng Nhập </a>
            
             <a href="index.jsp" style="text-align: left;color: blue;"><i class='fa fa-arrow-left'></i> Trang chủ</a>
        </form>
    </div>
    
    <script>
        document.getElementById('registerForm').addEventListener('submit', function(event) {
            let valid = true;
            
            const emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
            
            const email = document.getElementById('email');
            const password = document.getElementById('password');
            const emailError = document.getElementById('emailError');
            const passwordError = document.getElementById('passwordError');

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
    </script>
</body>
</html>
