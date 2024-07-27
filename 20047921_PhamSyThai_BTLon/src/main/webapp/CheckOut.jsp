<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Check Out</title>
<link rel="stylesheet" href="css/CheckOut.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="views/header.jsp"%>

	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("Login.jsp");
		return; // Exit the script to avoid further processing
	}
	%>
	<c:if test="${not empty sessionScope.message}">
		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>${sessionScope.message}</p>
			</div>
		</div>
		<c:remove var="message" scope="session" />
	</c:if>
	<nav style="--bs-breadcrumb-divider: '>';padding: 15px 0 1px 15px; background-color: #F2F2F2" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
			<li class="breadcrumb-item"><a href="Cart.jsp">Giỏ hàng</a></li>
			<li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
		</ol>
	</nav>
	
	<div class="info-address">
		<form class="form" action="CheckOutServlet" method="post">
			<div class="section">
				<div class="tt-nhan-hang">

					<h3>ĐỊA CHỈ NHẬN HÀNG</h3>
					<div>
						<label for="name">Họ và tên *</label> <input type="text" id="name"
							name="name" value="${sessionScope.user.fName} ${sessionScope.user.lName}" required>
					</div>
					<div>
						<label for="city">Tỉnh / Thành phố *</label> <input type="text"
							id="city" name="city" required>
					</div>
					<div>
						<label for="district">Quận / Huyện *</label> <input type="text"
							id="district" name="district" required>
					</div>
					<div>
						<label for="address">Địa chỉ *</label> <input type="text"
							id="address" name="address" required>
					</div>
					<div>
						<label for="phone">Số điện thoại *</label> <input type="text"
							id="phone" name="phone" required>
					</div>
					<div>
						<label for="email">Địa chỉ email *</label> <input type="email"
							id="email" name="email" value="${sessionScope.user.email}" required>
					</div>
					<div>
						<label for="note">Ghi chú *</label>
						<textarea id="note" name="note" required>
							</textarea>
					</div>
				</div>

				<div class="tt-thanhtoan">
					<h2>ĐƠN HÀNG CỦA BẠN</h2>
					<!-- Payment Summary Table -->
					<table>
						<thead>
							<tr>
								<th colspan="3">SẢN PHẨM</th>
								<th style="text-align: center;">TỔNG</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cartItem" items="${sessionScope.cartList}">
								<tr>
									<td colspan="3">${cartItem.tenSP}<strong>x${cartItem.soLuong}</strong>
									</td>
									<td>${cartItem.tongTienString}</td>
								</tr>

							</c:forEach>
							<tr>
								<th colspan="3">Tổng thu:</th>
								<th>${sessionScope.formattedTotalOrderPrice}</th>
							</tr>
						</tbody>
					</table>

					<!-- Delivery Options -->
					<div>
						<h5>Giao hàng</h5>
						<label> <input type="radio" name="delivery"
							value="Giao hàng xe đạp miễn phí"> Giao hàng xe đạp miễn
							phí
						</label> <label> <input type="radio" name="delivery"
							value="Giao hàng phụ kiện đồng giá:
									35.000VND (Toàn quốc)">
							Giao hàng phụ kiện đồng giá: 35.000VND (Toàn quốc)
						</label> <label> <input type="radio" name="delivery"
							value=" Nhận tại cửa hàng"> Nhận tại cửa hàng
						</label>
					</div>

					<!-- Payment Methods -->
					<div>
						<h5>Phương thức thanh toán</h5>
						<label> <input type="radio" name="payment"
							value="Thanh toán khi nhận hàng"> Thanh toán khi nhận
							hàng
						</label> <label> <input type="radio" name="payment"
							value="Chuyển khoản ngân hàng"> Chuyển khoản ngân hàng <img
							alt="momo" class="" src="/20047921_PhamSyThai_BTLon/Img/bank.png">
						</label> <label> <input type="radio" name="payment"
							value="Thanh toán Momo"> Thanh toán Momo <img alt="momo"
							class="img-momo"
							src="/20047921_PhamSyThai_BTLon/Img/momo_icon.png">
						</label> <label> <input type="radio" name="payment"
							value="Thanh toán Momo"> Thanh toán bằng thẻ ATM nội địa
							<img alt="momo" class=""
							src="/20047921_PhamSyThai_BTLon/Img/atm.png">
						</label>
					</div>
				</div>
			</div>
			<button style="margin-left: 30px" type="submit">Thanh toán</button>
		</form>
	</div>

	<%@ include file="views/footer.jsp"%>
	<script type="text/javascript">
		//Get the modal
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