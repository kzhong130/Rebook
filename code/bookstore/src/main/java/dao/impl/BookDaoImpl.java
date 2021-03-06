package dao.impl;

import java.util.ArrayList;
import java.util.List;
import model.Book;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.BookDao;


public class BookDaoImpl extends HibernateDaoSupport implements BookDao{
	public String save(Book book){
		return (String) getHibernateTemplate().save(book);
	}
	
	public void delete(Book book){
		getHibernateTemplate().delete(book);
	}
	
	public void update(Book book){
		getHibernateTemplate().merge(book);
	}
	
	public Book getBookByISBN(String ISBN){
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>)getHibernateTemplate().find("from Book as b where b.ISBN = ?",ISBN);
		Book book = books.size() > 0 ? books.get(0) : null;
		return book;
	}
	

	public List<Book> getAllBooks(){
		@SuppressWarnings("unchecked")
		List<Book> books = getHibernateTemplate().find("from Book");
		return books;
	}
	
	
	public List<Book> searchBookByName(String bookName){
		@SuppressWarnings("unchecked")
		List<Book> books = new ArrayList<Book>();
		String hql = "from Book as b where b.bookName like '%"+bookName+"%'";
		books = (List<Book>)getHibernateTemplate().find(hql);
		return books;
	}
	
	public List<Book> searchBookByAuthor(String bookAuthor){
		@SuppressWarnings("unchecked")
		List<Book> books = new ArrayList<Book>();
		String hql = "from Book as b where b.author like '%"+bookAuthor+"%'";
		books = (List<Book>)getHibernateTemplate().find(hql);
		return books;
	}
	
	public List<Book> searchBookByISBN(String ISBN){
		@SuppressWarnings("unchecked")
		List<Book> books = new ArrayList<Book>();
		String hql = "from Book as b where b.ISBN like '%"+ISBN+"%'";
		books = (List<Book>)getHibernateTemplate().find(hql);
		return books;
	}
}
