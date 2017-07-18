package dao;

import java.util.List;

import model.BookIN;

public interface BookINDao {
	public Integer save(BookIN bookIN);
	
	public void delete(BookIN bookIN);
	
	public void update(BookIN bookIN);
	
	public BookIN getBookINByBookRecordID(int bookRecordID);
	
	public List<BookIN> getAllBookINs();
	
	public List<BookIN> getBookINsByISBN(String ISBN);
	
	public List<BookIN> getBookINsByUserID(int userID);
	
	public List<BookIN> getBookINByUserName(String userName);
}
