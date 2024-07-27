package model;

public class Bicycle {
	
	private String maSP;
	private String imgURL;
	private String tenSP;
	private Double gia;
	private int soLuong;
	private String thuongHieu;
	private String thongSo;
	private String giaString; 
	private String tenLoai;
	
	
	
	public Bicycle(String maSP, String imgURL, String tenSP, Double gia, int soLuong, String thuongHieu,
			String thongSo, String tenLoai) {
		super();
		this.maSP = maSP;
		this.imgURL = imgURL;
		this.tenSP = tenSP;
		this.gia = gia;
		this.soLuong = soLuong;
		this.thuongHieu = thuongHieu;
		this.thongSo = thongSo;
		this.tenLoai = tenLoai;
	}

	public Bicycle(String maSP, String imgURL, String tenSP, Double gia, int soLuong, String thuongHieu,
			String thongSo, String giaString, String tenLoai) {
		super();
		this.maSP = maSP;
		this.imgURL = imgURL;
		this.tenSP = tenSP;
		this.gia = gia;
		this.soLuong = soLuong;
		this.thuongHieu = thuongHieu;
		this.thongSo = thongSo;
		this.giaString = giaString;
		this.tenLoai = tenLoai;
	}

	public String getTenLoai() {
		return tenLoai;
	}

	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public String getImgURL() {
		return imgURL;
	}

	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}

	public String getGiaString() {
		return giaString;
	}

	public void setGiaString(String giaString) {
		this.giaString = giaString;
	}

	public Bicycle() {
		super();
	}

	public Bicycle(String maSP, String tenSP, Double gia, String thuongHieu, String thongSo) {
		super();
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.gia = gia;
		this.thuongHieu = thuongHieu;
		this.thongSo = thongSo;
	}

	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public Double getGia() {
		return gia;
	}

	public void setGia(Double gia) {
		this.gia = gia;
	}

	public String getThuongHieu() {
		return thuongHieu;
	}

	public void setThuongHieu(String thuongHieu) {
		this.thuongHieu = thuongHieu;
	}


	public String getThongSo() {
		return thongSo;
	}

	public void setThongSo(String thongSo) {
		this.thongSo = thongSo;
	}

}
