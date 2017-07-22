package action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import model.Book;
import model.BookIN;
import model.LendOrder;
import net.sf.json.JSONObject;
import service.AppService;

public class LendOrderAction extends BaseAction{

	private int lendID;
	private int bookRecordID;
	private int requestID;
	private String lenderName;
	private String returnWay;
	private String lendAddress;
	private String lendPhone;
	private String receiver;
	private Timestamp arrivalTime;
	private Timestamp returnTime;
	private String status;
	private String ownerName;
	
	private AppService appService;
	
	public int getLendID(){
		return lendID;
	}
	
	public void setLendID(int lendID){
		this.lendID = lendID;
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
	
	public String getLenderName(){
		return lenderName;
	}
	
	public void setLenderName(String lenderName){
		this.lenderName = lenderName;
	}
	
	public String getReturnWay(){
		return returnWay;
	}
	
	public void setReturnWay(String returnWay){
		this.returnWay = returnWay;
	}
	
	public String getLendAddress(){
		return lendAddress;
	}
	
	public void setLendAddress(String lendAddress){
		this.lendAddress = lendAddress;
	}
	
	public String getLendPhone(){
		return lendPhone;
	}
	
	public void setLendPhone(String lendPhone){
		this.lendPhone = lendPhone;
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
	
	public Timestamp getReturnTime(){
		return returnTime;
	}
	
	public void setReturnTime(Timestamp returnTime){
		this.returnTime = returnTime;
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
	
	public void setAppService(AppService  appService){
		this.appService = appService;
	}
	
	public String updateLendOrder() throws Exception{
		LendOrder lendOrder = appService.getLendOrderByLendID(lendID);
		lendOrder.setStatus(status);
		appService.updateLendOrder(lendOrder);
		List<LendOrder> lendOrders = appService.getAllLendOrders();
		request().getSession().setAttribute("allLendOrders", lendOrders);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "update success";
	}
	
	public String confirmBook() throws Exception{
		LendOrder lendOrder = appService.getLendOrderByLendID(lendID);
		lendOrder.setStatus("4");
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		lendOrder.setArrivalTime(nousedate);
		appService.updateLendOrder(lendOrder);
		
		
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<LendOrder> lendinOrders = appService.getLendOrdersByLenderName(userName);
		List<BookIN> bookINsByLendinOrders = appService.getBookINByLendOrders(lendinOrders);
		List<Book> booksByLendinOrders = appService.getBooksByBookINs(bookINsByLendinOrders);
		request().getSession().setAttribute("lendinOrders", lendinOrders);
		request().getSession().setAttribute("bookINsByLendinOrders", bookINsByLendinOrders);
		request().getSession().setAttribute("booksByLendinOrders", booksByLendinOrders);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "confirm success";
	}
	
	public String returnLend() throws Exception{	//借书用户确认还书
		LendOrder lendOrder = appService.getLendOrderByLendID(lendID);
		lendOrder.setStatus("5");
		appService.updateLendOrder(lendOrder);
		
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<LendOrder> lendinOrders = appService.getLendOrdersByLenderName(userName);
		List<BookIN> bookINsByLendinOrders = appService.getBookINByLendOrders(lendinOrders);
		List<Book> booksByLendinOrders = appService.getBooksByBookINs(bookINsByLendinOrders);
		request().getSession().setAttribute("lendinOrders", lendinOrders);
		request().getSession().setAttribute("bookINsByLendinOrders", bookINsByLendinOrders);
		request().getSession().setAttribute("booksByLendinOrders", booksByLendinOrders);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "return success";
	}
	
	public String confirmSend() throws Exception{
		LendOrder lendOrder = appService.getLendOrderByLendID(lendID);
		lendOrder.setStatus("3");
		appService.updateLendOrder(lendOrder);
		
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<LendOrder> lendoutOrders = appService.getLendOrdersByOwnerName(userName);
		List<BookIN> bookINsByLendoutOrders = appService.getBookINByLendOrders(lendoutOrders);
		List<Book> booksByLendoutOrders = appService.getBooksByBookINs(bookINsByLendoutOrders);
		request().getSession().setAttribute("lendoutOrders", lendoutOrders);
		request().getSession().setAttribute("bookINsByLendoutOrders", bookINsByLendoutOrders);
		request().getSession().setAttribute("booksByLendoutOrders", booksByLendoutOrders);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "confirm success";
	}
	
	public String confirmReturn() throws Exception{
		LendOrder lendOrder = appService.getLendOrderByLendID(lendID);
		lendOrder.setStatus("6");
		appService.updateLendOrder(lendOrder);
		
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<LendOrder> lendoutOrders = appService.getLendOrdersByOwnerName(userName);
		List<BookIN> bookINsByLendoutOrders = appService.getBookINByLendOrders(lendoutOrders);
		List<Book> booksByLendoutOrders = appService.getBooksByBookINs(bookINsByLendoutOrders);
		request().getSession().setAttribute("lendoutOrders", lendoutOrders);
		request().getSession().setAttribute("bookINsByLendoutOrders", bookINsByLendoutOrders);
		request().getSession().setAttribute("booksByLendoutOrders", booksByLendoutOrders);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "confirm success";
	}
}
