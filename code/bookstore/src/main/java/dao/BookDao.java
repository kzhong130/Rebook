package dao;

import java.util.List;

import model.Book;

public interface BookDao {
	public String save(Book book);
	
	public void delete(Book book);
	
	public void update(Book book);
	
	public Book getBookByISBN(String ISBN);
	
	public List<Book> getAllBooks();
}
