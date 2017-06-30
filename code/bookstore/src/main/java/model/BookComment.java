package model;

import java.sql.Timestamp;

public class BookComment {
	private int ID;
	private String ISBN;
	private int userID;
	private Timestamp commentTime;
	private String content;
	private String checkResult;
	
	public BookComment(){
		
	}
	
	public BookComment(String ISBN, int userID, Timestamp commentTime, String content, String checkResult){
		this.ISBN = ISBN;
		this.userID = userID;
		this.commentTime = commentTime;
		this.content = content;
		this.checkResult = checkResult;
	}
	
	public int getID(){
		return ID;
	}
	
	public void setID(int ID){
		this.ID = ID;
	}
	
	public String getISBN(){
		return ISBN;
	}
	
	public void setISBN(String ISBN){
		this.ISBN = ISBN;
	}
	
	public int getUserID(){
		return userID;
	}
	
	public void setUserID(int userID){
		this.userID = userID;
	}
	
	public Timestamp getCommentTime(){
		return commentTime;
	}
	
	public void setCommentTime(Timestamp commentTime){
		this.commentTime = commentTime;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public String getCheckResult(){
		return checkResult;
	}
	
	public void setCheckResult(String checkResult){
		this.checkResult = checkResult;
	}
}
