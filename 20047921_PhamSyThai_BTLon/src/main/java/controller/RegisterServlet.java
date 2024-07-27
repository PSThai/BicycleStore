package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.EmailUtil;

import java.io.IOException;

import dao.UserDAO;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	userDAO = new UserDAO();
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
		
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // Assuming role is also passed

        if (userDAO.register(fName, lName, email, password, role)) {
        	
        	 // Send registration success email
            String subject = "Registration Successful";
            String body = "Dear " + fName + " " + lName + ",\n\n" +
                          "Thank you for registering. Your account has been created successfully.\n\n" +
                          "Best Regards,\n" +
                          "ANT BICYCLE";

            EmailUtil.sendEmail(email, subject, body);
            
        	request.getSession().setAttribute("message", "Registration successful! Please log in.");
            response.sendRedirect("Login.jsp"); // Redirect to login page
        } else {
            response.sendRedirect("Register.jsp?error=true"); // Redirect back to register with error
        }
    }

}
