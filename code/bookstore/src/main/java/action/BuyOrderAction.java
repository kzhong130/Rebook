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
import net.sf.json.JSONObject;

public class BuyOrderAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private int buyID;
	private int bookRecordID;
	private int requestID;
	private String buyerName;
	private String buyAddress;
	private String buyPhone;
	private String receiver;
	private Timestamp arrivalTime;
	private String status;
	private String ownerName;
	private Timestamp createTime;
	
	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService = appService;
	}
	
	public Timestamp getCreateTime(){
		return createTime;
	}
	
	public void setCreateTime(Timestamp createTime){
		this.createTime = createTime;
	}
	
	public int getBuyID(){
		return buyID;
	}
	
	public void setBuyID(int buyID){
		this.buyID = buyID;
	}
	
	public int getBookRecordID(){
		return bookRecordID;
	}
	
	public void setBookRecordID(int bookRecordID){
		this.bookRecordID = bookRecordID;
	}
	
	public int getRequestID(){
		return requestID;
	}
	
	public void setRequestID(int requestID){
		this.requestID = requestID;
	}
	
	public String getBuyerName(){
		return buyerName;
	}
	
	public void setBuyerName(String buyerName){
		this.buyerName = buyerName;
	}
	
	public String getBuyAddress(){
		return buyAddress;
	}
	
	public void setBuyAddress(String buyAddress){
		this.buyAddress = buyAddress;
	}
	
	public String getBuyPhone(){
		return buyPhone;
	}
	
	public void setBuyPhone(String buyPhone){
		this.buyPhone = buyPhone;
	}
	
	public String getReceiver(){
		return receiver;
	}
	
	public void setReceiver(String receiver){
		this.receiver = receiver;
	}
	
	public Timestamp getArrivalTime(){
		return arrivalTime;
	}
	
	public void setArrivalTime(Timestamp arrivalTime){
		this.arrivalTime = arrivalTime;
	}
	
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	
	public String getOwnerName(){
		return ownerName;
	}
	
	public void setOwnerName(String ownerName){
		this.ownerName = ownerName;
	}
	
	public String confirmBook() throws Exception{
		BuyOrder buyOrder = appService.getBuyOrderByBuyID(buyID);
		buyOrder.setStatus("4");
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		buyOrder.setArrivalTime(nousedate);
		appService.updateBuyOrder(buyOrder);
		
		/*刷新数据*/
		String userName = (String)request().getSession().getAttribute("loginUserName");
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
		
		return "comfirm success";
	}
	
	public String confirmSend() throws Exception{
		BuyOrder buyOrder = appService.getBuyOrderByBuyID(buyID);
		buyOrder.setStatus("3");
		appService.updateBuyOrder(buyOrder);
		
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<BuyOrder> sellOrders = appService.getBuyOrderByOwnerName(userName);
		List<BookIN> bookINsBySellOrders = appService.getBookINByBuyOrders(sellOrders);
		List<Book> booksBySellOrders = appService.getBooksByBookINs(bookINsBySellOrders);
		request().getSession().setAttribute("sellOrders", sellOrders);
		request().getSession().setAttribute("bookINsBySellOrders", bookINsBySellOrders);
		request().getSession().setAttribute("booksBySellOrders", booksBySellOrders);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "comfirm success";
	}
}
