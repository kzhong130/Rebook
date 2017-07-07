package action;

import service.AppService;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import model.Book;
import model.BookComment;
import model.User;
import net.sf.json.JSONObject;

public class BookCommentAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private int ID;
	private String ISBN;
	private String userName;
	private Timestamp commentTime;
	private String content;
	private String checkResult;
	
	private AppService appService;
	
	public int getID(){
		return ID;
	}
	
	public void setID(int ID){
		this.ID = ID;
	}
	
	public String getISBN(){
		return ISBN;
	}
	
	public void setISBN(String ISBN){
		this.ISBN = ISBN;
	}
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
	}
	
	public Timestamp getCommentTime(){
		return commentTime;
	}
	
	public void setCommentTime(Timestamp commentTime){
		this.commentTime = commentTime;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public String getCheckResult(){
		return checkResult;
	}
	
	public void setCheckResult(String checkResult){
		this.checkResult = checkResult;
	}
	
	public void setAppService(AppService appService){
		this.appService = appService;
	}
	
	public String addBookComment() throws Exception{
		Date date = new Date();
		Timestamp nousedate = new Timestamp(date.getTime());
		BookComment bookComment= new BookComment();
		bookComment.setISBN(ISBN);
		bookComment.setCommentTime(nousedate);
		bookComment.setContent(content);
		bookComment.setUserName(userName);
		appService.addBookComment(bookComment);
		List<BookComment> bookComments = appService.getBookCommentsByISBN(ISBN);
		request().getSession().setAttribute("bookComment", bookComments);
		return SUCCESS;
	}
	
	public String deleteBookComment() throws Exception{
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		System.out.println(ID);
		appService.deleteBookCommentByID(ID);
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<BookComment> bookComments = appService.getBookCommentsByUserName(userName);
		request().getSession().setAttribute("bookComment", bookComments);
		List<Book> books = appService.getBookByBookComment(bookComments);
		request().getSession().setAttribute("bookByBookComment", books);
		
		return "delete success";
	}
}
