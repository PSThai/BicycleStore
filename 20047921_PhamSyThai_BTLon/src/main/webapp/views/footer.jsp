<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>

<style type="text/css">
	font-family: "Roboto", "HelveticaNeue", "Helvetica Neue", sans-serif;
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<div class="mt-5 p-4 bg-dark text-white text-center">
		<h2>THÔNG TIN LIÊN LIÊN HỆ CỦA CHÚNG TÔI</h2>
		<form class="form-info" action="DiscountServlet" method="post">
			<input type="text" name="email"
				placeholder="Nhập Email nhận tin khuyến mãi">
			<button type="submit">ĐĂNG KÝ</button>
		</form>
		<div style="display: flex; justify-content: space-around;">
			<div style="align-items: center;">
				<h4>ANT BICYCLE</h4>
				<img style="width:170px; height: 90px " alt="logo" src="/20047921_PhamSyThai_BTLon/Img/logo-thongbaobocongthuong.png">
			</div>
			<div>
				<h4>Sinh viên thực hiện</h4>
				<p>Phạm Sỹ Thái</p>
			</div>
			<div>
				<h4>MSSV</h4>
				<p>20047921</p>
			</div>
			<div>
				<h4>THÔNG TIN LIÊN HỆ</h4>
				<p>
					12 Nguyễn Văn Bảo - P4 - Gò Vấp - Tp.HCM
				</p>
				<p>
					Hotline: <a style="color: white; text-decoration: none;" href="tel:+0911513297">0911513297</a> <br>
				</p>
				<p>Email:<a style="color: white; text-decoration: none;" href="mailto:phamsythai644@gmail.com">phamsythai644@gmail.com</a></p>
			</div>
		</div>

</div>


