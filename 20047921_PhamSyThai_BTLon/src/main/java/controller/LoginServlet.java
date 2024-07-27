package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

import dao.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private UserDAO userDAO;

	    public void init() {
	        userDAO = new UserDAO();
	    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        User user = userDAO.login(email, password);
	        if (user != null) {
	        	
	            request.getSession().setAttribute("user", user);
	            request.getSession().setAttribute("message", "Login successful. Welcome " + user.getlName() + "!");
	            
	            // Redirect based on user role
	            if ("ADMIN".equals(user.getRole())) {
	                response.sendRedirect("admin.jsp"); // Redirect to admin page
	            } else {
	                response.sendRedirect("index.jsp"); // Redirect to a home page
	            }
	        } else {
	            request.setAttribute("error", "Invalid email or password.");
	            request.getRequestDispatcher("Login.jsp").forward(request, response);
	        }
	    }

}
