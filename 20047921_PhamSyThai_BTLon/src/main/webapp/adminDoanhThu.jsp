<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="views/adminTemplate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doanh thu - Báo cáo</title>

<style type="text/css">

	/* styles.css */

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.content {
    width: 100%;
    height:100vh;
    margin-left:250px;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

.filter {
    margin-bottom: 20px;
    text-align: center;
}

.filter label {
    margin-right: 10px;
}

.filter input {
    margin-right: 10px;
}

button {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
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
input {
	height: 30px;
	
}
	
</style>
</head>
<body>
	 <div class="content">
        <h1>Quản Lý Doanh Thu</h1>
        
        <div class="filter">
            <form action="AdminRevenueServlet" method="post">
                <label for="startDate">Ngày bắt đầu:</label>
                <input type="date" id="startDate" name="startDate" >
                
                <label for="endDate">Ngày kết thúc:</label>
                <input type="date" id="endDate" name="endDate" >
                	
                <button type="submit">Lọc</button>
                
                 
            </form>
        </div>
  
       <table id="revenueTable">
            <thead>
                <tr>
                    <th>Mã Đơn Hàng</th>
                    <th>Tên Khách Hàng</th>
                    <th>Ngày Đặt Hàng</th>
                    <th>Giá trị đơn hàng</th>
                    <th>Danh Sách Sản Phẩm</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dữ liệu sẽ được chèn vào đây bởi Java Servlet -->
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.name}</td>
                        <td><fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy" /></td>
                        <td><fmt:formatNumber value="${order.totalOrderPrice}" type="number" /> VNĐ</td>
                        <td>
                            <ul>
                                <c:forEach var="product" items="${order.listSP}">
                                    <li>${product.tenSP} - ${product.soLuong} Chiếc</li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4"><strong>Tổng Doanh Thu:</strong></td>
                    <td><fmt:formatNumber value="${totalRevenue}" type="number" /> VNĐ</td>
                </tr>
            </tfoot>
        </table>
    </div>
</body>
</html>