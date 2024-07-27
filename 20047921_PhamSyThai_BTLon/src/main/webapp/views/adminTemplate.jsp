<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
    }
    .sidebar {
        height: 100vh;
        width: 250px;
        background-color: #333;
        color: white;
        display: flex;
        flex-direction: column;
        position: fixed;
        overflow-y: auto;
    }
    .sidebar h2 {
        text-align: center;
        padding: 20px;
        margin: 0;
    }
    .sidebar a {
        padding: 15px 20px;
        text-decoration: none;
        color: white;
        display: block;
        cursor: pointer;
    }
    .sidebar a:hover {
    	text-decoration:none;
        background-color: #575757;
    }
    .submenu {
        display: none;
        background-color: #444;
    }
    .submenu a {
        padding-left: 40px;
    }
    .submenu a:hover {
    	text-decoration:none;
        background-color: #666;
    }
    .active .submenu {
        display: block;
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
    <div class="sidebar">
        <h2>Admin</h2>
        
        <a href="javascript:void(0);" onclick="toggleSubmenu('productSubmenu')"><i class="fa fa-navicon" style="font-size:24px"></i> Quản lý sản phẩm</a>
        <div id="productSubmenu" class="submenu">
            <a href="AddProductServlet">Thêm sản phẩm</a>
            <a href="AdminProductServlet">Danh sách sản phẩm</a>
        </div>
        <a href="javascript:void(0);" onclick="toggleSubmenu('categorySubmenu')"><i class="fa fa-navicon" style="font-size:24px"></i> Quản lý loại sản phẩm</a>
        <div id="categorySubmenu" class="submenu">
            <a href="adminThemLoaiSP.jsp">Thêm loại sản phẩm</a>
            <a href="AdminCategoryServlet">Danh sách các loại sản phẩm</a>
        </div>
        <a href="AdminUserServlet">Quản lý người dùng</a>
         <a href="AdminRevenueServlet">Quản lý doanh thu</a>
        <br> <br> <br> <br>
        <a href="LogoutServlet" style="text-align: center;"><i class="fa fa-sign-out" style="font-size:24px; color: white"></i> Đăng xuất</a> 
    </div>

</body>
</html>