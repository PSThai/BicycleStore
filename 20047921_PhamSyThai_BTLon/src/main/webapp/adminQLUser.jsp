<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="views/adminTemplate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý người dùng</title>
<style>
.content {
	margin-left: 250px;
	padding: 20px;
	width: 100%;
}
h1 {
	text-align: center;
    color: #333;
}
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 12px;
	text-align: left;
}

th {
	background-color: #007BFF;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

button {
	padding: 5px 10px;
	background-color: #333;
	color: white;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #575757;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	function toggleSubmenu(id) {
		var element = document.getElementById(id);
		if (element.style.display === "block") {
			element.style.display = "none";
		} else {
			element.style.display = "block";
		}
	}
</script>
</head>
<body>

	<div class="content">
		<h1>Quản Lý người dùng</h1>
		<table>
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Role</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr>
						<td>${user.fName}</td>
						<td>${user.lName}</td>
						<td>${user.email}</td>
						<td>${user.role}</td>
						<td>
							<form action="AdminUserServlet" method="post"
								style="display: inline;">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="email" value="${user.email}">
								<button type="submit">Xóa</button>
							</form>
							<button
								onclick="editUser('${user.email}', '${user.fName}', '${user.lName}', '${user.password}', '${user.role}')">Sửa</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="editForm" style="display: none;">
			<h2>Sửa thông tin người dùng</h2>
			<form action="AdminUserServlet" method="post">
				<input type="hidden" id="editEmail" name="email"> <label
					for="editFName">First Name:</label> <input type="text"
					id="editFName" name="fName" required> <label
					for="editLName">Last Name:</label> <input type="text"
					id="editLName" name="lName" required> <label
					for="editPassword">Password:</label> <input type="password"
					id="editPassword" name="password" required> <label
					for="editRole">Role:</label> <input type="text" id="editRole"
					name="role" required> <input type="hidden" name="action"
					value="update">
				<button type="submit">Cập nhật</button>
				<button type="button" onclick="closeEditForm()">Hủy</button>
			</form>
		</div>
	</div>
	<script>
		function editUser(email, fName, lName, password, role) {
			document.getElementById('editEmail').value = email;
			document.getElementById('editFName').value = fName;
			document.getElementById('editLName').value = lName;
			document.getElementById('editPassword').value = password;
			document.getElementById('editRole').value = role;
			document.getElementById('editForm').style.display = 'block';
		}

		function closeEditForm() {
			document.getElementById('editForm').style.display = 'none';
		}
	</script>
</body>
</html>