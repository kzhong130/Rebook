package model;

public class BuyOrderCommentRecord {
	private int ID;
	private int buyID;
	private int commenterID;
	private String commentType;
	private String content;
	
	public BuyOrderCommentRecord(){
		
	}
	
	public BuyOrderCommentRecord(int buyID,int commenterID,String commentType,String content){
		this.buyID = buyID;
		this.commenterID = commenterID;
		this.commentType = commentType;
		this.content = content;
	}
	
	public int getID(){
		return ID;
	}
	
	public void setID(int ID){
		this.ID = ID;
	}
	
	public int getBuyID(){
		return buyID;
	}
	
	public void setBuyID(int buyID){
		this.buyID = buyID;
	}
	
	public int getCommenterID(){
		return commenterID;
	}
	
	public void setCommenterID(int commenterID){
		this.commenterID = commenterID;
	}
	
	public String getCommentType(){
		return commentType;
	}
	
	public void setCommentType(String commentType){
		this.commentType = commentType;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
}
