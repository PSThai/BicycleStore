package model;

import java.util.List;

public class Cart {
	
	private String maSP;
	private String imgURL;
	private String tenSP;
	private double gia;
	private int soLuong;
	private double tongTien;
	private String giaString;
	private String tongTienString;
		


	public String getTongTienString() {
		return tongTienString;
	}

	public void setTongTienString(String tongTienString) {
		this.tongTienString = tongTienString;
	}

	public String getGiaString() {
		return giaString;
	}

	public void setGiaString(String giaString) {
		this.giaString = giaString;
	}

	public Cart() {
		super();
	}
	

	
	public Cart(String maSP, String imgURL, String tenSP, double gia, int soLuong, double tongTien, String giaString, String tongTienString) {
		super();
		this.maSP = maSP;
		this.imgURL = imgURL;
		this.tenSP = tenSP;
		this.gia = gia;
		this.soLuong = soLuong;
		this.tongTien = tongTien;
		this.giaString = giaString;
		this.tongTienString = tongTienString;
	}

	public Cart(String maSP, String imgURL, String tenSP, double gia, int soLuong, double tongTien, String giaString) {
		super();
		this.maSP = maSP;
		this.imgURL = imgURL;
		this.tenSP = tenSP;
		this.gia = gia;
		this.soLuong = soLuong;
		this.tongTien = tongTien;
		this.giaString = giaString;
	}

	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}

	public String getImgURL() {
		return imgURL;
	}

	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public double getGia() {
		return gia;
	}

	public void setGia(double gia) {
		this.gia = gia;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public double getTongTien() {
		return tongTien;
	}

	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}
	
	
}
