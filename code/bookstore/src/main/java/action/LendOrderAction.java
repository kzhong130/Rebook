package action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import org.apache.struts2.ServletActionContext;

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
}
