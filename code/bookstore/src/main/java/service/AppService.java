package service;

import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.BookComment;
import model.CoinChangeRecord;
import model.CreditChangeRecord;
import model.User;

public interface AppService {

	
	/*
	 * User
	 */
	public Integer addUser(User user);
	public void deleteUser(User user);
	public void updateUser(User user);
	public User getUserByUserID(int userID);
	public List<User> getAllUsers();
	public User getUserByUserName(String userName);
	
	/*
	 * Book
	 */
	public String addBook(Book book);
	public Book readBookByISBN(String ISBN);	//using douban api. May write in db.
	public Book getBookByISBN(String ISBN);		//don't use douban api. Just get book in db
	public ArrayList<Book> getAllBooks();
	public List<Book> searchBookByName(String bookName);
	public List<Book> getBookByBookComment(List<BookComment> bookComments);		//根据用户的评论得到某个用户的评论涉及到的所有书
	
	/*
	 * BookComment
	 */
	public Integer addBookComment(BookComment bookComment);
	public List<BookComment> getBookCommentsByISBN(String ISBN);
	public List<BookComment> getBookCommentsByUserName(String userName);
	
	/*
	 * CreditChangeRecord
	 */
	public List<CreditChangeRecord> getCreditChangeRecordByUserName(String userName);
	
	
	/*
	 * CoinChangeRecord
	 */
	public List<CoinChangeRecord> getCoinChangeRecordByUserName(String userName);

}
