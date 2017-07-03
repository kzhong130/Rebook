package service.impl;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import service.AppService;
import model.User;
import model.Book;
import dao.UserDao;
import dao.BookDao;

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


	
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	public void setBookDao(BookDao bookDao){
		this.bookDao = bookDao;
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
	
	/*
	 * Book
	 */
	public String addBook(Book book){
		return bookDao.save(book);
	}
	
	@SuppressWarnings("deprecation")
	public Book readBookByISBN(String ISBN){
		Book book = new Book();
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
			String pricestr = json.getString("price");
			float price = 0;
			if (pricestr == null || pricestr.length()<=0){
				price = 0;
			}
			else{
				int length = pricestr.length();
				if (pricestr.charAt(0) < '0' || pricestr.charAt(0) > '9'){	/* Format like USD 30*/
					int startindex = 0;
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
					price = Float.parseFloat(pricestr.substring(0, length-1));
				}
			}
			
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
		}
		return book;
	}

	@Override
	public ArrayList<Book> getAllBooks() {
		return (ArrayList<Book>)bookDao.getAllBooks();
	}


	
}
