package dao;

import org.bson.Document;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import static com.mongodb.client.model.Filters.eq;

import java.util.ArrayList;
import java.util.List;

import connectDB.ConnectDB;
import model.User;

public class UserDAO {

	private MongoDatabase database;

	public UserDAO() {
		this.database = ConnectDB.getDatabase();
	}

	public User login(String email, String password) {
		MongoCollection<Document> usersCollection = database.getCollection("Users");
		Document userDoc = usersCollection
				.find(Filters.and(Filters.eq("email", email), Filters.eq("password", password))).first();

		if (userDoc != null) {
			return new User(userDoc.getString("id"), userDoc.getString("fName"), userDoc.getString("lName"),
					userDoc.getString("role"), userDoc.getString("email"), userDoc.getString("password"));
		}
		return null;
	}

	public boolean register(String fName, String lName, String email, String password, String role) {
		MongoCollection<Document> collection = database.getCollection("Users");
		Document existingUser = collection.find(eq("email", email)).first();

		if (existingUser != null) {
			return false; // Email already exists
		}

		// Set default role if none is provided
		if (role == null || role.isEmpty()) {
			role = "USER";
		}

		Document newUser = new Document("fName", fName).append("lName", lName).append("email", email)
				.append("password", password).append("role", role);

		collection.insertOne(newUser);
		return true;
	}

	public List<User> getAllUsersWithRole(String role) {
		List<User> userList = new ArrayList<>();
		MongoCollection<Document> usersCollection = database.getCollection("Users");
		MongoCursor<Document> cursor = usersCollection.find(eq("role", role)).iterator();

		try {
			while (cursor.hasNext()) {
				Document userDoc = cursor.next();
				userList.add(new User(userDoc.getString("id"), userDoc.getString("fName"), userDoc.getString("lName"),
						userDoc.getString("role"), userDoc.getString("email"), userDoc.getString("password")));
			}
		} finally {
			cursor.close();
		}
		return userList;
	}

	public boolean updateUser(String email, String fName, String lName, String password, String role) {
		MongoCollection<Document> usersCollection = database.getCollection("Users");

		Document query = new Document("email", email);
		Document updateFields = new Document();

		if (fName != null)
			updateFields.append("fName", fName);
		if (lName != null)
			updateFields.append("lName", lName);
		if (password != null)
			updateFields.append("password", password);
		if (role != null)
			updateFields.append("role", role);

		Document updateOperation = new Document("$set", updateFields);

		var result = usersCollection.updateOne(query, updateOperation);

		return result.getModifiedCount() > 0;
	}

	public boolean deleteUser(String email) {
		MongoCollection<Document> collection = database.getCollection("Users");
		var result = collection.deleteOne(eq("email", email));
		return result.getDeletedCount() > 0;
	}
}
