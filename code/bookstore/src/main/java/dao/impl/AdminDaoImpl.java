package dao.impl;

import java.util.List;
import model.Admin;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.AdminDao;

public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao{
	public Integer save(Admin admin){
		return (Integer)getHibernateTemplate().save(admin);
	}
	
	public void delete(Admin admin){
		getHibernateTemplate().delete(admin);
	}
	
	public void update(Admin admin){
		getHibernateTemplate().merge(admin);
	}
	
	public List<Admin> getAllAdmins(){
		@SuppressWarnings("unchecked")
		List<Admin> admins = (List<Admin>)getHibernateTemplate().find("from Admin");
		return admins;
	}
	
	public Admin getAdminByAdminID(int adminID){
		@SuppressWarnings("unchecked")
		List<Admin> admins = (List<Admin>)getHibernateTemplate().find("from Admin as b where b.adminID = ?",adminID);
		Admin admin = admins.size() > 0 ? admins.get(0) : null;
		return admin;
	}
	
	public Admin getAdminByAdminName(String adminName){
		@SuppressWarnings("unchecked")
		List<Admin> admins = (List<Admin>)getHibernateTemplate().find("from Admin as b where b.adminName = ?", adminName);
		Admin admin = admins.size() > 0 ? admins.get(0) : null;
		return admin;
	}
}
