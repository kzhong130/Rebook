package action;

import java.util.List;

import model.Book;
import model.BookIN;
import model.RequestBook;
import service.AppService;

public class RequestAction extends BaseAction{
	
	private String userName;
	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService=appService;
	}
	
	public void setUserName(String userName){
		this.userName=userName;
	}
	
	public String getUserName(){
		return userName;
	}
	
	public String getProcessedRequest() throws Exception{
		userName=(String) request().getSession().getAttribute("loginUserName");
		List<RequestBook> requestBookList=appService.getProcessRequest(userName);
		request().setAttribute("requestBookList", requestBookList);
		List<BookIN> bookInList=null;
		List<Book> bookList=null;
		for(int i=0;i<requestBookList.size();i++){
			BookIN bookIN=appService.getBookINByBookRecordID(requestBookList.get(i).getRequestID());
			Book book=appService.getBookByISBN(bookIN.getISBN());
			bookInList.add(bookIN);
			bookList.add(book);
		}
		request().setAttribute("bookList", bookList);
		request().setAttribute("bookInList", bookInList);
		System.out.println(bookList.size());
		System.out.println(bookInList.size());
		return "process";
	}
}
