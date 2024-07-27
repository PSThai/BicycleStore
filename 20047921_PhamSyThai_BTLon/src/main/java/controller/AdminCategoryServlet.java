package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bicycle;
import model.Category;

import java.io.IOException;
import java.util.List;

import dao.BicycleDAO;
import dao.CategoryDAO;

/**
 * Servlet implementation class AdminCategoryServlet
 */
public class AdminCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve categories from database
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> listCate = categoryDAO.getAllCategories();

        request.setAttribute("listCate", listCate);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/adminDSLoaiSP.jsp");
        dispatcher.forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");
    	
    	if ("add".equals(action)) {
            // Retrieve form parameters for the new category
            String maLoai = request.getParameter("maLoai");
            String tenLoai = request.getParameter("tenLoai");
            String ghiChu = request.getParameter("ghiChu");

            Category cate = new Category(maLoai, tenLoai, ghiChu);
            CategoryDAO categoryDAO = new CategoryDAO();
            categoryDAO.addCategory(cate);

            // Redirect to a category listing page
            response.sendRedirect("AdminCategoryServlet");

        } else if ("delete".equals(action)) {
            // Retrieve form parameters for the category to delete
            String maLoai = request.getParameter("maLoai");

            CategoryDAO categoryDAO = new CategoryDAO();
            categoryDAO.deleteCategory(maLoai);

            // Redirect to a category listing page
            response.sendRedirect("AdminCategoryServlet");
        } else if ("update".equals(action)) {
        	 String maLoai = request.getParameter("maLoai");
        	 String tenLoai = request.getParameter("tenLoai");
        	 String ghiChu = request.getParameter("ghiChu");
        	 
        	 Category category = new Category(maLoai, tenLoai, ghiChu);
             CategoryDAO categoryDAO = new CategoryDAO();
             
             categoryDAO.updateCategory(category);

             // Redirect to a category listing page
             response.sendRedirect("AdminCategoryServlet");
        }
    }
}
