package model;

import java.sql.Timestamp;


public class User {
	
	private int userID;
	private String userName;
	private String password;
	private String realName;
	private String sex;
	private String phone;
	private String email;
	private String address;
	private Timestamp registerDate;
	private String validationProblem;
	private String validationAnswer;
	private int credit;
	private int bookCoin;
	
	public User(){
		
	}
	
	public User(String userName,String password,String realName,String sex,String phone,String email,String address,Timestamp registerDate,String validationProblem,String validationAnswer,int credit,int bookCoin){
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.registerDate = registerDate;
		this.validationProblem = validationProblem;
		this.validationAnswer = validationAnswer;
		this.credit = credit;
		this.bookCoin = bookCoin;
	}
	
	public int getUserID(){
		return userID;
	}
	
	public void setUserID(int userID){
		this.userID = userID;
	}
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
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
	
	public Timestamp getRegisterDate(){
		return registerDate;
	}
	
	public void setRegisterDate(Timestamp registerDate){
		this.registerDate = registerDate;
	}
	
	public String getValidationProblem(){
		return validationProblem;
	}
	
	public void setValidationProblem(String validationProblem){
		this.validationProblem = validationProblem;
	}
	
	public String getValidationAnswer(){
		return validationAnswer;
	}
	
	public void setValidationAnswer(String validationAnswer){
		this.validationAnswer = validationAnswer;
	}
	
	public int getCredit(){
		return credit;
	}
	
	public void setCredit(int credit){
		this.credit = credit;
	}
	
	public int getBookCoin(){
		return bookCoin;
	}
	
	public void setBookCoin(int bookCoin){
		this.bookCoin = bookCoin;
	}
	
}
