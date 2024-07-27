<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="views/adminTemplate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách loại sản phẩm</title>
<style>
   h1 {
	text-align: center;
    color: #333;
}
    .content {
        margin-left: 250px;
        padding: 20px;
        width: 100%;
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
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script>
    function toggleSubmenu(id) {
        var element = document.getElementById(id);
        if (element.style.display === "block") {
            element.style.display = "none";
        } else {
            element.style.display = "block";
        }
    }

    function editCategory(maLoai, tenLoai, ghiChu) {
        document.getElementById('editMaLoai').value = maLoai;
        document.getElementById('editTenLoai').value = tenLoai;
        document.getElementById('editGhiChu').value = ghiChu;
        $('#editModal').modal('show');
    }
</script>
</head>
<body>
   
    <div class="content">
        <h1>Danh Sách Loại Sản Phẩm</h1>
        <table>
            <thead>
                <tr>
                    <th>Mã Loại</th>
                    <th>Tên Loại</th>
                    <th>Ghi Chú</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="listCate" items="${listCate}">
                <tr>
                    <td>${listCate.maLoai}</td>
                    <td>${listCate.tenLoai}</td>
                    <td>${listCate.ghiChu}</td>
                    <td>
                        <form action="AdminCategoryServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="maLoai" value="${listCate.maLoai}">
                            <button type="submit" class="btn btn-outline-danger">Xóa</button>
                        </form>
                        <button class="btn btn-outline-secondary" onclick="editCategory('${listCate.maLoai}', '${listCate.tenLoai}', '${listCate.ghiChu}')">Sửa</button>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Cập nhật loại sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="AdminCategoryServlet" method="post">
                        <div class="form-group">
                            <label for="editMaLoai">Mã loại</label>
                            <input type="text" class="form-control" id="editMaLoai" name="maLoai" readonly="readonly" required>
                        </div>
                        <div class="form-group">
                            <label for="editTenLoai">Tên loại</label>
                            <input type="text" class="form-control" id="editTenLoai" name="tenLoai" required>
                        </div>
                        <div class="form-group">
                            <label for="editGhiChu">Ghi chú</label>
                            <input type="text" class="form-control" id="editGhiChu" name="ghiChu" required>
                        </div>
                        <input type="hidden" name="action" value="update">
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
