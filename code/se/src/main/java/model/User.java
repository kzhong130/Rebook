package model;

public class User {
	
	private int id;
	private String username;
	private String password;
	private String truename;
	private String phone;
	private String email;
	private String address;
	private String role;
	
	public User(){
		
	}
	
	public User(String username, String password, String truename, String phone, String email, String address, String role){
		this.username = username;
		this.password = password;
		this.truename = truename;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.role = role;
	}
	
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getTruename(){
		return truename;
	}
	
	public void setTruename(String truename){
		this.truename = truename;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getAddress(){
		return address;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public String getRole(){
		return role;
	}
	
	public void setRole(String role){
		this.role = role;
	}

}
