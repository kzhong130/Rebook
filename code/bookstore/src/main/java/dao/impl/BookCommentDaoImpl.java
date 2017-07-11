package dao.impl;

import java.util.List;
import model.BookComment;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.BookCommentDao;

public class BookCommentDaoImpl extends HibernateDaoSupport implements BookCommentDao{
	public Integer save(BookComment bookComment){
		return (Integer)getHibernateTemplate().save(bookComment);
	}
	
	public void delete(BookComment bookComment){
		getHibernateTemplate().delete(bookComment);
	}
	
	public void update(BookComment bookComment){
		getHibernateTemplate().merge(bookComment);
	}
	
	public BookComment getBookCommentByID(int ID){
		@SuppressWarnings("unchecked")
		List<BookComment> bookComments = (List<BookComment>)getHibernateTemplate().find("from BookComment as b where b.ID = ?",ID);
		BookComment bookComment = bookComments.size() > 0 ? bookComments.get(0) : null;
		return bookComment;
	}
	
	public List<BookComment> getAllBookComments(){
		@SuppressWarnings("unchecked")
		List<BookComment> bookComments = (List<BookComment>)getHibernateTemplate().find("from BookComment");
		return bookComments;
	}
	
	public List<BookComment> getBookCommentsByISBN(String ISBN){
		@SuppressWarnings("unchecked")
		List<BookComment> bookComments = (List<BookComment>)getHibernateTemplate().find("from BookComment as b where b.ISBN = ? and b.checkResult != ?", ISBN,"reject");
		return bookComments;
	}
	
	public List<BookComment> getBookCommentsByUserName(String userName){
		@SuppressWarnings("unchecked")
		List<BookComment> bookComments = (List<BookComment>)getHibernateTemplate().find("from BookComment as b where b.userName = ?",userName);
		return bookComments;
	}
}
