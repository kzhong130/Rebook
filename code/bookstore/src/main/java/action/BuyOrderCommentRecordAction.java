package action;

import service.AppService;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import model.Book;
import model.BookIN;
import model.BuyOrder;
import model.BuyOrderCommentRecord;
import model.CreditChangeRecord;
import model.User;
import net.sf.json.JSONObject;

public class BuyOrderCommentRecordAction extends BaseAction{
	private int ID;
	private int buyID;
	private int commenterID;
	private String commentType;
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
	
	public int getBuyID(){
		return buyID;
	}
	
	public void setBuyID(int buyID){
		this.buyID = buyID;
	}
	
	public int getCommenterID(){
		return commenterID;
	}
	
	public void setCommenterID(int commenterID){
		this.commenterID = commenterID;
	}
	
	public String getCommentType(){
		return commentType;
	}
	
	public void setCommentType(String commentType){
		this.commentType = commentType;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public String addBuyOrderCommentRecord() throws Exception{	/*此评价为买家评价 卖家*/
		/*增加一条评价记录*/
		BuyOrderCommentRecord buyOrderCommentRecord = new BuyOrderCommentRecord();
		buyOrderCommentRecord.setBuyID(buyID);
		buyOrderCommentRecord.setCommentType(commentType);
		buyOrderCommentRecord.setContent(content);
		String userName = (String)request().getSession().getAttribute("loginUserName");
		User commenter = appService.getUserByUserName(userName);
		buyOrderCommentRecord.setCommenterID(commenter.getUserID());
		appService.addBuyOrderCommentRecord(buyOrderCommentRecord);
		
		/*更改订单状态*/
		BuyOrder buyOrder = appService.getBuyOrderByBuyID(buyID);
		buyOrder.setStatus("5");
		appService.updateBuyOrder(buyOrder);
		
		/*更改书主用户信用评级及信用评价记录*/
		User owner = appService.getUserByUserName(buyOrder.getOwnerName());
		int oldCredit = owner.getCredit();
		if ("good".equals(commentType)){
			if (oldCredit + 1 > 100){
				owner.setCredit(100);
			}
			else{
				owner.setCredit(oldCredit+1);
			}
		}
		if ("bad".equals(commentType)){
			if (oldCredit - 5 < 0){
				owner.setCredit(0);
			}
			else{
				owner.setCredit(oldCredit - 5);
			}
		}
		appService.updateUser(owner);
		
		if (owner.getCredit() != oldCredit){	//信用记录需要更新
			int delta = owner.getCredit() - oldCredit;
			String ownerName = owner.getUserName();
			Date date = new Date();       
			Timestamp nousedate = new Timestamp(date.getTime());
			String reason = "";
			if ("good".equals(commentType)){
				reason = "good seller";
			}
			if ("bad".equals(commentType)){
				reason = "bad seller";
			}
			CreditChangeRecord creditChangeRecord = new CreditChangeRecord();
			creditChangeRecord.setNumber(delta);
			creditChangeRecord.setReason(reason);
			creditChangeRecord.setTime(nousedate);
			creditChangeRecord.setUserName(ownerName);
			appService.addCreditChangeRecord(creditChangeRecord);
		}
		/*刷新数据*/
		List<BuyOrder> buyOrders = appService.getBuyOrderByBuyerName(userName);
		List<BookIN> bookINsByBuyOrders = appService.getBookINByBuyOrders(buyOrders);
		List<Book> booksByBuyOrders = appService.getBooksByBookINs(bookINsByBuyOrders);
		request().getSession().setAttribute("buyOrders", buyOrders);
		request().getSession().setAttribute("bookINsByBuyOrders", bookINsByBuyOrders);
		request().getSession().setAttribute("booksByBuyOrders", booksByBuyOrders);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "add success";
	}
}
