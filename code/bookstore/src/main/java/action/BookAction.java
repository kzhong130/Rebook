package action;

import service.AppService;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.Book;

public class BookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private String ISBN;
	private String bookName;
	private String author;
	private String publisher;
	private int pageNumber;
	private float price;
	private float doubanRate;
	private int raterNumber;
	private String summary;
	private String image;
	private Timestamp lastUpdateTime;
	private String pubdate;
	
	private AppService appService;
	
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
	
	public float getPrice(){
		return price;
	}
	
	public void setPrice(float price){
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
	
	public void setAppService(AppService appService){
		this.appService = appService;
	}
	
	
	public String searchBook() throws Exception{
		Book book = new Book();
		book = appService.readBookByISBN(ISBN);
		request().setAttribute("book",book);
		return SUCCESS;
	}
	
	public String getAllBooks() throws Exception{
		request().getSession().setAttribute("books", appService.getAllBooks());
		int temp=1;
		request().getSession().setAttribute("page",temp);
		return "all";
	}
	
	public String getBookInfo() throws Exception{
		String ISBN = request().getParameter("ISBN");
		Book book = appService.getBookByISBN(ISBN);
		request().setAttribute("book", book);
		return "test";
	}
	
}
