<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="views/adminTemplate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm loại sản phẩm</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <h1>Thêm Loại Sản Phẩm</h1>
        <form action="AdminCategoryServlet" method="post">
            <label for="maLoai">Mã loại sản phẩm:</label>
            <input type="text" id="maLoai" name="maLoai" required>
            
            <label for="tenLoai">Tên loại sản phẩm:</label>
            <input type="text" id="tenLoai" name="tenLoai" required>
            
            <label for="ghiChu">Ghi chú:</label>
            <input type="text" id="ghiChu" name="ghiChu" required>
            
         	 <input type="hidden" name="action" value="add">
            <button type="submit">Thêm loại sản phẩm</button>
        </form>
    </div>
</body>
</html>