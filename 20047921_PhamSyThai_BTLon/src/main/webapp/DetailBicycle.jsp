<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chi Tiết Sản Phẩm</title>
<link rel="stylesheet" href="css/DetailBicycle.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="views/header.jsp"%>
	<nav
		style="--bs-breadcrumb-divider: '>'; padding: 15px 0 1px 15px; background-color: #F2F2F2"
		aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
			<li class="breadcrumb-item"><a href="ListProductServlet">Xe
					đạp</a></li>
			<li class="breadcrumb-item active" aria-current="page">Chi tiết
				Xe đạp</li>
		</ol>
	</nav>
	<main style="width: auto; height: auto; background-color: #f2f2f2">

		<div
			style="display: flex; width: 1750px; height: auto; margin: 20px; margin-left: 130px; justify-content: space-between;">
			<div
				style="border-radius: 5px; border: 2px solid #6c757d; width: 1300px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); background-color: #ffffff">

				<div style="width: 1250px; margin-left: 20px">
					<h2
						style="font-size: 20px; text-align: left; width: 200px; margin-top: 20px; color: #000099; font-weight: bold;">Chi
						tiết đơn hàng</h2>
					<hr style="background-color: #cc6600; height: 1.5px">
					<div style="display: flex;">
						<div class="col-md-6">
							<img src="/20047921_PhamSyThai_BTLon/Img/${bicycle.imgURL}"
								class="img-thumbnail" alt="${bicycle.tenSP}" width="700"
								height="900">
						</div>

						<div class="col-md-6" style="max-width: 550px; margin-left: 20px;">
							<h2 style="text-align: left; color: #000099; margin-top: 10px">${bicycle.tenSP}</h2>
							<img alt="" src="IMG/giaohang.png" width="500px"
								style="margin-top: 5px">
							<hr>
							<div style="display: flex;">
								<label
									style="font-weight: bold; color: #000099; font-size: 18px; margin-top: 22px;">Giá
									Bán:</label>
								<p
									style="color: #cc2900; font-size: 40px; font-weight: bold; margin-left: 5px">
									<fmt:formatNumber value="${bicycle.gia}" type="currency"
										currencySymbol="₫" />
								</p>
							</div>

							<form action="CartServlet" method="post">
								<input type="hidden" name="maSP" value="${bicycle.maSP}">
								<input type="hidden" name="imgURL" value="${bicycle.imgURL}">
								<input type="hidden" name="gia" value="${bicycle.gia}">
								<input type="hidden" name="giaString"  value="${bicycle.giaString}"> 
								<input type="hidden" name="tenSP" value="${bicycle.tenSP}">
								<input type="hidden" name="action" value="add"> 
								<div style="display: flex; height: 75px;justify-content: space-evenly;">
									<div class="form-group"	style="width: 110px; font-size: 19px; text-align: left;">
										<label for="soluongmua">Số lượng:</label> 
										<input type="number" class="form-control" 
											id="soLuong" 
											name="soLuong" 
											value="1"
											min="1"
											style="text-align: center; width: 100%; margin-left: 10px; height: 35px; font-size: 18px; background-color: #f2f2f2">
									</div>
									<input type="hidden" name="action" value="add">
									<button type="submit" class="btn btn-warning"
										style="font-size: 20px; font-weight: bold;">
										THÊM VÀO GIỎ HÀNG
										<p style="font-size: 15px; font-weight: normal;">Đặt hàng
											Online hoặc gọi tới Hotline</p>
									</button>

								</div>
								<div style="display: flex; height: 80px; margin-top: 10px">
									<input type="hidden" name="action" value="add">
									<button type="submit" class="btn btn-danger"
										style="font-size: 23px; font-weight: bold; padding-left: 80px; padding-right: 90px">
										MUA HÀNG
										<p
											style="font-size: 15px; font-weight: normal; width: 350px; margin-top: 5px">Giao
											Hàng Tận Nơi Hoặc Nhận Tại Cửa Hàng</p>
									</button>
								</div>

								<div style="display: flex; height: 80px; margin-top: 10px">
									<input type="hidden" name="action" value="add">
									<button type="submit" class="btn btn-info"
										style="font-size: 23px; font-weight: bold; padding-left: 80px; padding-right: 90px">
										TRẢ GÓP QUA THẺ
										<p
											style="font-size: 15px; font-weight: normal; width: 350px; margin-top: 5px">Visa,
											Master, JCB...</p>
									</button>
								</div>

								<div style="display: flex; height: 80px; margin-top: 10px">
									<input type="hidden" name="action" value="add">
									<button type="submit" class="btn btn-primary"
										style="font-size: 23px; font-weight: bold; padding-left: 80px; padding-right: 90px">
										MUA NGAY - TRẢ SAU
										<p
											style="font-size: 15px; font-weight: normal; width: 350px; margin-top: 5px">FE
											CREDIT, HOME CREDIT, VIB, TPBank, ACB,...</p>
									</button>
								</div>
							</form>

						</div>
					</div>
					<div
						style="background-color: #000099; color: white; font-weight: bold; width: 100px; height: 50px; text-align: center; margin-left: 15px">
						<p style="font-size: 20px; padding-top: 10px">Mô tả</p>
					</div>
					<div
						style="border-radius: 1px; border: 2px solid #d9d9d9; width: 1180px; margin-left: 15px">

						<p
							style="font-size: 20px; text-align: left; padding: 10px; margin: 10px">${bicycle.thongSo}</p>
					</div>


				</div>

			</div>

		</div>


		</div>
	</main>
	<%@ include file="views/footer.jsp"%>
</body>
</html>
