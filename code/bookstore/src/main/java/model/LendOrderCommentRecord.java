package model;

public class LendOrderCommentRecord {
	private int ID;
	private String commentType;
	private int lendID;
	private int commenterID;
	private String content;
	
	public LendOrderCommentRecord(){
		
	}
	
	public LendOrderCommentRecord(String commentType,int lendID,int commenterID,String content){
		this.commentType = commentType;
		this.lendID = lendID;
		this.commenterID = commenterID;
		this.content = content;
	}
	
	public int getID(){
		return ID;
	}
	
	public void setID(int ID){
		this.ID = ID;
	}
	
	public String getCommentType(){
		return commentType;
	}
	
	public void setCommentType(String commentType){
		this.commentType = commentType;
	}
	
	public int getLendID(){
		return lendID;
	}
	
	public void setLendID(int lendID){
		this.lendID = lendID;
	}
	
	public int getCommenterID(){
		return commenterID;
	}
	
	public void setCommenterID(int commenterID){
		this.commenterID = commenterID;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
}
