package action;

import service.AppService;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import model.Book;
import model.BookIN;
import model.CreditChangeRecord;
import model.LendOrder;
import model.LendOrderCommentRecord;
import model.User;
import net.sf.json.JSONObject;


public class LendOrderCommentRecordAction extends BaseAction{
	private int ID;
	private String commentType;
	private int lendID;
	private int commenterID;
	private String content;
	
	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService = appService;
	}
	
	public int getID(){
		return ID;
	}
	
	public void setID(int ID){
		this.ID = ID;
	}
	
	public String getCommentType(){
		return commentType;
	}
	
	public void setCommentType(String commentType){
		this.commentType = commentType;
	}
	
	public int getLendID(){
		return lendID;
	}
	
	public void setLendID(int lendID){
		this.lendID = lendID;
	}
	
	public int getCommenterID(){
		return commenterID;
	}
	
	public void setCommenterID(int commenterID){
		this.commenterID = commenterID;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public String addLendOrderCommentRecord() throws Exception{
		LendOrder lendOrder = appService.getLendOrderByLendID(lendID);
		String userName = (String)request().getSession().getAttribute("loginUserName");
		User commentingUser = appService.getUserByUserName(userName);
		
		/*在评价记录中增加一条*/
		LendOrderCommentRecord lendOrderCommentRecord = new LendOrderCommentRecord();
		lendOrderCommentRecord.setCommenterID(commentingUser.getUserID());
		lendOrderCommentRecord.setCommentType(commentType);
		lendOrderCommentRecord.setContent(content);
		lendOrderCommentRecord.setLendID(lendID);
		appService.addLendOrderCommentRecord(lendOrderCommentRecord);
		
		/*根据评价人是借书用户还是书主用户对被评价者的信用、信用记录进行操作，并根据原来订单状态更新最新订单状态*/
		if (userName.equals(lendOrder.getOwnerName())){		//评价人是书主用户，借出书籍者评价借入书籍者
			//更新被评价者信用
			User commentedUser = appService.getUserByUserName(lendOrder.getLenderName());
			int oldCredit = commentedUser.getCredit();
			if ("good".equals(commentType)){
				if (oldCredit + 1 > 100){
					commentedUser.setCredit(100);
				}
				else{
					commentedUser.setCredit(oldCredit + 1);
				}
			}
			if ("bad".equals(commentType)){
				if (oldCredit - 5 < 0){
					commentedUser.setCredit(0);
				}
				else{
					commentedUser.setCredit(oldCredit - 5);
				}
			}
			appService.updateUser(commentedUser);
			
			if (commentedUser.getCredit() != oldCredit){		//被评价者信用记录需要更新
				int delta = commentedUser.getCredit() - oldCredit;
				String commentedName = commentedUser.getUserName();
				Date date = new Date();       
				Timestamp nousedate = new Timestamp(date.getTime());
				String reason = "";
				if ("good".equals(commentType)){
					reason = "good lendin";
				}
				if ("bad".equals(commentType)){
					reason = "bad lendin";
				}
				CreditChangeRecord creditChangeRecord = new CreditChangeRecord();
				creditChangeRecord.setNumber(delta);
				creditChangeRecord.setReason(reason);
				creditChangeRecord.setTime(nousedate);
				creditChangeRecord.setUserName(commentedName);
				appService.addCreditChangeRecord(creditChangeRecord);
			}
			
			//根据原先订单状态变更最新订单状态
			String oldStatus = lendOrder.getStatus();
			if (oldStatus.equals("6")){
				lendOrder.setStatus("7");
			}
			if (oldStatus.equals("8")){
				lendOrder.setStatus("9");
			}
			appService.updateLendOrder(lendOrder);
			/*刷新数据*/
			List<LendOrder> lendoutOrders = appService.getLendOrdersByOwnerName(userName);
			List<BookIN> bookINsByLendoutOrders = appService.getBookINByLendOrders(lendoutOrders);
			List<Book> booksByLendoutOrders = appService.getBooksByBookINs(bookINsByLendoutOrders);
			request().getSession().setAttribute("lendoutOrders", lendoutOrders);
			request().getSession().setAttribute("bookINsByLendoutOrders", bookINsByLendoutOrders);
			request().getSession().setAttribute("booksByLendoutOrders", booksByLendoutOrders);
		}
		
		if (userName.equals(lendOrder.getLenderName())){		//评价人是借书用户，借入书籍者评价借出书籍者
			//更新被评价者信用
			User commentedUser = appService.getUserByUserName(lendOrder.getOwnerName());
			int oldCredit = commentedUser.getCredit();
			if ("good".equals(commentType)){
				if (oldCredit + 1 > 100){
					commentedUser.setCredit(100);
				}
				else{
					commentedUser.setCredit(oldCredit + 1);
				}
			}
			if ("bad".equals(commentType)){
				if (oldCredit - 5 < 0){
					commentedUser.setCredit(0);
				}
				else{
					commentedUser.setCredit(oldCredit - 5);
				}
			}
			appService.updateUser(commentedUser);
			
			if (commentedUser.getCredit() != oldCredit){		//被评价者信用记录需要更新
				int delta = commentedUser.getCredit() - oldCredit;
				String commentedName = commentedUser.getUserName();
				Date date = new Date();       
				Timestamp nousedate = new Timestamp(date.getTime());
				String reason = "";
				if ("good".equals(commentType)){
					reason = "good lendout";
				}
				if ("bad".equals(commentType)){
					reason = "bad lendout";
				}
				CreditChangeRecord creditChangeRecord = new CreditChangeRecord();
				creditChangeRecord.setNumber(delta);
				creditChangeRecord.setReason(reason);
				creditChangeRecord.setTime(nousedate);
				creditChangeRecord.setUserName(commentedName);
				appService.addCreditChangeRecord(creditChangeRecord);
			}
			
			//根据原先订单状态更新最新订单状态
			String oldStatus = lendOrder.getStatus();
			if (oldStatus.equals("6")){
				lendOrder.setStatus("8");
			}
			if (oldStatus.equals("7")){
				lendOrder.setStatus("9");
			}
			appService.updateLendOrder(lendOrder);
			/*刷新数据*/
			List<LendOrder> lendinOrders = appService.getLendOrdersByLenderName(userName);
			List<BookIN> bookINsByLendinOrders = appService.getBookINByLendOrders(lendinOrders);
			List<Book> booksByLendinOrders = appService.getBooksByBookINs(bookINsByLendinOrders);
			request().getSession().setAttribute("lendinOrders", lendinOrders);
			request().getSession().setAttribute("bookINsByLendinOrders", bookINsByLendinOrders);
			request().getSession().setAttribute("booksByLendinOrders", booksByLendinOrders);
		}
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "add success";
		
		
	}
}
