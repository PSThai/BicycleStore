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
 * Servlet implementation class AdminProductServlet
 */
public class AdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 BicycleDAO bicycleDAO = new BicycleDAO();
         String thuongHieu = request.getParameter("thuongHieu");
         String category = request.getParameter("category");
         List<Bicycle> bicycles;

         if (thuongHieu != null && !thuongHieu.isEmpty() && category != null && !category.isEmpty()) {
             bicycles = bicycleDAO.getBicyclesByBrandAndCategory(thuongHieu, category);
         } else if (thuongHieu != null && !thuongHieu.isEmpty()) {
             bicycles = bicycleDAO.getBicycleByThuongHieu(thuongHieu);
         } else if (category != null && !category.isEmpty()) {
             bicycles = bicycleDAO.getBicycleByTenLoai(category);
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/adminDSSP.jsp");
        dispatcher.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");

        if ("delete".equals(action)) {
            // Handle deletion
            String maSP = request.getParameter("maSP");
            BicycleDAO bicycleDAO = new BicycleDAO();
            bicycleDAO.deleteBicycle(maSP);
            response.sendRedirect("AdminProductServlet");
        } else if ("add".equals(action)) {
            // Handle addition
            String maSP = request.getParameter("maSP");
            String tenSP = request.getParameter("tenSP");
            String imgURL = request.getParameter("imgURL");
            int soLuong = Integer.parseInt(request.getParameter("soLuong"));
            double gia = Double.parseDouble(request.getParameter("gia"));
            String thuongHieu = request.getParameter("thuongHieu");
            String thongSo = request.getParameter("thongSo");
            String tenLoai = request.getParameter("tenLoai");

            Bicycle bicycle = new Bicycle(maSP, imgURL, tenSP, gia, soLuong, thuongHieu, thongSo, tenLoai);
            BicycleDAO bicycleDAO = new BicycleDAO();
            bicycleDAO.addBicycle(bicycle);

            response.sendRedirect("AdminProductServlet");
    }else if ("update".equals(action)) {
    	
    	String maSP = request.getParameter("maSP");
        String tenSP = request.getParameter("tenSP");
        String imgURL = request.getParameter("imgURL");
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        double gia = Double.parseDouble(request.getParameter("gia"));
        String thuongHieu = request.getParameter("thuongHieu");
        String thongSo = request.getParameter("thongSo");
        String tenLoai = request.getParameter("tenLoai");

        Bicycle bicycle = new Bicycle(maSP, imgURL, tenSP, gia, soLuong, thuongHieu, thongSo, tenLoai);
        BicycleDAO bicycleDAO = new BicycleDAO();
        bicycleDAO.updateBicycle(bicycle);

        response.sendRedirect("AdminProductServlet");
    }
    }
}
