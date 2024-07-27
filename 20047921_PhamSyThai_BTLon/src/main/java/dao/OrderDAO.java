package dao;

import org.bson.Document;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import static com.mongodb.client.model.Updates.inc;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import connectDB.ConnectDB;
import model.Cart;
import model.Order;

public class OrderDAO {

	private MongoDatabase database;

	public OrderDAO() {
		this.database = ConnectDB.getDatabase();
	}

	private String getNextOrderId() {
		MongoCollection<Document> counterCollection = database.getCollection("Counters");
		Document counter = counterCollection.findOneAndUpdate(Filters.eq("_id", "orderId"), inc("sequence_value", 1));

		if (counter == null) {
			counterCollection.insertOne(new Document("_id", "orderId").append("sequence_value", 1));
			return "HD001";
		}

		int sequenceValue = counter.getInteger("sequence_value") + 1;
		return String.format("HD%03d", sequenceValue);
	}
	
	public void createOrder(Order order) {
		String orderId = getNextOrderId();
		order.setOrderId(orderId);

		MongoCollection<Document> orderCollection = database.getCollection("Orders");
		Document doc = new Document("orderId", order.getOrderId()).append("name", order.getName())
				.append("city", order.getCity()).append("district", order.getDistrict())
				.append("address", order.getAddress()).append("phone", order.getPhone())
				.append("email", order.getEmail()).append("note", order.getNote())
				.append("orderDate", order.getOrderDate()).append("totalOrderPrice", order.getTotalOrderPrice())
				.append("deliveryMethod", order.getDeliveryMethod()).append("paymentMethod", order.getPaymentMethod());

		// Add list of cart items
		List<Cart> cartList = order.getListSP();
		if (cartList != null) {
			// Convert list of cart items to Documents
			List<Document> cartDocs = cartList.stream()
					.map(cart -> new Document("maSP", cart.getMaSP()).append("imgURL", cart.getImgURL())
							.append("tenSP", cart.getTenSP()).append("gia", cart.getGia())
							.append("soLuong", cart.getSoLuong()).append("tongTien", cart.getTongTien()))
					.toList();
			doc.append("cartItems", cartDocs);
		}

		orderCollection.insertOne(doc);
	}

	// Get all orders
	public List<Order> getAllOrders() {
		List<Order> orders = new ArrayList<>();
		MongoCollection<Document> orderCollection = database.getCollection("Orders");

		MongoCursor<Document> cursor = orderCollection.find().iterator();
		try {
			while (cursor.hasNext()) {
				Document doc = cursor.next();
				Order order = new Order();
				order.setOrderId(doc.getString("orderId"));
				order.setName(doc.getString("name"));
				order.setCity(doc.getString("city"));
				order.setDistrict(doc.getString("district"));
				order.setAddress(doc.getString("address"));
				order.setPhone(doc.getString("phone"));
				order.setEmail(doc.getString("email"));
				order.setNote(doc.getString("note"));
				order.setOrderDate(doc.getDate("orderDate"));
				order.setTotalOrderPrice(doc.getDouble("totalOrderPrice"));
				order.setDeliveryMethod(doc.getString("deliveryMethod"));
				order.setPaymentMethod(doc.getString("paymentMethod"));

				// Retrieve cart items
				List<Document> cartDocs = (List<Document>) doc.get("cartItems");
				if (cartDocs != null) {
					List<Cart> cartList = new ArrayList<>();
					for (Document cartDoc : cartDocs) {
						Cart cart = new Cart();
						cart.setMaSP(cartDoc.getString("maSP"));
						cart.setImgURL(cartDoc.getString("imgURL"));
						cart.setTenSP(cartDoc.getString("tenSP"));
						cart.setGia(cartDoc.getDouble("gia"));
						cart.setSoLuong(cartDoc.getInteger("soLuong"));
						cart.setTongTien(cartDoc.getDouble("tongTien"));
						cartList.add(cart);
					}
					order.setListSP(cartList);
				}

				orders.add(order);
			}
		} finally {
			cursor.close();
		}

		return orders;
	}

	// Get orders by date range
	public List<Order> getOrdersByDateRange(Date startDate, Date endDate) {
		List<Order> orders = new ArrayList<>();
		MongoCollection<Document> orderCollection = database.getCollection("Orders");

		MongoCursor<Document> cursor = orderCollection
				.find(Filters.and(Filters.gte("orderDate", startDate), Filters.lte("orderDate", endDate))).iterator();

		try {
			while (cursor.hasNext()) {
				Document doc = cursor.next();
				Order order = new Order();
				order.setOrderId(doc.getString("orderId"));
				order.setName(doc.getString("name"));
				order.setCity(doc.getString("city"));
				order.setDistrict(doc.getString("district"));
				order.setAddress(doc.getString("address"));
				order.setPhone(doc.getString("phone"));
				order.setEmail(doc.getString("email"));
				order.setNote(doc.getString("note"));
				order.setOrderDate(doc.getDate("orderDate"));
				order.setTotalOrderPrice(doc.getDouble("totalOrderPrice"));
				order.setDeliveryMethod(doc.getString("deliveryMethod"));
				order.setPaymentMethod(doc.getString("paymentMethod"));

				// Retrieve cart items
				List<Document> cartDocs = (List<Document>) doc.get("cartItems");
				if (cartDocs != null) {
					List<Cart> cartList = new ArrayList<>();
					for (Document cartDoc : cartDocs) {
						Cart cart = new Cart();
						cart.setMaSP(cartDoc.getString("maSP"));
						cart.setImgURL(cartDoc.getString("imgURL"));
						cart.setTenSP(cartDoc.getString("tenSP"));
						cart.setGia(cartDoc.getDouble("gia"));
						cart.setSoLuong(cartDoc.getInteger("soLuong"));
						cart.setTongTien(cartDoc.getDouble("tongTien"));
						cartList.add(cart);
					}
					order.setListSP(cartList);
				}

				orders.add(order);
			}
		} finally {
			cursor.close();
		}

		return orders;
	}
}
