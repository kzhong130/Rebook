package model;

public class Admin {
	private int adminID;
	private String password;
	private String realName;
	private String sex;
	private String phone;
	private String email;
	private String address;
	
	public Admin(){
		
	}
	
	public Admin(String password, String realName, String sex, String phone, String email, String address){
		this.password = password;
		this.realName = realName;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	
	public int getAdminID(){
		return adminID;
	}
	
	public void setAdminID(int adminID){
		this.adminID = adminID;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getRealName(){
		return realName;
	}
	
	public void setRealName(String realName){
		this.realName = realName;
	}
	
	public String getSex(){
		return sex;
	}
	
	public void setSex(String sex){
		this.sex = sex;
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
}
