package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.UserDAO;

/**
 * Servlet implementation class AdminUserServlet
 */
public class AdminUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUserServlet() {
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
		UserDAO userDAO = new UserDAO();

		// Get all users with role "USER"
		List<User> userList = userDAO.getAllUsersWithRole("USER");

		// Set the user list as a request attribute
		request.setAttribute("userList", userList);

		// Forward the request to the JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adminQLUser.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle form submissions (e.g., update or delete user)
        String action = request.getParameter("action");
        String email = request.getParameter("email");

        UserDAO userDAO = new UserDAO();

        if ("update".equals(action)) {
            String fName = request.getParameter("fName");
            String lName = request.getParameter("lName");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            
            userDAO.updateUser(email, fName, lName, password, role);
        } else if ("delete".equals(action)) {
            userDAO.deleteUser(email);
        }
        
        // Redirect to the same servlet to refresh the user list
        response.sendRedirect("AdminUserServlet");
    }

}
