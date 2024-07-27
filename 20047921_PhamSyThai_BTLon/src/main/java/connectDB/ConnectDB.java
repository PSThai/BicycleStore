package connectDB;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class ConnectDB {
	private static MongoClient mongoClient;
	private static MongoDatabase database;

	static {
		// Khởi tạo kết nối khi lớp được tải lần đầu
		mongoClient = MongoClients.create("mongodb://localhost:27017");
		database = mongoClient.getDatabase("BicycleShop"); // Thay db
	}

	public static MongoDatabase getDatabase() {
		return database;
	}

	 public static void close() {
	        if (mongoClient != null) {
	            mongoClient.close();
	        }
	    }
}
