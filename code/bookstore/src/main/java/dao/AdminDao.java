package dao;

import java.util.List;

import model.Admin;

public interface AdminDao {
	public Integer save(Admin admin);
	
	public void delete(Admin admin);
	
	public void update(Admin admin);
	
	public Admin getAdminByAdminID(int adminID);
	
	public Admin getAdminByAdminName(String adminName);
	
	public List<Admin> getAllAdmins();
}
