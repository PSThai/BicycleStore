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
import java.util.Locale;

import dao.BicycleDAO;

/**
 * Servlet implementation class DetailBicycleServlet
 */
public class DetailBicycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailBicycleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maSP = request.getParameter("maSP");
        
        // Assuming you have a ProductDAO that fetches the product details
        BicycleDAO bicycleDAO = new BicycleDAO();
        Bicycle bicycle = bicycleDAO.getBicycleById(maSP);
        
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

		
		double price = bicycle.getGia();
		String formattedPrice = currencyFormatter.format(price).replace("₫", "VNĐ");
		bicycle.setGiaString(formattedPrice);
	
        request.setAttribute("bicycle", bicycle);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DetailBicycle.jsp");
		dispatcher.forward(request, response);
		
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
