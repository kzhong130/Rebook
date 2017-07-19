package dao.impl;

import java.util.List;
import model.BookIN;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.BookINDao;


public class BookINDaoImpl extends HibernateDaoSupport implements BookINDao{
	public Integer save(BookIN bookIN){
		return (Integer)getHibernateTemplate().save(bookIN);
	}
	
	public void delete(BookIN bookIN){
		getHibernateTemplate().delete(bookIN);
	}
	
	public void update(BookIN bookIN){
		getHibernateTemplate().merge(bookIN);
	}
	
	public BookIN getBookINByBookRecordID(int bookRecordID){
		@SuppressWarnings("unchecked")
		List<BookIN> bookINs = (List<BookIN>)getHibernateTemplate().find("from BookIN as b where b.bookRecordID = ?",bookRecordID);
		BookIN bookIN = bookINs.size() > 0 ? bookINs.get(0) : null;
		return bookIN;
	}
	
	public List<BookIN> getAllBookINs(){
		@SuppressWarnings("unchecked")
		List<BookIN> bookINs = (List<BookIN>)getHibernateTemplate().find("from BookIN");
		return bookINs;
	}
	
	public List<BookIN> getBookINsByISBN(String ISBN){
		@SuppressWarnings("unchecked")
		List<BookIN> bookINs = (List<BookIN>)getHibernateTemplate().find("from BookIN as b where b.ISBN = ? and b.inStatus = ?",ISBN,"yes");
		return bookINs;
	}
	
	public List<BookIN> getBookINsByUserID(int userID){
		@SuppressWarnings("unchecked")
		List<BookIN> bookINs = (List<BookIN>)getHibernateTemplate().find("from BookIN as b where b.userID = ? and b.inStatus != ?",userID,"delete");
		return bookINs;
	}
	
	public List<BookIN> getBookINByUserName(String userName){
		@SuppressWarnings("unchecked")
		List<BookIN> bookINs = (List<BookIN>)getHibernateTemplate().find("from BookIN as b where b.userName = ? and b.inStatus != ?", userName,"delete");
		return bookINs;
	}
}
