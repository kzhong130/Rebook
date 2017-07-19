package service;

import java.util.ArrayList;
import java.util.List;

import model.Admin;
import model.Book;
import model.BookComment;
import model.BookIN;
import model.CoinChangeRecord;
import model.CreditChangeRecord;
import model.LendOrder;
import model.RequestBook;
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
	public List<User> getUserByBookINs(List<BookIN> bookINs);
	
	/*
	 * Book
	 */
	public String addBook(Book book);
	public Book readBookByISBN(String ISBN);	//using douban api. May write in db.
	public Book getBookByISBN(String ISBN);		//don't use douban api. Just get book in db
	public ArrayList<Book> getAllBooks();
	public List<Book> searchBookByName(String bookName);
	public List<Book> getBookByBookComment(List<BookComment> bookComments);		//根据用户的评论得到某个用户的评论涉及到的所有书
	public void updateBook(Book book);
	/*
	 * BookComment
	 */
	public Integer addBookComment(BookComment bookComment);
	public List<BookComment> getBookCommentsByISBN(String ISBN);	//得到的是没有被reject的bookComment
	public List<BookComment> getBookCommentsByUserName(String userName);
	public void deleteBookCommentByID(int ID);
	public List<BookComment> getAllBookComments();
	public BookComment getBookCommentByID(int ID);
	public void updateBookComment(BookComment bookComment);
	
	/*
	 * CreditChangeRecord
	 */
	public List<CreditChangeRecord> getCreditChangeRecordByUserName(String userName);
	public Integer addCreditChangeRecord(CreditChangeRecord creditChangeRecord);
	
	
	/*
	 * CoinChangeRecord
	 */
	public List<CoinChangeRecord> getCoinChangeRecordByUserName(String userName);
	public Integer addCoinChangeRecord(CoinChangeRecord coinChangeRecord);
	
	/*
	 * Admin
	 */
	public Admin getAdminByAdminName(String adminName);
	
	/*
	 * BookIN
	 */
	public List<BookIN> getAllBookINs();

	public Integer addBookIN(BookIN bookIN);
	public BookIN getBookINByBookRecordID(int bookRecordID);
	public void updateBookIN(BookIN bookIN);
	public List<BookIN> getBookINByISBN(String ISBN);
	public List<BookIN> getBookINByUserName(String userName);
	
	/*
	 * LendOrder
	 */
	public List<LendOrder> getAllLendOrders();
	public LendOrder getLendOrderByLendID(int lendID);
	public void updateLendOrder(LendOrder lendOrder);
	public void addLendOrder(LendOrder lendOrder);
	
	/*
	 * Request
	 */
	
	public List<RequestBook> getProcessRequest(String userName);
	public void addRequestBook(RequestBook requestBook);

	public List<RequestBook> getUnprocessRequest(String userName);

	public List<RequestBook> getAllRequestBooks();

	public RequestBook getRequestBookByRequestID(int requestID);
	public void updateRequestBook(RequestBook requestBook);

}
