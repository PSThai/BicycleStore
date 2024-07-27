package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.EmailUtil;

import java.io.IOException;

/**
 * Servlet implementation class DiscountServlet
 */
public class DiscountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiscountServlet() {
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
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		
		 String subject = "Thank you for registering for the promotion";
         String body = "Dear " + email +  "\n\n" +
                       "Thank you for registering for the promotion, we will notify your email if there is a promotion\n\n" +
                       "ANT BICYCLE";

         EmailUtil.sendEmail(email, subject, body);
         
         request.getSession().setAttribute("message", "Thank you for register:" + email + "!");
         response.sendRedirect("index.jsp"); 
         
	}

}
