package model;

public class Category {
	private String maLoai;
	private String tenLoai;
	private String ghiChu;
	
	
	public Category() {
		super();
	}


	public Category(String maLoai, String tenLoai, String ghiChu) {
		super();
		this.maLoai = maLoai;
		this.tenLoai = tenLoai;
		this.ghiChu = ghiChu;
	}


	public String getMaLoai() {
		return maLoai;
	}


	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}


	public String getTenLoai() {
		return tenLoai;
	}


	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}


	public String getGhiChu() {
		return ghiChu;
	}


	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	
	
	
}
