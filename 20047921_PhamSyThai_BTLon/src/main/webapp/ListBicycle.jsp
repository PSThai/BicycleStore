<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="views/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop-Xe Đạp</title>
<link rel="stylesheet" href="css/ListProduct.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">


</head>
<body>

	<nav
		style="--bs-breadcrumb-divider: '>'; padding: 15px 0 1px 120px; background-color: #F2F2F2"
		aria-label="breadcrumb">
		<ol class="breadcrumb" id="breadcrumb">
			<li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
			<li class="breadcrumb-item" aria-current="page">Xe đạp</li>
		</ol>
	</nav>

	<div class="content" style="min-height: 100vh;">
		<section class="filter">

			<div
				style="padding: 10px 10px; border-bottom: 1px solid #f3f3f3; border-top: 1px solid #f3f3f3; margin-bottom: 10px;">
				<h6>BỘ LỌC</h6>
				<p>Giúp lọc nhanh sản phẩm bạn tìm kiếm</p>
			</div>

			<h4>- DANH MỤC SẢN PHẨM</h4>
			<form class="form-filter">
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" onchange="submitForm(this)"
						value="Tất
						cả xe đạp">Tất cả xe đạp
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name="category" value="Xe Đạp Đua"
						onchange="submitForm(this)">Xe Đạp Đua
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name="category" value="Xe Đạp Đường Phố"
						onchange="submitForm(this)">Xe Đạp Đường Phố
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name="category" value="Xe Đạp Nữ"
						onchange="submitForm(this)">Xe Đạp Nữ
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name="category" value="Xe Đạp Trẻ em"
						onchange="submitForm(this)">Xe Đạp Trẻ em
					</label>
				</div>
			</form>

			<h4>- THƯƠNG HIỆU</h4>
			<form class="form-filter">
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name="thuongHieu" value="Giant"
						onchange="submitForm(this)">GIANT
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name="thuongHieu" value="Trek"
						onchange="submitForm(this)">TREK
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name="thuongHieu" value="Liv"
						onchange="submitForm(this)">LIV
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name="thuongHieu" value="Califonia"
						onchange="submitForm(this)">CALIFONIA
					</label>
				</div>

				<div>
					<h4>- SẮP XẾP GIÁ</h4>

					<div class="form-check-inline">
						<label class="form-check-label"> <input type="checkbox"
							class="form-check-input" name="sort"
							value="Giá từ cao xuống thấp" onchange="submitForm(this)">
							Giá từ cao thấp
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="checkbox"
							class="form-check-input" name="sort" value="Giá từ thấp lên cao"
							onchange="submitForm(this)"> Giá từ thấp lên cao
						</label>

					</div>
			</form>
		</section>
		<script>
    document.addEventListener("DOMContentLoaded", () => {
        // Load the checked state from localStorage
        loadCheckedState();
        // Update the breadcrumb on page load
        updateBreadcrumb();
    });

    function submitForm(checkbox) {
        // Save the checked state to localStorage
        saveCheckedState();
        // Cập nhật breadcrumb
        updateBreadcrumb();
        // Gửi form
        checkbox.form.submit();
    }


    document.addEventListener("DOMContentLoaded", () => {
        // Load the checked state from localStorage
        loadCheckedState();
        // Update the breadcrumb on page load
        updateBreadcrumb();
    });

    function submitForm(checkbox) {
        // Uncheck all checkboxes except the one that was clicked
        const checkboxes = document.querySelectorAll('.form-check-input');
        checkboxes.forEach(cb => {
            if (cb !== checkbox) {
                cb.checked = false;
            }
        });
        // Save the checked state to localStorage
        saveCheckedState();
        // Cập nhật breadcrumb
        updateBreadcrumb();
        // Gửi form
        checkbox.form.submit();
    }

    function updateBreadcrumb() {
        const breadcrumb = document.getElementById('breadcrumb');
        
        // Xóa các mục breadcrumb hiện tại thuộc danh mục
        const categoryItems = document.querySelectorAll('.breadcrumb-item.category');
        categoryItems.forEach(item => item.remove());

        // Lấy tất cả các checkbox được chọn
        const checkedCheckboxes = document.querySelectorAll('.form-check-input:checked');
        checkedCheckboxes.forEach(checkbox => {
            const newItem = document.createElement('li');
            newItem.className = 'breadcrumb-item category';
            newItem.textContent = checkbox.value;
            breadcrumb.appendChild(newItem);
        });
    }

    function saveCheckedState() {
        const checkboxes = document.querySelectorAll('.form-check-input');
        const checkedState = {};
        checkboxes.forEach(checkbox => {
            checkedState[checkbox.name + checkbox.value] = checkbox.checked;
        });
        localStorage.setItem('checkedState', JSON.stringify(checkedState));
    }

    function loadCheckedState() {
        const checkedState = JSON.parse(localStorage.getItem('checkedState')) || {};
        const checkboxes = document.querySelectorAll('.form-check-input');
        checkboxes.forEach(checkbox => {
            checkbox.checked = checkedState[checkbox.name + checkbox.value] || false;
        });
    }
</script>

		<div class="filter-sort">
			<h4 style="text-align: center; padding: 40px 115px 0px 0px;">XE
				ĐẠP CHÍNH HÃNG I BẢO HÀNH CHÍNH HÃNG TẠI ANT BICYCLE</h4>


		</div>


		<div class="products">
			<c:forEach var="bicycle" items="${bicycles}">
				<div class="product-item">
					<form action="CartServlet" method="post" name="add">
						<img class="img-product-item" alt="xedap"
							src="/20047921_PhamSyThai_BTLon/Img/${bicycle.imgURL}"> <a
							href="DetailBicycleServlet?maSP=${bicycle.maSP}">
							<p
								style="color: black; text-align: left; font-weight: bold; font-size: 14px">
								${bicycle.tenSP}</p>
						</a>
						<p
							style="color: #332FF8; text-align: left; font-weight: bold; font-size: 20px">${bicycle.giaString}</p>

						<input type="hidden" name="maSP" value="${bicycle.maSP}">
						<input type="hidden" name="soLuong" value="${bicycle.soLuong}">
						<input type="hidden" name="imgURL" value="${bicycle.imgURL}">
						<input type="hidden" name="gia" value="${bicycle.gia}"> <input
							type="hidden" name="giaString" value="${bicycle.giaString}">
						<input type="hidden" name=tenSP value="${bicycle.tenSP}">
						<input type="hidden" name="action" value="add">

						<div class="buttons">
							<div class="add-to-cart">
								<i class="fa fa-cart-plus"
									style="font-size: 30px; color: white; margin-left: 30px; position: absolute;">
								</i> <input
									style="background-color: unset; color: white; border: none; width: 100%; height: 140%; font-size: 16px; padding-bottom: 10px;"
									type="submit" name="add" value="Thêm vào giỏ hàng">
							</div>
						</div>
					</form>
				</div>
			</c:forEach>
		</div>
	</div>


	<%@ include file="views/footer.jsp"%>
</body>
</html>