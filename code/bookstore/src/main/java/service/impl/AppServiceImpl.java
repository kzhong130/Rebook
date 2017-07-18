package service.impl;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import service.AppService;
import model.User;
import model.Admin;
import model.Book;
import model.BookComment;
import model.BookIN;
import model.CoinChangeRecord;
import model.CreditChangeRecord;
import model.LendOrder;
import model.RequestBook;
import dao.UserDao;
import dao.AdminDao;
import dao.BookCommentDao;
import dao.BookDao;
import dao.BookINDao;
import dao.CoinChangeRecordDao;
import dao.CreditChangeRecordDao;
import dao.LendOrderDao;
import dao.RequestBookDao;

import org.apache.http.HttpEntity;  
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;  
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import net.sf.json.*;
import net.sf.json.util.JSONTokener;

public class AppServiceImpl implements AppService {
	private UserDao userDao;
	private BookDao bookDao;
	private BookCommentDao bookCommentDao;
	private CreditChangeRecordDao creditChangeRecordDao;
	private CoinChangeRecordDao coinChangeRecordDao;
	private AdminDao adminDao;
	private BookINDao bookINDao;
	private LendOrderDao lendOrderDao;
	private RequestBookDao requestBookDao;
	
	public void setRequestBookDao(RequestBookDao requestBookDao){
		this.requestBookDao=requestBookDao;
	}


	
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	public void setBookDao(BookDao bookDao){
		this.bookDao = bookDao;
	}
	
	public void setBookCommentDao(BookCommentDao bookCommentDao){
		this.bookCommentDao = bookCommentDao;
	}
	
	public void setCreditChangeRecordDao(CreditChangeRecordDao creditChangeRecordDao){
		this.creditChangeRecordDao = creditChangeRecordDao;
	}
	
	public void setCoinChangeRecordDao(CoinChangeRecordDao coinChangeRecordDao){
		this.coinChangeRecordDao = coinChangeRecordDao;
	}
	
	public void setAdminDao(AdminDao adminDao){
		this.adminDao = adminDao;
	}
	
	public void setBookINDao(BookINDao bookINDao){
		this.bookINDao = bookINDao;
	}
	
	public void setLendOrderDao(LendOrderDao lendOrderDao){
		this.lendOrderDao = lendOrderDao;
	}
	
	/*
	 * User
	 */
	public Integer addUser(User user){
		return userDao.save(user);
	}
	
	public void deleteUser(User user){
		userDao.delete(user);;
	}
	
	public void updateUser(User user){
		userDao.update(user);
	}
	
	public User getUserByUserID(int userID){
		return userDao.getUserByUserID(userID);
	}
	
	public List<User> getAllUsers(){
		return userDao.getAllUsers();
	}
	
	public User getUserByUserName(String userName){
		return userDao.getUserByUserName(userName);
	}
	
	public List<User> getUserByBookINs(List<BookIN> bookINs){
		List<User> users = new ArrayList<User>();
		for (int i=0; i<bookINs.size(); i++){
			String userName = bookINs.get(i).getUserName();
			User user = userDao.getUserByUserName(userName);
			if (!users.contains(user)){
				users.add(user);
			}
		}
		return users;
	}
	
	/*
	 * Book
	 */
	public String addBook(Book book){
		return bookDao.save(book);
	}
	
	@SuppressWarnings("deprecation")
	public Book readBookByISBN(String ISBN){
		Book book = new Book();
		ISBN = ISBN.trim();
		book = bookDao.getBookByISBN(ISBN);
		if (book == null){	/*fail to find the book in database*/
			book = new Book();
			String baseUrl = "https://api.douban.com/v2/book/isbn/";
			String url = baseUrl + ISBN;
			CloseableHttpClient httpclient = HttpClients.createDefault();
			HttpGet httpGet = new HttpGet(url);
			JSONObject json = null;
			try{
				CloseableHttpResponse response = httpclient.execute(httpGet);
				/*if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK){*/
					String result = EntityUtils.toString(response.getEntity());
					json = JSONObject.fromObject(result);
					
				/*}*/
			}
			catch (Exception e){
				throw new RuntimeException(e); 
			}
			finally{
				httpclient.getConnectionManager().shutdown();
			}
			
			try{
				String msg = json.getString("msg");
			}
			catch(Exception e){
				/* bookName */
				String bookName = json.getString("title");
				if(bookName == null || bookName.length() <= 0){
					bookName = "Unknown";
				}
			    
				/* Author */
				JSONArray authorArray = json.getJSONArray("author");
				String author = new String();
				for (int i = 0 ; i < authorArray.size(); i++){
					if (i == 0){ 
						author = authorArray.getString(i);
					}
					else{
						
						author = author + "," + authorArray.getString(i);
					}
				}
				
				/* Publisher */
				String publisher = json.getString("publisher");
				if(publisher == null || publisher.length() <= 0){
					publisher = "Unknown";
				}
				
				/* pageNumber */
				int pageNumber = 0;
				System.out.println(json.getString("pages"));
				System.out.println(json.getString("pages").length());
				if(json.getString("pages") == null || json.getString("pages").length() <= 0){
					pageNumber = 0;
				}
				 else{
					 pageNumber = json.getInt("pages");
				 }
				
				/* price */
				/*String pricestr = json.getString("price");
				float price = 0;
				if (pricestr == null || pricestr.length()<=0){
					price = 0;
				}
				else{
					int length = pricestr.length();
					if (pricestr.charAt(0) < '0' || pricestr.charAt(0) > '9'){	/* Format like USD 30*/
						/*int startindex = 0;
						for (int i = 0; i < length; i++){
							if (pricestr.charAt(i) < '0' || pricestr.charAt(i) > '9'){
								continue;
							}
							else{
								startindex = i;
								break;
							}
						}
						price = Float.parseFloat(pricestr.substring(startindex, length));
					}
					else{	/* Format like 30元 */
						/*price = Float.parseFloat(pricestr.substring(0, length-1));
					}
				}*/
				
				String price = json.getString("price");
				
				/* pubdate */
				String pubdate = json.getString("pubdate");
				if (pubdate == null || pubdate.length() <= 0){
					pubdate = "Unknown";
				}
				
				float doubanRate = Float.parseFloat(json.getJSONObject("rating").getString("average"));
				int raterNumber = Integer.parseInt(json.getJSONObject("rating").getString("numRaters"));
				String summary = json.getString("summary");
				String image = json.getString("image");

				
				book = new Book();
				book.setAuthor(author);
				book.setBookName(bookName);
				book.setDoubanRate(doubanRate);
				book.setImage(image);
				book.setISBN(ISBN);
				book.setPageNumber(pageNumber);
				book.setPrice(price);
				book.setPublisher(publisher);
				book.setRaterNumber(raterNumber);
				book.setSummary(summary);
				book.setPubdate(pubdate);
				bookDao.save(book);
				return book;
			}
			book = new Book();
			return book;
		}
		return book;
			
			
	}

	@Override
	public ArrayList<Book> getAllBooks() {
		return (ArrayList<Book>)bookDao.getAllBooks();
	}
	
	public Book getBookByISBN(String ISBN){
		return bookDao.getBookByISBN(ISBN);
	}

	public List<Book> searchBookByName(String bookName){
		return bookDao.searchBookByName(bookName);
	}
	
	public List<Book> getBookByBookComment(List<BookComment> bookComments){
		List<String> searchedISBN = new ArrayList<String>();
		String ISBN = new String();
		Book book = new Book();
		List<Book> books = new ArrayList<Book>();
		for (int i=0; i<bookComments.size(); i++){
			ISBN = bookComments.get(i).getISBN();
			if (!searchedISBN.contains(ISBN)){
				searchedISBN.add(ISBN);
				book = bookDao.getBookByISBN(ISBN);
				books.add(book);
			}
		}
		return books;
	}

	public void updateBook(Book book){
		bookDao.update(book);
	}
	
	
	/*
	 * BookComment
	 */
	public Integer addBookComment(BookComment bookComment){
		return bookCommentDao.save(bookComment);
	}
	
	public List<BookComment> getBookCommentsByISBN(String ISBN){
		return bookCommentDao.getBookCommentsByISBN(ISBN);
	}
	
	public List<BookComment> getBookCommentsByUserName(String userName){
		return bookCommentDao.getBookCommentsByUserName(userName);
	}
	
	public void deleteBookCommentByID(int ID){
		bookCommentDao.delete(bookCommentDao.getBookCommentByID(ID));
	}
	
	public List<BookComment> getAllBookComments(){
		return bookCommentDao.getAllBookComments();
	}
	
	public BookComment getBookCommentByID(int ID){
		return bookCommentDao.getBookCommentByID(ID);
	}
	
	public void updateBookComment(BookComment bookComment){
		bookCommentDao.update(bookComment);
	}
	
	
	/*
	 * CreditChangeRecord
	 */
	public List<CreditChangeRecord> getCreditChangeRecordByUserName(String userName){
		return creditChangeRecordDao.getCreditChangeRecordByUserName(userName);
	}
	
	public Integer addCreditChangeRecord(CreditChangeRecord creditChangeRecord){
		return creditChangeRecordDao.save(creditChangeRecord);
	}
	
	/*
	 * CoinChangeRecord
	 */
	public List<CoinChangeRecord> getCoinChangeRecordByUserName(String userName){
		return coinChangeRecordDao.getCoinChangeRecordByUserName(userName);
	}
	
	public Integer addCoinChangeRecord(CoinChangeRecord coinChangeRecord){
		return coinChangeRecordDao.save(coinChangeRecord);
	}
	
	/*
	 * Admin
	 */
	public Admin getAdminByAdminName(String adminName){
		return adminDao.getAdminByAdminName(adminName);
	}
	
	/*
	 * BookIN
	 */
	public List<BookIN> getAllBookINs(){
		return bookINDao.getAllBookINs();
	}
	@Override
	public Integer addBookIN(BookIN bookIN) {
		return bookINDao.save(bookIN);
  }
	
	public BookIN getBookINByBookRecordID(int bookRecordID){
		return bookINDao.getBookINByBookRecordID(bookRecordID);
	}
	
	public void updateBookIN(BookIN bookIN){
		bookINDao.update(bookIN);
	}
	
	public List<BookIN> getBookINByISBN(String ISBN){
		return bookINDao.getBookINsByISBN(ISBN);
	}
	
	/*
	 * LendOrder
	 */
	public List<LendOrder> getAllLendOrders(){
		return lendOrderDao.getAllLendOrders();
	}
	
	public LendOrder getLendOrderByLendID(int lendID){
		return lendOrderDao.getLendOrderByLendID(lendID);
	}
	
	public void updateLendOrder(LendOrder lendOrder){
		lendOrderDao.update(lendOrder);
	}
	
	/*
	 * RequestBook
	 */
	public List<RequestBook> getProcessRequest(String userName){
		return requestBookDao.getProcessedRequest(userName);	
	}
	
	public void addRequestBook(RequestBook requestBook){
		requestBookDao.save(requestBook);
	}
	
	public List<RequestBook> getUnprocessRequest(String userName){
		return requestBookDao.getUnprocessedRequest(userName);
	}
	

	public List<RequestBook> getAllRequestBooks(){
		return requestBookDao.getAllRequestBooks();
	}

	
	public RequestBook getRequestBookByRequestID(int requestID){
		return requestBookDao.getRequestBookByRequestID(requestID);
	}
	
	public void updateRequestBook(RequestBook requestBook){
		requestBookDao.update(requestBook);
	}

}
