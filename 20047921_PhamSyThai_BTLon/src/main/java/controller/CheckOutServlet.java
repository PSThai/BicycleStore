package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import util.EmailUtil;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import dao.OrderDAO;

/**
 * Servlet implementation class CheckOutServlet
 */
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
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

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Retrieve form data
	        String name = request.getParameter("name");
	        String city = request.getParameter("city");
	        String district = request.getParameter("district");
	        String address = request.getParameter("address");
	        String phone = request.getParameter("phone");
	        String email = request.getParameter("email");
	        String note = request.getParameter("note");
	        String deliveryMethod = request.getParameter("delivery");
	        String paymentMethod = request.getParameter("payment");

	        // Retrieve total order price from session
	    
	        HttpSession session = request.getSession();
	        
	        List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
	        
	     
	        
	        double totalOrderPrice = (double) session.getAttribute("totalOrderPrice");

	        // Create Order object
	        Order order = new Order(name, city, district, address, phone, email, note, new Date(), totalOrderPrice, deliveryMethod, paymentMethod, cartList);
	        
	        // Save order to MongoDB
	        OrderDAO orderDAO = new OrderDAO();
	        orderDAO.createOrder(order);
	        // Send registration success email
            String subject = "Payment Successful";
            String body = "Dear " + name + "\n\n" +
                          "Thank you for payment.\n\n" +
                          "OrderID:" +order.getOrderId() + 
                          "\nAddress: " + address + " " +  district + " " + " " + city +
                          "\nWith the payment amount" + totalOrderPrice +
                          "\nPlease check your information again.\n"+
                          "Best Regards,\n" +
                          "ANT BICYCLE";

            EmailUtil.sendEmail(email, subject, body);
            
	        session.removeAttribute("cartList");
	        session.removeAttribute("countItem");
	        request.getSession().setAttribute("message", "Payment successful" + "!");
	        // Redirect to a confirmation page or another page as needed
	        response.sendRedirect("index.jsp");
	    }

}
