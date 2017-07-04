package service;

import java.util.ArrayList;
import java.util.List;
import model.Book;
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
	
	
	

}
