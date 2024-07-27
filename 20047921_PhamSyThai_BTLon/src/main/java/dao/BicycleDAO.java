package dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Sorts;

import connectDB.ConnectDB;
import model.Bicycle;
import java.util.stream.Collectors;
public class BicycleDAO {
	private MongoDatabase database;

	public BicycleDAO() {

		this.database = ConnectDB.getDatabase();
	}

	// Hàm thêm sản phẩm
	public void addBicycle(Bicycle bicycle) {
	    MongoCollection<Document> collection = database.getCollection("Bicycles");
	    
	    // Kiểm tra xem mã sản phẩm đã tồn tại chưa
	    Document query = new Document("maSP", bicycle.getMaSP());
	    Document existingBicycle = collection.find(query).first();
	    
	    if (existingBicycle != null) {
	        throw new IllegalArgumentException("Mã sản phẩm đã tồn tại.");
	    }
	    
	    // Nếu không tồn tại, thêm sản phẩm mới
	    Document doc = new Document("maSP", bicycle.getMaSP())
	            .append("tenSP", bicycle.getTenSP())
	            .append("imgURL", bicycle.getImgURL())
	            .append("soLuong", bicycle.getSoLuong())
	            .append("gia", bicycle.getGia())
	            .append("thuongHieu", bicycle.getThuongHieu())
	            .append("thongSo", bicycle.getThongSo())
	            .append("tenLoai", bicycle.getTenLoai());

	    collection.insertOne(doc);
	}


	// Hàm lấy danh sách sản phẩm từ CSDL và chuyển đổi thành đối tượng Bicycle
	public List<Bicycle> getProductsFromDatabase() {
		MongoCollection<Document> collection = database.getCollection("Bicycles");
		List<Bicycle> productList = new ArrayList<>();
		FindIterable<Document> iterDoc = collection.find();

		for (Document doc : iterDoc) {
			String maSP = doc.getString("maSP");
			String tenSP = doc.getString("tenSP");
			Double gia = doc.getDouble("gia");
			int soLuong = doc.getInteger("soLuong");
			String imgURL = doc.getString("imgURL");
			String thuongHieu = doc.getString("thuongHieu");
			String thongSo = doc.getString("thongSo");
			String tenLoai = doc.getString("tenLoai");

			Bicycle bicycle = new Bicycle(maSP, imgURL, tenSP, gia, soLuong, thuongHieu, thongSo, tenLoai);
			productList.add(bicycle);
		}

		return productList;
	}

	public Bicycle getBicycleById(String maSP) {

		MongoCollection<Document> collection = database.getCollection("Bicycles");
		Document query = new Document("maSP", maSP);
		Document bicycleDoc = collection.find(query).first();

		if (bicycleDoc != null) {
			Bicycle bicycle = new Bicycle();
			bicycle.setMaSP(bicycleDoc.getString("maSP"));
			bicycle.setImgURL(bicycleDoc.getString("imgURL"));
			bicycle.setTenSP(bicycleDoc.getString("tenSP"));
			bicycle.setGia(bicycleDoc.getDouble("gia"));
			bicycle.setSoLuong(bicycleDoc.getInteger("soLuong"));
			bicycle.setThuongHieu(bicycleDoc.getString("thuongHieu"));
			bicycle.setTenLoai(bicycleDoc.getString("tenLoai"));
			bicycle.setThongSo(bicycleDoc.getString("thongSo"));
			bicycle.setGiaString(bicycleDoc.getString("giaString"));
			return bicycle;
		}
		return null;
	}

	public List<Bicycle> getBicycleByTenLoai(String tenLoai) {
		MongoCollection<Document> collection = database.getCollection("Bicycles");
		List<Bicycle> bicyclesByTenLoai = new ArrayList<>();

		Document query = new Document("tenLoai", tenLoai);
		FindIterable<Document> iterDoc = collection.find(query);

		for (Document doc : iterDoc) {
			String maSP = doc.getString("maSP");
			String tenSP = doc.getString("tenSP");
			Double gia = doc.getDouble("gia");
			int soLuong = doc.getInteger("soLuong");
			String imgURL = doc.getString("imgURL");
			String thuongHieu = doc.getString("thuongHieu");
			String thongSo = doc.getString("thongSo");
			String category = doc.getString("tenLoai");

			Bicycle bicycle = new Bicycle(maSP, imgURL, tenSP, gia, soLuong, thuongHieu, thongSo, category);
			bicyclesByTenLoai.add(bicycle);
		}

		return bicyclesByTenLoai;
	}
	public List<Bicycle> getBicycleByThuongHieu(String tHieu) {
		MongoCollection<Document> collection = database.getCollection("Bicycles");
		List<Bicycle> bicyclesByThuongHieu = new ArrayList<>();

		Document query = new Document("thuongHieu", tHieu);
		FindIterable<Document> iterDoc = collection.find(query);

		for (Document doc : iterDoc) {
			String maSP = doc.getString("maSP");
			String tenSP = doc.getString("tenSP");
			Double gia = doc.getDouble("gia");
			int soLuong = doc.getInteger("soLuong");
			String imgURL = doc.getString("imgURL");
			String thuongHieu = doc.getString("thuongHieu");
			String thongSo = doc.getString("thongSo");
			String category = doc.getString("tenLoai");

			Bicycle bicycle = new Bicycle(maSP, imgURL, tenSP, gia, soLuong, thuongHieu, thongSo, category);
			bicyclesByThuongHieu.add(bicycle);
		}

		return bicyclesByThuongHieu;
	}
	 public List<Bicycle> getBicyclesByBrandAndCategory(String brand, String category) {
	        return getProductsFromDatabase().stream()
	                .filter(bicycle -> brand.equals(bicycle.getThuongHieu()) && category.equals(bicycle.getTenLoai()))
	                .collect(Collectors.toList());
	    }
	 
	public void deleteBicycle(String maSP) {
        MongoCollection<Document> collection = database.getCollection("Bicycles");
        Document query = new Document("maSP", maSP);
        collection.deleteOne(query);
    }
	
	// Hàm cập nhật thông tin sản phẩm
	public void updateBicycle(Bicycle bicycle) {
	    MongoCollection<Document> collection = database.getCollection("Bicycles");
	    Document query = new Document("maSP", bicycle.getMaSP());

	    Document updatedData = new Document("tenSP", bicycle.getTenSP())
	            .append("imgURL", bicycle.getImgURL())
	            .append("soLuong", bicycle.getSoLuong())
	            .append("gia", bicycle.getGia())
	            .append("thuongHieu", bicycle.getThuongHieu())
	            .append("thongSo", bicycle.getThongSo())
	            .append("tenLoai", bicycle.getTenLoai());

	    Document update = new Document("$set", updatedData);
	    collection.updateOne(query, update);
	}
	 // Hàm sắp xếp theo giá từ cao xuống thấp
    public List<Bicycle> getBicyclesSortedByPriceDesc() {
        MongoCollection<Document> collection = database.getCollection("Bicycles");
        List<Bicycle> sortedBicycles = new ArrayList<>();
        
        // Sắp xếp theo giá từ cao xuống thấp
        FindIterable<Document> iterDoc = collection.find().sort(Sorts.descending("gia"));
        
        for (Document doc : iterDoc) {
            String maSP = doc.getString("maSP");
            String tenSP = doc.getString("tenSP");
            Double gia = doc.getDouble("gia");
            int soLuong = doc.getInteger("soLuong");
            String imgURL = doc.getString("imgURL");
            String thuongHieu = doc.getString("thuongHieu");
            String thongSo = doc.getString("thongSo");
            String tenLoai = doc.getString("tenLoai");

            Bicycle bicycle = new Bicycle(maSP, imgURL, tenSP, gia, soLuong, thuongHieu, thongSo, tenLoai);
            sortedBicycles.add(bicycle);
        }

        return sortedBicycles;
    }

    // Hàm sắp xếp theo giá từ thấp lên cao
    public List<Bicycle> getBicyclesSortedByPriceAsc() {
        MongoCollection<Document> collection = database.getCollection("Bicycles");
        List<Bicycle> sortedBicycles = new ArrayList<>();
        
        // Sắp xếp theo giá từ thấp lên cao
        FindIterable<Document> iterDoc = collection.find().sort(Sorts.ascending("gia"));
        
        for (Document doc : iterDoc) {
            String maSP = doc.getString("maSP");
            String tenSP = doc.getString("tenSP");
            Double gia = doc.getDouble("gia");
            int soLuong = doc.getInteger("soLuong");
            String imgURL = doc.getString("imgURL");
            String thuongHieu = doc.getString("thuongHieu");
            String thongSo = doc.getString("thongSo");
            String tenLoai = doc.getString("tenLoai");

            Bicycle bicycle = new Bicycle(maSP, imgURL, tenSP, gia, soLuong, thuongHieu, thongSo, tenLoai);
            sortedBicycles.add(bicycle);
        }

        return sortedBicycles;
    }
}
