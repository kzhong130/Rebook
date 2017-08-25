package model;

import java.sql.Timestamp;

public class Book {

	private String ISBN;
	private String bookName;
	private String author;
	private String publisher;
	private int pageNumber;
	private String price;
	private float doubanRate;
	private int raterNumber;
	private String summary;
	private String image;
	private Timestamp lastUpdateTime;
	private String pubdate;
	private String recommend1;
	private String recommend2;
	private String recommend3;
	
	public Book(){
		
	}
	
	public Book(String ISBN, String bookName,String author,String publisher, int pageNumber, String price, float doubanRate, int raterNumber, String summary, String image, Timestamp lastUpdateTime,String pubdate){
		this.ISBN = ISBN;
		this.bookName = bookName;
		this.author = author;
		this.publisher = publisher;
		this.pageNumber = pageNumber;
		this.price = price;
		this.doubanRate = doubanRate;
		this.raterNumber = raterNumber;
		this.summary = summary;
		this.image = image;
		this.lastUpdateTime = lastUpdateTime;
		this.pubdate = pubdate;
	}
	
	public String getISBN(){
		return ISBN;
	}
	
	public void setISBN(String ISBN){
		this.ISBN = ISBN;
	}
	
	public String getBookName(){
		return bookName;
	}
	
	public void setBookName(String bookName){
		this.bookName = bookName;
	}
	
	public String getAuthor(){
		return author;
	}
	
	public void setAuthor(String author){
		this.author = author;
	}
	
	public String getPublisher(){
		return publisher;
	}
	
	public void setPublisher(String publisher){
		this.publisher = publisher;
	}
	
	public int getPageNumber(){
		return pageNumber;
	}
	
	public void setPageNumber(int pageNumber){
		this.pageNumber = pageNumber;
	}
	
	public String getPrice(){
		return price;
	}
	
	public void setPrice(String price){
		this.price = price;
	}
	
	public float getDoubanRate(){
		return doubanRate;
	}
	
	public void setDoubanRate(float doubanRate){
		this.doubanRate = doubanRate;
	}
	
	public int getRaterNumber(){
		return raterNumber;
	}
	
	public void setRaterNumber(int raterNumber){
		this.raterNumber = raterNumber;
	}
	
	public String getSummary(){
		return summary;
	}
	
	public void setSummary(String summary){
		this.summary = summary;
	}
	
	public String getImage(){
		return image;
	}
	
	public void setImage(String image){
		this.image = image;
	}
	
	public Timestamp getLastUpdateTime(){
		return lastUpdateTime;
	}
	
	public void setLastUpdateTime(Timestamp lastUpdateTime){
		this.lastUpdateTime = lastUpdateTime;
	}
	
	public String getPubdate(){
		return pubdate;
	}
	
	public void setPubdate(String pubdate){
		this.pubdate = pubdate;
	}
	
	public String getRecommend1(){
		return recommend1;
	}
	
	public void setRecommend1(String recommend1){
		this.recommend1 = recommend1;
	}
	
	public String getRecommend2(){
		return recommend2;
	}
	
	public void setRecommend2(String recommend2){
		this.recommend2 = recommend2;
	}
	
	public String getRecommend3(){
		return recommend3;
	}
	
	public void setRecommend3(String recommend3){
		this.recommend3 = recommend3;
	}
}
