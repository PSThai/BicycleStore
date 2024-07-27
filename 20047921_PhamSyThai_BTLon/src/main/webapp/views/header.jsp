<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<div class="header-contact">
		<div
			style="justify-content: center; align-items: center; display: flex;">
			<div
				style="background-color: #036D03; padding-top: 3px; border: 1px solid #036D03; height: 36px; padding-left: 10px; padding-right: 10px; transform: skewX(-20deg);">
				<div
					style="background: url(/20047921_PhamSyThai_BTLon/Img/freeship.png) center center no-repeat; background-size: contain; display: flex; transform: skewX(20deg); position: absolute; width: 36px; height: 26px; float: left;">
				</div>
				<div
					style="color: white; transform: skewX(20deg); font-style: italic; font-weight: bold; font-size: xx-small; line-height: 2.5; margin-left: 40px; margin-top: 1px">
					FREE SHIP TOÀN QUỐC</div>
			</div>

			<div
				style="background-color: #ff4200; padding-top: 3px; border: 1px solid #ff4200; height: 36px; padding-left: 10px; padding-right: 10px; transform: skewX(-20deg);">
				<div
					style="background: url(/20047921_PhamSyThai_BTLon/Img/48h.png) center center no-repeat; background-size: contain; display: flex; transform: skewX(20deg); position: absolute; width: 36px; height: 26px; float: left;">
				</div>
				<div
					style="color: white; transform: skewX(20deg); font-style: italic; font-weight: bold; font-size: xx-small; line-height: 2.5; margin-left: 40px; margin-top: 1px">
					GIAO NHANH 24H</div>
			</div>
		</div>

		<div style="color: white;"><a style="color: white; text-decoration: none;" href="mailto:phamsythai644@gmail.com">phamsythai644@gmail.com</a></div>

		<div
			style="justify-content: center; align-items: center; display: flex;">
			<div style="margin-right: 5px; display: flex; align-items: center;">
				<i class='fa fa-phone'
					style='font-size: 19px; color: white; margin: 0 10px'></i>

				<h5 style="text-align: right; color: #fff">HOTLINE: <a style="color: white; text-decoration: none;" href="tel:+0911513297">0911513297</a> </h5>
			</div>

			<div style="margin-right: 25px;">

				<i class="fa fa-facebook-square"
					style='font-size: 21px; color: #2E467E;'></i> <i
					class='fa fa-envelope' style='font-size: 20px; color: white;'></i>
				<i class="fa fa-youtube-play" style="font-size: 22px; color: red"></i>
			</div>
		</div>

	</div>
	<c:if test="${not empty sessionScope.message}">
		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>${sessionScope.message}</p>
			</div>
		</div>
		<c:remove var="message" scope="session" />
	</c:if>
	<header>

		<div class="logo">
			<a style="text-decoration: none;" href="index.jsp">ANT BICYCLE</a>
		</div>

		<div class="search-bar">
			<input type="search" placeholder="Tìm kiếm sản phẩm">
			<button>
				<i class="fa fa-search"></i>
			</button>
		</div>

		<div class="shopping-cart">
			<ul>
				<li><a href="Cart.jsp" class="header-cart"> <i
						class="fa fa-shopping-cart" style="font-size: 24px; color: black;">
					</i> Giỏ hàng <c:choose>
							<c:when test="${not empty sessionScope.countItem}">
								<span
									style="background-color: yellow; padding: 5px; border-radius: 4px;">${sessionScope.countItem}</span>
							</c:when>
							<c:otherwise>
								<span
									style="background-color: yellow; padding: 5px; border-radius: 4px;">0</span>
							</c:otherwise>
						</c:choose>
				</a></li>
			</ul>
		</div>

		<div class="account-sign">
			<ul>
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<li><a href="#"> <i class="fa fa-user"
								style="font-size: 24px"></i> ${sessionScope.user.fName}
								${sessionScope.user.lName}
						</a>
							<ul class="dropdown-login">
								<li><a href="LogoutServlet">Đăng xuất</a></li>
							</ul></li>
					</c:when>
					<c:otherwise>
						<li><a href="Login.jsp"> <i class="fa fa-user"
								style="font-size: 24px"></i> Đăng nhập
						</a>
							<ul class="dropdown-login">
								<li><a href="Login.jsp">Đăng nhập</a></li>
								<li><a href="Register.jsp">Đăng ký</a></li>
							</ul></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</header>
	<div class="nav-menu">
		<ul>
			<li><a href="index.jsp">Trang Chủ </a></li>
			<li><a href="ListProductServlet">Sản Phẩm <i
					class='fa fa-angle-right'></i></a>
				<ul class="dropdown-menu">
				<li><a href="ListProductServlet">Tất cả sản phẩm</a></li>
					<li><a href="ListProductServlet?category=Xe Đạp Đua">Xe
							Đạp Đua</a></li>
					<li><a href="ListProductServlet?category=Xe Đạp Đường Phố">Xe
							Đạp Đường Phố</a></li>
					<li><a href="ListProductServlet?category=Xe Đạp Nữ">Xe Đạp
							Nữ</a></li>
					<li><a href="ListProductServlet?category=Xe Đạp Trẻ em">Xe
							Đạp Trẻ em</a></li>
				</ul></li>
			<li><a href="#">Khuyến Mãi</a></li>
			<li><a href="#">Liên Hệ <i class='fa fa-angle-right'></i></a></li>
			<li><a href="#">Tin Tức</a></li>
		</ul>
	</div>
</body>
