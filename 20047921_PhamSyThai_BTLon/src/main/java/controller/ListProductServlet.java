package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bicycle;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import dao.BicycleDAO;

/**
 * Servlet implementation class ListProductServlet
 */
public class ListProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BicycleDAO bicycleDAO = new BicycleDAO();
        List<Bicycle> bicycles = null;

        String thuongHieu = request.getParameter("thuongHieu");
        String category = request.getParameter("category");
        String sort = request.getParameter("sort");

        // Sort parameter takes priority
        if ("Giá từ cao xuống thấp".equals(sort)) {
            bicycles = bicycleDAO.getBicyclesSortedByPriceDesc();
        } else if ("Giá từ thấp lên cao".equals(sort)) {
            bicycles = bicycleDAO.getBicyclesSortedByPriceAsc();
        } else if (category != null && !category.isEmpty() && !category.equals("Tất cả xe đạp")) {
            bicycles = bicycleDAO.getBicycleByTenLoai(category);
        } else if (thuongHieu != null && !thuongHieu.isEmpty()) {
            bicycles = bicycleDAO.getBicycleByThuongHieu(thuongHieu);
        } else {
            bicycles = bicycleDAO.getProductsFromDatabase();
        }

        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

        for (Bicycle bicycle : bicycles) {
            double price = bicycle.getGia();
            String formattedPrice = currencyFormatter.format(price).replace("₫", "VNĐ");
            bicycle.setGiaString(formattedPrice);
        }

        request.setAttribute("bicycles", bicycles);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/ListBicycle.jsp");
        dispatcher.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
