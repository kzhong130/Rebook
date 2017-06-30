package dao.impl;

import java.util.List;
import model.User;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.UserDao;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao{
	public Integer save(User user){
		return (Integer)getHibernateTemplate().save(user);
	}
	
	public void delete(User user){
		getHibernateTemplate().delete(user);
	}
	
	public void update(User user){
		getHibernateTemplate().merge(user);
	}
	
	public User getUserByUserID(int userID){
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>)getHibernateTemplate().find("from User as b where b.userID=?",userID);
		User user = users.size() > 0 ? users.get(0) : null;
		return user;
	}
	
	public List<User> getAllUsers(){
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>)getHibernateTemplate().find("from User");
		return users;
	}
	
	public User getUserByUserName(String userName){
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>)getHibernateTemplate().find("from User as b where b.userName=?",userName);
		User user = users.size() > 0 ? users.get(0) : null;
		return user;
	}
}
