package service;

import java.util.ArrayList;
import java.util.List;

import model.Admin;
import model.Book;
import model.BookComment;
import model.BookIN;
import model.BuyOrder;
import model.BuyOrderCommentRecord;
import model.BuyOrderFeedback;
import model.CoinChangeRecord;
import model.CreditChangeRecord;
import model.LendOrder;
import model.LendOrderCommentRecord;
import model.LendOrderFeedback;
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
	public List<Book> searchBookByAuthor(String bookAuthor);
	public List<Book> searchBookByISBN(String ISBN);
	public List<Book> getBookByBookComment(List<BookComment> bookComments);		//根据用户的评论得到某个用户的评论涉及到的所有书
	public void updateBook(Book book);
	public List<Book> getBooksByBookINs(List<BookIN> bookINs);
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
	public Admin getAdminByAdminID(int adminID);
	
	/*
	 * BookIN
	 */
	public List<BookIN> getAllBookINs();

	public Integer addBookIN(BookIN bookIN);
	public BookIN getBookINByBookRecordID(int bookRecordID);
	public void updateBookIN(BookIN bookIN);
	public List<BookIN> getBookINByISBN(String ISBN);
	public List<BookIN> getBookINByUserName(String userName);
	public List<BookIN> getBookINByBuyOrders(List<BuyOrder> buyOrders);	/*根据购买订单，得到相对应的bookIN记录，其中，两个list的每个元素在index方面都一一对应*/
	public List<BookIN> getBookINByLendOrders(List<LendOrder> lendOrders);
	/*
	 * LendOrder
	 */
	public List<LendOrder> getAllLendOrders();
	public LendOrder getLendOrderByLendID(int lendID);
	public void updateLendOrder(LendOrder lendOrder);
	public void addLendOrder(LendOrder lendOrder);
	public List<LendOrder> getLendOrdersByLenderName(String lenderName);
	public List<LendOrder> getLendOrdersByOwnerName(String ownerName);
	
	/*
	 * Request
	 */
	
	public List<RequestBook> getProcessRequest(String userName);
	public void addRequestBook(RequestBook requestBook);

	public List<RequestBook> getUnprocessRequest(String userName);

	public List<RequestBook> getAllRequestBooks();

	public RequestBook getRequestBookByRequestID(int requestID);
	public void updateRequestBook(RequestBook requestBook);
	

	public void deleteRequestBook(RequestBook requestBook);

	/*
	 * BuyOrder
	 */
	public void addBuyOrder(BuyOrder buyOrder);
	public List<BuyOrder> getBuyOrderByBuyerName(String buyerName);
	public BuyOrder getBuyOrderByBuyID(int buyID);

	public void updateBuyOrder(BuyOrder buyOrder);
	public List<BuyOrder> getBuyOrderByOwnerName(String ownerName);


	public BuyOrder getBuyOrderByID(int ID);
	

	/*
	 * BuyOrderFeedback
	 */
	public void addBuyOrderFeedback(BuyOrderFeedback buyOrderFeedback);
	
	public List<BuyOrderFeedback> getAllBuyOrderFeedback();
	public BuyOrderFeedback getBuyOrderFeedbackByID(int ID);
	public void updateBuyOrderFeedback(BuyOrderFeedback buyOrderFeedback);
	
	/*
	 * LendOrderFeedback
	 */
	public void addLendOrderFeedback(LendOrderFeedback lendOrderFeedback);
	public List<LendOrderFeedback> getAllLendOrderFeedback();
	public LendOrderFeedback getLendOrderFeedbackByID(int ID);
	public void updateLendOrderFeedback(LendOrderFeedback lendOrderFeedback);

	/*
	 * BuyOrderCommentRecord
	 */
	public void addBuyOrderCommentRecord(BuyOrderCommentRecord buyOrderCommentRecord);
	
	/*
	 * LendOrderCommentRecord
	 */
	public void addLendOrderCommentRecord(LendOrderCommentRecord lendOrderCommentRecord);

}
