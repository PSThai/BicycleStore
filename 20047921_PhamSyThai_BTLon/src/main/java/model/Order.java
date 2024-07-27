package model;

import java.util.Date;
import java.util.List;

public class Order {
	private String orderId;
	private String name;
	private String city;
	private String district;
	private String address;
	private String phone;
	private String email;
	private String note;
	private Date orderDate;
	private double totalOrderPrice;
	private String deliveryMethod;
	private String paymentMethod;
	
	private List<Cart> listSP;
	
	public List<Cart> getListSP() {
		return listSP;
	}
	
	
	
	public Order( String name, String city, String district, String address, String phone, String email,
			String note, Date orderDate, double totalOrderPrice, String deliveryMethod, String paymentMethod,
			List<Cart> listSP) {
		super();
		this.name = name;
		this.city = city;
		this.district = district;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.note = note;
		this.orderDate = orderDate;
		this.totalOrderPrice = totalOrderPrice;
		this.deliveryMethod = deliveryMethod;
		this.paymentMethod = paymentMethod;
		this.listSP = listSP;
	}



	public void setListSP(List<Cart> listSP) {
		this.listSP = listSP;
	}
	public Order(String name, String city, String district, String address, String phone, String email,
			String note, Date orderDate, double totalOrderPrice, String deliveryMethod, String paymentMethod) {
		super();
		this.name = name;
		this.city = city;
		this.district = district;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.note = note;
		this.orderDate = orderDate;
		this.totalOrderPrice = totalOrderPrice;
		this.deliveryMethod = deliveryMethod;
		this.paymentMethod = paymentMethod;
	}
	public Order() {
		super();
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String id) {
		this.orderId = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public double getTotalOrderPrice() {
		return totalOrderPrice;
	}
	public void setTotalOrderPrice(double totalOrderPrice) {
		this.totalOrderPrice = totalOrderPrice;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	
	
}
