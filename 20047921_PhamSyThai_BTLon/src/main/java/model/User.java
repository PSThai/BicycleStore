package model;

public class User {
	
	String id;
	String fName;
	String lName;
	String role;
	String email;
	String password;
	
	
	public User() {
		super();
	}

	public User(String id, String fName, String lName, String role, String email, String password) {
		super();
		this.id = id;
		this.fName = fName;
		this.lName = lName;
		this.role = role;
		this.email = email;
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
