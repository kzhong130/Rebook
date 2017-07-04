package action;

import model.User;
import service.AppService;

public class ForgetPasswordAction extends BaseAction{
	
	private String validationProblem;
	private String validationAnswer;
	private String userName;
	private String password;
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password=password;
	}
	
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
	}
	
	public String getValidationProblem(){
		return validationProblem;
	}
	
	public void setValidationProblem(String validationProblem){
		this.validationProblem = validationProblem;
	}
	
	public String getValidationAnswer(){
		return validationAnswer;
	}
	
	public void setValidationAnswer(String validationAnswer){
		this.validationAnswer = validationAnswer;
	}
	
	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService=appService;
	}
	
	public String checkName() throws Exception{
		User user=appService.getUserByUserName(userName);
		//System.out.println(user.getAddress());
		if(user!=null) {
			System.out.println(user.getValidationProblem());
			request().getSession().setAttribute("userName", userName);
			request().getSession().setAttribute("validationProblem", user.getValidationProblem());
			return "nameExist";
		}
		
		return "nameNotExist";
	}
	
	public String checkAnswer() throws Exception{
		userName=(String) request().getSession().getAttribute("userName");
		User user=appService.getUserByUserName(userName);
		String answer=user.getValidationAnswer();
		if(answer.equals(validationAnswer)){
			return "RA";
		}
		return "WA";
	}
	
	
	public String changePassword() throws Exception{
		userName=(String) request().getSession().getAttribute("userName");
		User user=appService.getUserByUserName(userName);
		user.setPassword(password);
		appService.updateUser(user);
		return "change";
	}
}
