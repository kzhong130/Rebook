package service.impl;

import java.util.List;

import service.AppService;
import model.User;
import dao.UserDao;


public class AppServiceImpl implements AppService {
	private UserDao userDao;

	
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	
	
	
	/*
	 * User
	 */
	public Integer addUser(User user){
		return userDao.save(user);
	}
	
	public void deleteUser(User user){
		userDao.delete(user);;
	}
	
	public void updateUser(User user){
		userDao.update(user);
	}
	
	public User getUserById(int id){
		return userDao.getUserById(id);
	}
	
	public List<User> getAllUsers(){
		return userDao.getAllUsers();
	}
	
	public User getUserByUsername(String username){
		return userDao.getUserByUsername(username);
	}
	

	
}
