package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import dao.OrderDAO;

/**
 * Servlet implementation class AdminRevenueServlet
 */
public class AdminRevenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminRevenueServlet() {
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

		// Tạo đối tượng DAO để lấy dữ liệu
		OrderDAO orderDAO = new OrderDAO();

		// Lấy tất cả các đơn hàng
		List<Order> orders = orderDAO.getAllOrders();

		// Tính tổng doanh thu
		double totalRevenue = orders.stream().mapToDouble(Order::getTotalOrderPrice).sum();

		// Set thuộc tính cho JSP
		request.setAttribute("orders", orders);
		request.setAttribute("totalRevenue", totalRevenue);

		// Chuyển tiếp đến trang JSP
		request.getRequestDispatcher("/adminDoanhThu.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String startDateStr = request.getParameter("startDate");
		String endDateStr = request.getParameter("endDate");

		Date startDate = null;
		Date endDate = null;

		try {
			startDate = dateFormat.parse(startDateStr);
			endDate = dateFormat.parse(endDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		OrderDAO orderDAO = new OrderDAO();
		
		if (startDate != null && startDate != null) {
			List<Order> orders = orderDAO.getOrdersByDateRange(startDate, endDate);
			double totalRevenue = orders.stream().mapToDouble(Order::getTotalOrderPrice).sum();

			// Set the orders attribute for JSP
			request.setAttribute("orders", orders);
			request.setAttribute("totalRevenue", totalRevenue);
		} else {
			// Lấy tất cả các đơn hàng
			List<Order> orders = orderDAO.getAllOrders();
			double totalRevenue = orders.stream().mapToDouble(Order::getTotalOrderPrice).sum();
			// Set the orders attribute for JSP
			request.setAttribute("orders", orders);
			request.setAttribute("totalRevenue", totalRevenue);
		}

		// Forward to JSP page
		request.getRequestDispatcher("/adminDoanhThu.jsp").forward(request, response);
	}

}
