<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="views/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ANT Sport</title>

<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">

</head>
<body>


	<div class="hero">
		<img src="/20047921_PhamSyThai_BTLon/Img/BANNER-2024-01.jpg"
			alt="Hero image" class="hero-image">

	</div>
	<br>
	<h1 style="text-align: center;">KHÁM PHÁ CÁC DÒNG XE</h1>

	<div class="row row-cols-1 row-cols-md-4 g-4">
		<div class="col">
			<div class="card h-100">
				<a href="ListProductServlet?category=Xe Đạp Đua"> <img
					src="/20047921_PhamSyThai_BTLon/Img/xedapdua.jpg"
					class="card-img-top" alt="...">
				</a>

				<div class="card-body">
					<h5 class="card-title">XE ĐẠP ĐUA</h5>

				</div>
			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<a href="ListProductServlet?category=Xe Đạp Đường Phố"><img
					src="/20047921_PhamSyThai_BTLon/Img/xeduongpho.png"
					style="margin-top: 70px; padding-bottom: 45px;"
					class="card-img-top" alt="..."></a>

				<div class="card-body">
					<h5 class="card-title">XE ĐẠP ĐƯỜNG PHỐ</h5>

				</div>
			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<a href="ListProductServlet?category=Xe Đạp Trẻ em"> <img
					src="/20047921_PhamSyThai_BTLon/Img/xetreem.jpg"
					class="card-img-top" alt="...">
				</a>
				<div class="card-body">
					<h5 class="card-title">XE ĐẠP TRẺ EM</h5>

				</div>
			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<a href="ListProductServlet?category=Xe Đạp Nữ"> <img
					src="/20047921_PhamSyThai_BTLon/Img/xedapnu.jpg"
					class="card-img-top" alt="...">
				</a>
				<div class="card-body">
					<h5 class="card-title">XE ĐẠP NỮ</h5>

				</div>
			</div>
		</div>
	</div>

	<section class="section-3">
		<h1>Vì sao bạn nên chọn chúng tôi ?</h1>
		<div class="acticle-1">
			<div class="col-3">
				<img style="height: 60px; width: 60px; float: left;"
					src="/20047921_PhamSyThai_BTLon/Img/freeship.png"
					alt="Product image">
				<h4>MIỄN PHÍ VẬN CHUYỂN</h4>
				<p style="margin-left: 65px;">Với đơn hàng trên 3 triệu áp tất
					cả sản phẩm</p>

			</div>
			<div class="col-3">
				<img style="height: 60px; width: 60px; float: left;"
					src="https://bizweb.dktcdn.net/100/066/626/themes/919897/assets/fot_policy_image_2.png?1720684386287"
					alt="Product image">
				<h4>GIAO HÀNG TRONG 48H</h4>
				<p style="margin-left: 65px;">Giao hàng trực tiếp trong vòng
					48h.</p>
			</div>
			<div class="col-3">
				<img style="height: 60px; width: 60px; float: left;"
					src="https://bizweb.dktcdn.net/100/066/626/themes/919897/assets/fot_policy_image_3.png?1720684386287"
					alt="Product image">
				<h4>3 NGÀY ĐỔI TRẢ</h4>
				<p style="margin-left: 65px;">Miễn phí đổi trả trong vòng 3
					ngày.</p>
			</div>

		</div>
	</section>

	<%@ include file="views/footer.jsp"%>

	<script>
		var modal = document.getElementById("myModal");
		var span = document.getElementsByClassName("close")[0];

		span.onclick = function() {
			modal.style.display = "none";
		}

		// Tự động đóng modal sau 2-3 giây
		setTimeout(function() {
			modal.style.display = "none";
		}, 1300); // 2000 milliseconds = 2 seconds

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

		if (modal) {
			modal.style.display = "block";
		}
	</script>
</body>
</html>
