<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/Cart.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="views/header.jsp"%>
	<nav style="--bs-breadcrumb-divider: '>';padding: 15px 0 1px 15px; background-color: #F2F2F2" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
			<li class="breadcrumb-item"><a href="ListProductServlet">Xe đạp</a></li>
			<li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
		</ol>
	</nav>
	<div class="section">
		<div class="tb-cart">
			<c:choose>
				<c:when test="${empty cartList}">
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="3">SẢN PHẨM</th>
								<th>GIÁ</th>
								<th>SỐ LƯỢNG</th>
								<th>TỔNG</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6">Giỏ hàng của bạn đang trống</td>
							</tr>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<form action="CartServlet" method="get">
						<table class="table table-striped">
							<thead>
								<tr>
									<th colspan="3">SẢN PHẨM</th>
									<th>GIÁ</th>
									<th>SỐ LƯỢNG</th>
									<th>TỔNG</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cartItem" items="${sessionScope.cartList}" varStatus="status">
									<tr>
										<td><input type="hidden" name="maSP" value="${cartItem.maSP}"> 
										<a href="CartServlet?action=delete&maSP=${cartItem.maSP}">X</a>
										</td>
										<td><img
											src="/20047921_PhamSyThai_BTLon/Img/${cartItem.imgURL}"
											alt="${cartItem.tenSP}"></td>
										<td>${cartItem.tenSP}</td>
										<td>${cartItem.giaString}</td>
										<td><input type="number" name="soLuong" min="0"
											value="${cartItem.soLuong}"></td>
										<td>${cartItem.tongTienString}</td>
									</tr>

								</c:forEach>
								<tr>
									<td colspan="6">
										<div style="float: left; margin: 8px 5px 0 5px">
											<a href="ListProductServlet"
												style="color: #332ff8; font-weight: bold; font-size: 13px; text-decoration: none; border: 2px solid #332ff8; padding: 11px">
												← TIẾP TỤC XEM SẢN PHẨM </a>
										</div> 
										
										<input type="hidden" name="gia" value="${cartItem.gia}">
										<input type="hidden" name="tenSP" value="${cartItem.tenSP}">
										<input type="hidden" name="giaString"	value="${cartItem.giaString}"> 
										<input type="hidden" name="totalOrderPrice"
										value="${sessionScope.formattedTotalOrderPrice}"> 
										<input	type="hidden" name="action" value="update"> 
										<input	style="background-color: #446084; color: white; font-weight: bold; font-size: 13px; padding: 12px; border: none;"
										type="submit" name="update" value="CẬP NHẬT GIỎ HÀNG">
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</c:otherwise>
			</c:choose>


		</div>
	
   	 
		<div class="cart-summary">
			<h2>Giỏ hàng</h2>
			<p class="total">Tổng thu:
				${sessionScope.formattedTotalOrderPrice}</p>
			<div class="coupon">
				<label for="coupon-code">Phiếu ưu đãi:</label> <input type="text"
					id="coupon-code" placeholder="Mã ưu đãi"> <a>Áp dụng</a>
			</div>
			<a class="checkout"	href="CheckOut.jsp"> Tiến hành thanh toán</a>

		</div>
	</div>

	<%@ include file="views/footer.jsp"%>
</body>
</html>