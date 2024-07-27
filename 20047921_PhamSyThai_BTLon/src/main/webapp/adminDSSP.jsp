<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="views/adminTemplate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
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
	margin: 20px 0;
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
	background-color: #f9f9f9;
}

.btn {
	margin-top: 3px;
}

.btn:hover {
	background-color: darkred;
}

option {
	background-color: white;
	color: black;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
		<h1>Danh Sách Sản Phẩm</h1>
		<table>
			<thead>
				<tr>
					<th>Mã Sản Phẩm</th>
					<th>Tên Sản Phẩm</th>
					<th>Hình Ảnh</th>
					<th>Số Lượng</th>
					<th>Giá</th>
					<th><select name="thuongHieu"
						style="background-color: #007BFF; border: none; color: white; font-weight: 700;"
						onchange="filterBicycles()">
							<option value="">Thương Hiệu</option>
							<option value="Giant">Giant</option>
							<option value="Liv">Liv</option>
							<option value="Trek">Trek</option>
							<option value="Califonia">Califonia</option>
					</select></th>
					<th>Thông Số</th>
					<th><select name="category"
						style="background-color: #007BFF; border: none; color: white; font-weight: 700;"
						onchange="filterBicycles()">
							<option value="">Loại sản phẩm</option>
							<option value="Xe Đạp Đua">Xe đạp đua</option>
							<option value="Xe Đạp Đường Phố">Xe đạp đường phố</option>
							<option value="Xe Đạp Nữ">Xe đạp nữ</option>
							<option value="Xe Đạp Trẻ em">Xe đạp trẻ em</option>
					</select></th>
					<th>Hành Động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bicycle" items="${bicycles}">
					<tr>
						<td>${bicycle.maSP}</td>
						<td>${bicycle.tenSP}</td>
						<td><img
							src="/20047921_PhamSyThai_BTLon/Img/${bicycle.imgURL}"
							alt="Image" style="width: 100px; height: 70px;"></td>
						<td>${bicycle.soLuong}</td>
						<td>${bicycle.giaString}</td>
						<td>${bicycle.thuongHieu}</td>
						<td>${bicycle.thongSo}</td>
						<td>${bicycle.tenLoai}</td>
						<td>
							<form action="AdminProductServlet" method="post"
								style="display: inline;">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="maSP" value="${bicycle.maSP}">
								<button type="submit" class="btn btn-outline-danger">Xóa</button>
							</form>
							<button class="btn btn-outline-secondary" data-toggle="modal"
								data-target="#editModal"
								onclick="editProduct('${bicycle.maSP}', '${bicycle.tenSP}', '${bicycle.imgURL}', '${bicycle.soLuong}', '${bicycle.gia}', '${bicycle.thuongHieu}', '${bicycle.thongSo}', '${bicycle.tenLoai}')">Sửa</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editModalLabel">Cập nhật sản phẩm</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AdminProductServlet" method="post">

						<div class="form-group">
							<label for="editMaSP">Mã sản phẩm</label> <input type="text"
								class="form-control" id="editMaSP" name="maSP"
								readonly="readonly" required>
						</div>
						<div class="form-group">
							<label for="editTenSP">Tên sản phẩm</label> <input type="text"
								class="form-control" id="editTenSP" name="tenSP" required>
						</div>
						<div class="form-group">
							<label for="editImgURL">Hình ảnh</label> <input type="file"
								class="form-control" id="editImgURL" name="imgURL" required>
						</div>
						<div class="form-group">
							<label for="editSoLuong">Số lượng</label> <input type="number"
								class="form-control" id="editSoLuong" name="soLuong" required>
						</div>
						<div class="form-group">
							<label for="editGia">Giá</label> <input type="number"
								class="form-control" id="editGia" name="gia" required>
						</div>
						<div class="form-group">
							<label for="editThuongHieu">Thương hiệu</label> <input
								type="text" class="form-control" id="editThuongHieu"
								name="thuongHieu" required>
						</div>
						<div class="form-group">
							<label for="editThongSo">Thông số</label> <input type="text"
								class="form-control" id="editThongSo" name="thongSo" required>
						</div>
						<div class="form-group">
							<label for="editTenLoai">Loại sản phẩm</label> <input type="text"
								class="form-control" id="editTenLoai" name="tenLoai" required>
						</div>
						<input type="hidden" name="action" value="update">
						<button type="submit" class="btn btn-primary">Cập nhật</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Hủy</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<script>
    function filterBicycles() {
        const thuongHieu = document.querySelector('select[name="thuongHieu"]').value;
        const category = document.querySelector('select[name="category"]').value;
        const url = new URL(window.location.href);
        if (thuongHieu) {
            url.searchParams.set('thuongHieu', thuongHieu);
        } else {
            url.searchParams.delete('thuongHieu');
        }
        if (category) {
            url.searchParams.set('category', category);
        } else {
            url.searchParams.delete('category');
        }
        window.location.href = url.toString();
    }
</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		function editProduct(maSP, tenSP, imgURL, soLuong, gia, thuongHieu,
				thongSo, tenLoai) {
			document.getElementById('editMaSP').value = maSP;
			document.getElementById('editTenSP').value = tenSP;
			document.getElementById('editSoLuong').value = soLuong;
			document.getElementById('editGia').value = gia;
			document.getElementById('editThuongHieu').value = thuongHieu;
			document.getElementById('editThongSo').value = thongSo;
			document.getElementById('editTenLoai').value = tenLoai;
			// Hiển thị đường dẫn hình ảnh hiện tại nếu cần thiết
			document.getElementById('editImgURLDisplay').textContent = imgURL;
		}
	</script>
</body>
</html>
