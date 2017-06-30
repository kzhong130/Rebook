package dao;

import java.util.List;

import model.User;

public interface UserDao {
	public Integer save(User user);
	
	public void delete(User user);
	
	public void update(User user);
	
	public User getUserByUserID(int userID);
	
	public List<User> getAllUsers();
	
	public User getUserByUserName(String userName);
}
