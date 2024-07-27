package dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.DeleteResult;

import connectDB.ConnectDB;
import model.Category;

public class CategoryDAO {
	private MongoDatabase database;

	public CategoryDAO() {
		database = ConnectDB.getDatabase();
	}

	public List<Category> getAllCategories() {
		List<Category> categories = new ArrayList<>();
		MongoCollection<Document> collection = database.getCollection("Categories");
		MongoCursor<Document> cursor = collection.find().iterator();

		try {
			while (cursor.hasNext()) {
				Document doc = cursor.next();
				Category category = new Category(
						doc.getString("maLoai"), 
						doc.getString("tenLoai"), 
						doc.getString("ghiChu"));
				categories.add(category);
			}
		} finally {
			cursor.close();
		}

		return categories;
	}

	public void addCategory(Category category) {
		MongoCollection<Document> collection = database.getCollection("Categories");
		Document doc = new Document("maLoai", category.getMaLoai())
						.append("tenLoai", category.getTenLoai())
						.append("ghiChu", category.getGhiChu());
		collection.insertOne(doc);
	}

	public boolean deleteCategory(String maLoai) {
		MongoCollection<Document> collection = database.getCollection("Categories");
		Document query = new Document("maLoai", maLoai);
		DeleteResult result = collection.deleteOne(query);
		return result.getDeletedCount() > 0;
	}
	// Hàm cập nhật thông tin loại sản phẩm
	public void updateCategory(Category category) {
	    MongoCollection<Document> collection = database.getCollection("Categories");
	    Document query = new Document("maLoai", category.getMaLoai());

	    Document updatedData = new Document("tenLoai", category.getTenLoai())
	            .append("ghiChu", category.getGhiChu());

	    Document update = new Document("$set", updatedData);
	    collection.updateOne(query, update);
	}
}