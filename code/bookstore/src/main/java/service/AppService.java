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
	public Book readBookByISBN(String ISBN);
	public ArrayList<Book> getAllBooks();
	

}
