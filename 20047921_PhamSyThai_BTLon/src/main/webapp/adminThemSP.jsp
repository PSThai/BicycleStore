<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="views/adminTemplate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Sản Phẩm</title>
<style>

.content {
	margin-left: 250px;
	padding: 20px;
	width: 100%;
}

form {
	margin-top: 20px;
}

input, select {
	display: block;
	margin-bottom: 10px;
	padding: 10px;
	width: 100%;
	box-sizing: border-box;
}

button {
	padding: 10px 20px;
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
		<h1>Thêm Sản Phẩm</h1>
		<form action="AdminProductServlet" method="post" onsubmit="return validateForm()" >
			<label for="maSP">Mã sản phẩm:</label> <input type="text" id="maSP"
				name="maSP" required pattern="SP\d{3}"
				title="Mã sản phẩm phải có định dạng 'SP' theo sau là 3 chữ số">

			<label for="tenSP">Tên sản phẩm:</label> <input type="text"
				id="tenSP" name="tenSP" required> <label for="imgURL">URL
				hình ảnh:</label> <input type="file" id="imgURL" name="imgURL" required>

			<label for="soLuong">Số lượng:</label> <input type="number"
				id="soLuong" name="soLuong" required> <label for="gia">Giá:</label>
			<input type="number" id="gia" name="gia" step="0.01" required>

			<label for="thuongHieu">Thương hiệu:</label> <input type="text"
				id="thuongHieu" name="thuongHieu" required> <label
				for="thongSo">Thông số:</label> <input type="text" id="thongSo"
				name="thongSo" required> <label for="tenLoai">Loại
				sản phẩm:</label> <select id="tenLoai" name="tenLoai" required>
				<c:forEach var="categories" items="${categories}">
					<option value="${categories.tenLoai}">${categories.tenLoai}</option>
				</c:forEach>
			</select> <input type="hidden" name="action" value="add">
			<button type="submit">Thêm sản phẩm</button>
		</form>
	</div>

	<script>
		function validateForm() {
			const maSPInput = document.getElementById("maSP");
			const maSP = maSPInput.value;
			const pattern = /^SP\d{3}$/;

			if (!pattern.test(maSP)) {
				alert("Mã sản phẩm phải có định dạng 'SP' theo sau là 3 chữ số.");
				return false; // Ngăn form không được submit
			}
			return true; // Cho phép form được submit
		}
	</script>
</body>
</html>