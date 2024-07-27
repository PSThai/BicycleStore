package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bicycle;
import model.Cart;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");

		if (cartList == null) {
			cartList = new ArrayList<>();
			session.setAttribute("cartList", cartList);
		}

		switch (action) {
		case "delete":
			deleteFromCart(request, cartList);
			break;
		case "update":
			updateCart(request, cartList);
			break;
		}
		int countItem =cartList.size();
		session.setAttribute("countItem",countItem);
		double totalOrderPrice = calculateTotalOrderPrice(cartList);
		String formattedTotalOrderPrice = formatCurrency(totalOrderPrice);
		session.setAttribute("formattedTotalOrderPrice", formattedTotalOrderPrice);
		session.setAttribute("totalOrderPrice", totalOrderPrice);
		response.sendRedirect("Cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");

		if (cartList == null) {
			cartList = new ArrayList<>();
			session.setAttribute("cartList", cartList);
		}
		
		switch (action) {
		case "add":
			addToCart(request, cartList);
			break;
		}
		double totalOrderPrice = calculateTotalOrderPrice(cartList);
		session.setAttribute("totalOrderPrice", totalOrderPrice);
		String formattedTotalOrderPrice = formatCurrency(totalOrderPrice);
		session.setAttribute("formattedTotalOrderPrice", formattedTotalOrderPrice);
		int countItem =cartList.size();
		session.setAttribute("countItem",countItem);
		session.setAttribute("cartList", cartList);
		response.sendRedirect("Cart.jsp");
	}

	private void addToCart(HttpServletRequest request, ArrayList<Cart> cartList) {
		String maSP = request.getParameter("maSP");
		String imgURL = request.getParameter("imgURL");
		String tenSP = request.getParameter("tenSP");
		double gia = Double.parseDouble(request.getParameter("gia"));
		int soLuong = Integer.parseInt(request.getParameter("soLuong"));

		boolean productExists = false;
		for (Cart cartItem : cartList) {
			if (cartItem.getMaSP().equals(maSP)) {
				// Sản phẩm đã tồn tại trong giỏ hàng, tăng số lượng thêm 1
				int newQuantity = cartItem.getSoLuong() + soLuong;
				cartItem.setSoLuong(newQuantity);
				double newTongTien = cartItem.getGia() * newQuantity;
				cartItem.setTongTien(newTongTien);
				cartItem.setGiaString(formatCurrency(cartItem.getGia()));
				cartItem.setTongTienString(formatCurrency(newTongTien));
				productExists = true;
				break;
			}
		}

		if (!productExists) {
			// Sản phẩm chưa tồn tại trong giỏ hàng, thêm mới
			double tongTien = gia * soLuong; // Tổng tiền của mỗi sản phẩm
			String giaString = formatCurrency(gia);
			String tongTienString = formatCurrency(tongTien);
			Cart newCartItem = new Cart(maSP, imgURL, tenSP, gia, soLuong, tongTien, giaString, tongTienString);
			cartList.add(newCartItem);
		}
	}

	private void deleteFromCart(HttpServletRequest request, ArrayList<Cart> cartList) {
		String maSP = request.getParameter("maSP");
		cartList.removeIf(cart -> cart.getMaSP().equals(maSP));
	}

	private void deleteFromCart(String maSP, ArrayList<Cart> cartList) {
		cartList.removeIf(cart -> cart.getMaSP().equals(maSP));
	}

	private void updateCart(HttpServletRequest request, ArrayList<Cart> cartList) {
		String[] maSPArray = request.getParameterValues("maSP");
		String[] soLuongArray = request.getParameterValues("soLuong");

		if (maSPArray != null && soLuongArray != null) {
			for (int i = 0; i < maSPArray.length; i++) {
				String maSP = maSPArray[i];
				int soLuong = Integer.parseInt(soLuongArray[i]);
				if (soLuong == 0) {
					deleteFromCart(maSP, cartList);
				} else {
					for (Cart cart : cartList) {
						if (cart.getMaSP().equals(maSP)) {
							cart.setSoLuong(soLuong);
							double newTongTien = cart.getGia() * soLuong;
							cart.setTongTien(newTongTien);
							cart.setGiaString(formatCurrency(cart.getGia()));
							cart.setTongTienString(formatCurrency(newTongTien));
							break;
						}
					}
				}
			}
		}
	}

	private double calculateTotalOrderPrice(ArrayList<Cart> cartList) {
		double totalOrderPrice = 0.0;
		for (Cart cart : cartList) {
			totalOrderPrice += cart.getTongTien();
		}
		return totalOrderPrice;
	}

	private String formatCurrency(double amount) {
		NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
		return currencyFormatter.format(amount).replace("₫", "VNĐ");
	}
}
