package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import model.User;
import service.AppService;

public class UserAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String username;
	private String password;
	private String truename;
	private String phone;
	private String email;
	private String address;
	private String role;
	
	private AppService appService;
	
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getTruename(){
		return truename;
	}
	
	public void setTruename(String truename){
		this.truename = truename;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getAddress(){
		return address;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public String getRole(){
		return role;
	}
	
	public void setRole(String role){
		this.role = role;
	}
	
	public void setAppService(AppService appService){
		this.appService = appService;
	}
	
	public String allUsers() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String role = (String)session.getAttribute("role");
		int userid = (Integer)session.getAttribute("userid");
		List<User> users = new ArrayList<User>();
		if ("admin".equals(role)){
			users = appService.getAllUsers();
			request().setAttribute("users", users);
		}
		if ("user".equals(role)){
			User user = appService.getUserById(userid);
			users.add(user);
			request().setAttribute("users",users);
		}
		
		
		return SUCCESS;
	}
	
	public String addUser() throws Exception{
		User user = new User(username,password,truename,phone,email,address,role);
		appService.addUser(user);
		
		return SUCCESS;
	}
	
	public String deleteUser() throws Exception{
		User user = appService.getUserById(id);
		appService.deleteUser(user);
		
		return SUCCESS;
	}
	
	public String updateUser() throws Exception{
		User user = appService.getUserById(id);
		user.setAddress(address);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhone(phone);
		user.setRole(role);
		user.setTruename(truename);
		user.setUsername(username);
		appService.updateUser(user);
		
		return SUCCESS;
	}
	
	public String userLogin() throws Exception{
		User user = appService.getUserByUsername(username);
		if (user==null) return "login fail";
		if (user.getPassword().equals(password)) {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			session.setAttribute("username",username);
			session.setAttribute("userid", user.getId());
			session.setAttribute("role", user.getRole());
			return "login success";
		}
		else return "login fail";
	}
	
	public String userLogout() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.removeAttribute("userid");
		session.removeAttribute("role");
		return "logout success";
	}
}
