package action;

import service.AppService;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.Book;
import model.BookComment;

public class BookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
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
		List<Book> books = appService.getAllBooks();
		String bookISBNs = new String();
		String bookAuthors = new String();
		String bookImages = new String();
		String bookNames = new String();
		for (int i = 0; i < books.size(); i++){
			if (i == 0) {
				bookISBNs += books.get(i).getISBN();
				bookAuthors += books.get(i).getAuthor();
				bookImages += books.get(i).getImage();
				bookNames += books.get(i).getBookName();
			}
			else {
				bookISBNs = bookISBNs + '$' + books.get(i).getISBN();
				bookAuthors = bookAuthors + '$' + books.get(i).getAuthor();
				bookImages = bookImages + '$' + books.get(i).getImage();
				bookNames = bookNames +'$' + books.get(i).getBookName();
			}
		}
		request().getSession().setAttribute("bookISBNs", bookISBNs);
		request().getSession().setAttribute("bookAuthors", bookAuthors);
		request().getSession().setAttribute("bookImages", bookImages);
		request().getSession().setAttribute("bookNames", bookNames);
		return "all";
	}
	
	public String getBookInfo() throws Exception{
		String ISBN = request().getParameter("ISBN");
		Book book = appService.getBookByISBN(ISBN);
		request().getSession().setAttribute("book", book);
		List<BookComment> bookComments = appService.getBookCommentsByISBN(ISBN);
		
		request().getSession().setAttribute("bookComment",bookComments);
		return "bookInfo";
	}
	
	public String frontPageSearch(){
		List<Book> books = appService.searchBookByName(bookName);
		request().getSession().setAttribute("books", books);
		String bookISBNs = new String();
		String bookAuthors = new String();
		String bookImages = new String();
		String bookNames = new String();
		for (int i = 0; i < books.size(); i++){
			if (i == 0) {
				bookISBNs += books.get(i).getISBN();
				bookAuthors += books.get(i).getAuthor();
				bookImages += books.get(i).getImage();
				bookNames += books.get(i).getBookName();
			}
			else {
				bookISBNs = bookISBNs + '$' + books.get(i).getISBN();
				bookAuthors = bookAuthors + '$' + books.get(i).getAuthor();
				bookImages = bookImages + '$' + books.get(i).getImage();
				bookNames = bookNames +'$' + books.get(i).getBookName();
			}
		}
		request().getSession().setAttribute("searchBookISBNs", bookISBNs);
		request().getSession().setAttribute("searchBookAuthors", bookAuthors);
		request().getSession().setAttribute("searchBookImages", bookImages);
		request().getSession().setAttribute("searchBookNames", bookNames);
		return "bookSearch";
	}
	
}
