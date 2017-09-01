package action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import Mail.MailSenderInfo;
import Mail.SimpleMailSender;
import org.apache.struts2.ServletActionContext;


import model.Book;
import model.BookIN;
import model.BuyOrder;
import model.CoinChangeRecord;
import model.LendOrder;
import model.RequestBook;
import model.User;
import net.sf.json.JSONObject;
import service.AppService;

public class RequestAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private int requestID;
	private int bookRecordID;
	private String userName;
	private String city;
	private String province;
	private String address;
	private String receiverName;
	private String requestStatus;
	private String returnWay;
	private String phone;

	private String town;
	
	public void setTown(String town){
		this.town=town;
	}
	
	public String getTown(){
		return town;
	}
	
	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService=appService;
	}
	
	public int getRequestID(){
		return requestID;
	}
	
	public void setRequestID(int requestID){
		this.requestID = requestID;
	}
	
	public int getBookRecordID(){
		return bookRecordID;
	}
	
	public void setBookRecordID(int bookRecordID){
		this.bookRecordID = bookRecordID;
	}
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
	}
	
	public String getCity(){
		return city;
	}
	
	public void setCity(String city){
		this.city = city;
	}
	
	public String getProvince(){
		return province;
	}
	
	public void setProvince(String province){
		this.province = province;
	}
	
	public String getAddress(){
		return address;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public String getReceiverName(){
		return receiverName;
	}
	
	public void setReceiverName(String receiverName){
		this.receiverName = receiverName;
	}
	
	public String getRequestStatus(){
		return requestStatus;
	}
	
	public void setRequestStatus(String requestStatus){
		this.requestStatus = requestStatus;
	}
	
	public String getReturnWay(){
		return returnWay;
	}
	
	public void setReturnWay(String returnWay){
		this.returnWay = returnWay;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
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
		return "process";
	}
	
	public String addRequestBook() throws Exception{
		RequestBook requestBook = new RequestBook(bookRecordID,userName,city, province, address, receiverName,  requestStatus,  returnWay,  phone,town);
		appService.addRequestBook(requestBook);
		BookIN bookIN = appService.getBookINByBookRecordID(bookRecordID);
		User user = appService.getUserByUserName(userName);
		int oldBookCoin = user.getBookCoin();
		user.setBookCoin(oldBookCoin - bookIN.getCoinNumber());
		appService.updateUser(user);
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		
		if (returnWay == null){	//购书申请
			
			CoinChangeRecord coinChangeRecord = new CoinChangeRecord(userName,bookIN.getCoinNumber()*-1,nousedate,"buy");
			appService.addCoinChangeRecord(coinChangeRecord);
		}
		if (returnWay != null){	//借书申请
			CoinChangeRecord coinChangeRecord = new CoinChangeRecord(userName,bookIN.getCoinNumber()*-1,nousedate,"lendin");
			appService.addCoinChangeRecord(coinChangeRecord);
		}
		
		//send notification email
		BookIN record = appService.getBookINByBookRecordID(bookRecordID);
		String to = appService.getUserByUserName(record.getUserName()).getEmail();
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("465");
        mailInfo.setValidate(true);
        mailInfo.setFromAddress("se_rebook@163.com");//自己邮箱
        mailInfo.setToAddress(to);//目标邮箱
        mailInfo.setUserName("se_rebook@163.com");//自己邮箱
        //需要开启此邮箱的POP3/SMTP/IMAP服务，具体设置进入邮箱以后在“设置”里进行开启
        mailInfo.setPassword("rebook123");//自己邮箱密码
        //System.out.println("password="+password);
        mailInfo.setSubject("Rebook：图书申请通知");
        String content = "  您好！\n  您的单号为"+record.getBookRecordID()+"的图书正在被用户"+userName+"发起申请，请尽快登录网站处理请求\n\n祝好！\n爱书网";
        mailInfo.setContent(content);
        boolean isSend = SimpleMailSender.sendTextMail(mailInfo);
        
        
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "add success";
	}
	
	public String updateRequestBook() throws Exception{
		RequestBook requestBook = appService.getRequestBookByRequestID(requestID);
		requestBook.setRequestStatus(requestStatus);
		appService.updateRequestBook(requestBook);
		List<RequestBook> requestBooks = appService.getAllRequestBooks();
		request().getSession().setAttribute("allRequestBooks", requestBooks);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "update success";
	}
	

	public String searchRequestInfo() throws Exception{
		response().setCharacterEncoding("UTF-8"); 
		//response().setContentType("application/json;charset=utf-8"); 
		PrintWriter out=response().getWriter();
		JSONObject obj = new JSONObject(); 
		RequestBook requestBook=appService.getRequestBookByRequestID(requestID);
		obj.put("name", requestBook.getReceiverName());
		obj.put("phone", requestBook.getPhone());
		obj.put("province", requestBook.getProvince());
		obj.put("city", requestBook.getCity());
		obj.put("area", requestBook.getTown());
		obj.put("address", requestBook.getAddress());
		obj.put("returnWay", requestBook.getReturnWay());
        String str = obj.toString();  
        out.write(str);
        out.close();
        return SUCCESS;
	}
       

	public String passLendRequest() throws Exception{
		/*通过申请并下单并将对应的bookIN记录改为delete并将书主的书币及书币记录更新*/
		RequestBook requestBook = appService.getRequestBookByRequestID(requestID);
		requestBook.setRequestStatus("accept");
		appService.updateRequestBook(requestBook);
		BookIN bookIN = appService.getBookINByBookRecordID(requestBook.getBookRecordID());
		String ownerName = bookIN.getUserName();
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		LendOrder lendOrder = new LendOrder();
		lendOrder.setBookRecordID(requestBook.getBookRecordID());
		lendOrder.setRequestID(requestBook.getRequestID());
		lendOrder.setLenderName(requestBook.getUserName());
		lendOrder.setReturnWay(requestBook.getReturnWay());
		lendOrder.setLendAddress(requestBook.getProvince()+requestBook.getCity()+requestBook.getTown()+requestBook.getAddress());
		lendOrder.setLendPhone(requestBook.getPhone());
		lendOrder.setReceiver(requestBook.getReceiverName());
		lendOrder.setStatus("1");
		lendOrder.setOwnerName(ownerName);
		lendOrder.setCreateTime(nousedate);
		appService.addLendOrder(lendOrder);
		bookIN.setInStatus("delete");
		appService.updateBookIN(bookIN);
		User ownerUser = appService.getUserByUserName((String)request().getSession().getAttribute("loginUserName"));
		int ownerOldCoin = ownerUser.getBookCoin();
		ownerUser.setBookCoin(ownerOldCoin+bookIN.getCoinNumber());
		appService.updateUser(ownerUser);
		CoinChangeRecord ownerCoinChangeRecord = new CoinChangeRecord();
		ownerCoinChangeRecord.setNumber(bookIN.getCoinNumber());
		ownerCoinChangeRecord.setReason("lendout");
		ownerCoinChangeRecord.setTime(nousedate);
		ownerCoinChangeRecord.setUserName(ownerUser.getUserName());
		appService.addCoinChangeRecord(ownerCoinChangeRecord);
		
		
		//TODO
		
		String to = appService.getUserByUserName(requestBook.getUserName()).getEmail();
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("465");
        mailInfo.setValidate(true);
        mailInfo.setFromAddress("se_rebook@163.com");//自己邮箱
        mailInfo.setToAddress(to);//目标邮箱
        mailInfo.setUserName("se_rebook@163.com");//自己邮箱
        //需要开启此邮箱的POP3/SMTP/IMAP服务，具体设置进入邮箱以后在“设置”里进行开启
        mailInfo.setPassword("rebook123");//自己邮箱密码
        //System.out.println("password="+password);
        mailInfo.setSubject("Rebook：图书申请通过通知");
        String content = "您好！\n  您的申请单号为"+requestBook.getBookRecordID()+"的申请已经通过！请尽快登录网站查看相关信息！\n\n祝好！\nRebook爱书网";
        mailInfo.setContent(content);
        boolean isSend = SimpleMailSender.sendTextMail(mailInfo);
		
		/*拒绝其他等待中的请求*/
		List<RequestBook> allRequestBooks = appService.getAllRequestBooks();
		List<RequestBook> myRequestBook = new ArrayList<RequestBook>();
		if (allRequestBooks.size() > 0){
			for (int i=0; i<allRequestBooks.size(); i++){
				if (allRequestBooks.get(i).getBookRecordID() == requestBook.getBookRecordID() && allRequestBooks.get(i).getRequestStatus().equals("waiting")){
					myRequestBook.add(allRequestBooks.get(i));
				}
			}
			if (myRequestBook.size() > 0){
				for (int i=0; i<myRequestBook.size(); i++){
					myRequestBook.get(i).setRequestStatus("reject");
					appService.updateRequestBook(myRequestBook.get(i));
					User user = appService.getUserByUserName(myRequestBook.get(i).getUserName());
					int oldCoinNum = user.getBookCoin();
					user.setBookCoin(oldCoinNum + bookIN.getCoinNumber());
					appService.updateUser(user);
					CoinChangeRecord coinChangeRecord = new CoinChangeRecord();
					coinChangeRecord.setNumber(bookIN.getCoinNumber());
					coinChangeRecord.setReason("return");
					Date date1 = new Date();       
					Timestamp nousedate1 = new Timestamp(date1.getTime());
					coinChangeRecord.setTime(nousedate1);
					coinChangeRecord.setUserName(myRequestBook.get(i).getUserName());
					appService.addCoinChangeRecord(coinChangeRecord);
			        mailInfo.setSubject("Rebook：图书申请未通过通知");
			        content = "您好！\n  您的申请单号为"+myRequestBook.get(i).getBookRecordID()+"的申请已被书主拒绝，请尽快登录网站查看其他相关图书借阅信息！\n\n祝好！\nRebook爱书网";
			        mailInfo.setContent(content);
			        SimpleMailSender.sendTextMail(mailInfo);
				}
			}
		}
		
		/*刷新数据*/
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<BookIN> bookINs = appService.getBookINByUserName(userName);
		List<BookIN> lendBookINs = new ArrayList<BookIN>();
		List<BookIN> sellBookINs = new ArrayList<BookIN>();
		if (bookINs.size() > 0){
			for (int i=0; i<bookINs.size(); i++){
				if ("sell".equals(bookINs.get(i).getType())){
					sellBookINs.add(bookINs.get(i));
				}
				if ("lend".equals(bookINs.get(i).getType())){
					lendBookINs.add(bookINs.get(i));
				}
			}
		}
		List<Book> booksByLendBookINs = new ArrayList<Book>();
		List<Book> booksBySellBookINs = new ArrayList<Book>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				Book book = appService.getBookByISBN(lendBookINs.get(i).getISBN());
				booksByLendBookINs.add(book);
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				Book book = appService.getBookByISBN(sellBookINs.get(i).getISBN());
				booksBySellBookINs.add(book);
			}
		}
		allRequestBooks = appService.getAllRequestBooks();
		List<RequestBook> requestBooksByLendBookINs = new ArrayList<RequestBook>();
		List<RequestBook> requestBooksBySellBookINs = new ArrayList<RequestBook>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				int bookRecordID = lendBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksByLendBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				int bookRecordID = sellBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksBySellBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		request().getSession().setAttribute("lendBookINs", lendBookINs);
		request().getSession().setAttribute("sellBookINs", sellBookINs);
		request().getSession().setAttribute("booksByLendBookINs", booksByLendBookINs);
		request().getSession().setAttribute("booksBySellBookINs", booksBySellBookINs);
		request().getSession().setAttribute("requestBooksBySellBookINs", requestBooksBySellBookINs);
		request().getSession().setAttribute("requestBooksByLendBookINs", requestBooksByLendBookINs);
		
		/*传输数据回前台*/
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();

		out.write(str);
		out.close();
		return SUCCESS;
	}

	public String changeInfo() throws Exception{
		RequestBook request=appService.getRequestBookByRequestID(requestID);
		request.setAddress(address);
		request.setCity(city);
		request.setTown(town);
		request.setReturnWay(returnWay);
		request.setPhone(phone);
		request.setProvince(province);
		request.setReceiverName(receiverName);
		appService.updateRequestBook(request);
		
		return SUCCESS;
	}
	
	public String cancle() throws Exception{
		
		RequestBook request=appService.getRequestBookByRequestID(requestID);
		User nuser = appService.getUserByUserName(request.getUserName());
		BookIN bookIn = appService.getBookINByBookRecordID(request.getBookRecordID());
		int coin = nuser.getBookCoin();
		coin += bookIn.getCoinNumber();
		nuser.setBookCoin(coin);
		appService.updateUser(nuser);
		appService.deleteRequestBook(request);
		String nuserName=request.getUserName();
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		CoinChangeRecord coinChangeRecord=new CoinChangeRecord(nuserName,bookIn.getCoinNumber(),nousedate,"return");
		appService.addCoinChangeRecord(coinChangeRecord);
		
		List<CoinChangeRecord> coinChangeRecords = appService.getCoinChangeRecordByUserName(nuserName);
		request().getSession().setAttribute("coinChangeRecord", coinChangeRecords);
		
		String userName = (String)request().getSession().getAttribute("loginUserName");
		User user = appService.getUserByUserName(userName);
		request().getSession().setAttribute("user", user);
		
		List<RequestBook> requestBookList=appService.getProcessRequest(userName);
		request().getSession().setAttribute("requestBookList", requestBookList);
		List<BookIN> bookInList=new ArrayList<BookIN>();
		List<Book> bookList=new ArrayList<Book>();
		for(int i=0;i<requestBookList.size();i++){
			BookIN bookIN=appService.getBookINByBookRecordID(requestBookList.get(i).getBookRecordID());
			Book book=appService.getBookByISBN(bookIN.getISBN());
			bookInList.add(bookIN);
			bookList.add(book);
		}
		List<RequestBook> UnrequestBookList=appService.getUnprocessRequest(userName);
		request().getSession().setAttribute("UnrequestBookList", UnrequestBookList);
		List<BookIN> UnbookInList=new ArrayList<BookIN>();
		List<Book> UnbookList=new ArrayList<Book>();
		for(int i=0;i<UnrequestBookList.size();i++){
			BookIN bookIN=appService.getBookINByBookRecordID(UnrequestBookList.get(i).getBookRecordID());
			Book book=appService.getBookByISBN(bookIN.getISBN());
			UnbookInList.add(bookIN);
			UnbookList.add(book);
		}
		request().getSession().setAttribute("bookList", bookList);
		request().getSession().setAttribute("bookInList", bookInList);
		request().getSession().setAttribute("UnbookList", UnbookList);
		request().getSession().setAttribute("UnbookInList", UnbookInList);
		
		return SUCCESS;
	}

	public String rejectLendRequest() throws Exception{
		/*修改requestBook的状态，并更新用户书币，增加用户书币变化记录*/
		RequestBook requestBook = appService.getRequestBookByRequestID(requestID);
		requestBook.setRequestStatus("reject");
		appService.updateRequestBook(requestBook);
		BookIN bookIN = appService.getBookINByBookRecordID(requestBook.getBookRecordID());
		User user = appService.getUserByUserName(requestBook.getUserName());
		int oldCoinNum = user.getBookCoin();
		user.setBookCoin(oldCoinNum + bookIN.getCoinNumber());
		appService.updateUser(user);
		CoinChangeRecord coinChangeRecord = new CoinChangeRecord();
		coinChangeRecord.setNumber(bookIN.getCoinNumber());
		coinChangeRecord.setReason("return");
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		coinChangeRecord.setTime(nousedate);
		coinChangeRecord.setUserName(requestBook.getUserName());
		appService.addCoinChangeRecord(coinChangeRecord);
		
		//TODO
		String to = appService.getUserByUserName(requestBook.getUserName()).getEmail();
		System.out.println(to);
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("465");
        mailInfo.setValidate(true);
        mailInfo.setFromAddress("se_rebook@163.com");//自己邮箱
        mailInfo.setToAddress(to);//目标邮箱
        mailInfo.setUserName("se_rebook@163.com");//自己邮箱
        //需要开启此邮箱的POP3/SMTP/IMAP服务，具体设置进入邮箱以后在“设置”里进行开启
        mailInfo.setPassword("rebook123");//自己邮箱密码
        //System.out.println("password="+password);
        mailInfo.setSubject("Rebook：图书申请未通过通知");
        String content = "您好！\n  您的申请单号为"+requestBook.getRequestID()+"的申请已被书主拒绝，请尽快登录网站查看其他相关图书借阅信息！\n\n祝好！\nRebook爱书网";

        mailInfo.setContent(content);

        boolean isSend = SimpleMailSender.sendTextMail(mailInfo);

		
		
		/*刷新数据*/
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<BookIN> bookINs = appService.getBookINByUserName(userName);
		List<BookIN> lendBookINs = new ArrayList<BookIN>();
		List<BookIN> sellBookINs = new ArrayList<BookIN>();
		if (bookINs.size() > 0){
			for (int i=0; i<bookINs.size(); i++){
				if ("sell".equals(bookINs.get(i).getType())){
					sellBookINs.add(bookINs.get(i));
				}
				if ("lend".equals(bookINs.get(i).getType())){
					lendBookINs.add(bookINs.get(i));
				}
			}
		}
		List<Book> booksByLendBookINs = new ArrayList<Book>();
		List<Book> booksBySellBookINs = new ArrayList<Book>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				Book book = appService.getBookByISBN(lendBookINs.get(i).getISBN());
				booksByLendBookINs.add(book);
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				Book book = appService.getBookByISBN(sellBookINs.get(i).getISBN());
				booksBySellBookINs.add(book);
			}
		}
		List<RequestBook> allRequestBooks = appService.getAllRequestBooks();
		List<RequestBook> requestBooksByLendBookINs = new ArrayList<RequestBook>();
		List<RequestBook> requestBooksBySellBookINs = new ArrayList<RequestBook>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				int bookRecordID = lendBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksByLendBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				int bookRecordID = sellBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksBySellBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		request().getSession().setAttribute("lendBookINs", lendBookINs);
		request().getSession().setAttribute("sellBookINs", sellBookINs);
		request().getSession().setAttribute("booksByLendBookINs", booksByLendBookINs);
		request().getSession().setAttribute("booksBySellBookINs", booksBySellBookINs);
		request().getSession().setAttribute("requestBooksBySellBookINs", requestBooksBySellBookINs);
		request().getSession().setAttribute("requestBooksByLendBookINs", requestBooksByLendBookINs);
		
		List<CoinChangeRecord> coinChangeRecords = appService.getCoinChangeRecordByUserName(userName);
		request().getSession().setAttribute("coinChangeRecord", coinChangeRecords);
		User refreshUser = appService.getUserByUserName(userName);
		request().getSession().setAttribute("user", refreshUser);
		
		/*传输数据回前台*/
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		return SUCCESS;
	}
	
	
	public String passSellRequest() throws Exception{
		/*通过申请并下单并将对应的bookIN记录改为delete并将书主的书币及书币记录更新*/
		RequestBook requestBook = appService.getRequestBookByRequestID(requestID);
		requestBook.setRequestStatus("accept");
		appService.updateRequestBook(requestBook);
		BookIN bookIN = appService.getBookINByBookRecordID(requestBook.getBookRecordID());
		String ownerName = bookIN.getUserName();
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		BuyOrder buyOrder = new BuyOrder();
		buyOrder.setBookRecordID(requestBook.getBookRecordID());
		buyOrder.setRequestID(requestBook.getRequestID());
		buyOrder.setBuyerName(requestBook.getUserName());
		buyOrder.setBuyAddress(requestBook.getProvince()+requestBook.getCity()+requestBook.getTown()+requestBook.getAddress());
		buyOrder.setBuyPhone(requestBook.getPhone());
		buyOrder.setReceiver(requestBook.getReceiverName());
		buyOrder.setStatus("1");
		buyOrder.setOwnerName(ownerName);
		buyOrder.setCreateTime(nousedate);
		appService.addBuyOrder(buyOrder);
		bookIN.setInStatus("delete");
		appService.updateBookIN(bookIN);
		User ownerUser = appService.getUserByUserName((String)request().getSession().getAttribute("loginUserName"));
		int ownerOldCoin = ownerUser.getBookCoin();
		ownerUser.setBookCoin(ownerOldCoin+bookIN.getCoinNumber());
		appService.updateUser(ownerUser);
		CoinChangeRecord ownerCoinChangeRecord = new CoinChangeRecord();
		ownerCoinChangeRecord.setNumber(bookIN.getCoinNumber());
		ownerCoinChangeRecord.setReason("sell");
		ownerCoinChangeRecord.setTime(nousedate);
		ownerCoinChangeRecord.setUserName(ownerUser.getUserName());
		appService.addCoinChangeRecord(ownerCoinChangeRecord);
		
		String to = appService.getUserByUserName(requestBook.getUserName()).getEmail();
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("465");
        mailInfo.setValidate(true);
        mailInfo.setFromAddress("se_rebook@163.com");//自己邮箱
        mailInfo.setToAddress(to);//目标邮箱
        mailInfo.setUserName("se_rebook@163.com");//自己邮箱
        //需要开启此邮箱的POP3/SMTP/IMAP服务，具体设置进入邮箱以后在“设置”里进行开启
        mailInfo.setPassword("rebook123");//自己邮箱密码
        //System.out.println("password="+password);
        mailInfo.setSubject("图书申请通过通知");
        String content = "您好！\n  您的申请单号为"+requestBook.getBookRecordID()+"的申请已经通过！请尽快登录网站查看相关信息！\n\n祝好！\nRebook爱书网";
        mailInfo.setContent(content);
        boolean isSend = SimpleMailSender.sendTextMail(mailInfo);
		
		/*拒绝其他等待中的请求*/
		List<RequestBook> allRequestBooks = appService.getAllRequestBooks();
		List<RequestBook> myRequestBook = new ArrayList<RequestBook>();
		if (allRequestBooks.size() > 0){
			for (int i=0; i<allRequestBooks.size(); i++){
				if (allRequestBooks.get(i).getBookRecordID() == requestBook.getBookRecordID() && allRequestBooks.get(i).getRequestStatus().equals("waiting")){
					myRequestBook.add(allRequestBooks.get(i));
				}
			}
			if (myRequestBook.size() > 0){
				for (int i=0; i<myRequestBook.size(); i++){
					myRequestBook.get(i).setRequestStatus("reject");
					appService.updateRequestBook(myRequestBook.get(i));
					User user = appService.getUserByUserName(myRequestBook.get(i).getUserName());
					int oldCoinNum = user.getBookCoin();
					user.setBookCoin(oldCoinNum + bookIN.getCoinNumber());
					appService.updateUser(user);
					CoinChangeRecord coinChangeRecord = new CoinChangeRecord();
					coinChangeRecord.setNumber(bookIN.getCoinNumber());
					coinChangeRecord.setReason("return");
					Date date1 = new Date();       
					Timestamp nousedate1 = new Timestamp(date1.getTime());
					coinChangeRecord.setTime(nousedate1);
					coinChangeRecord.setUserName(myRequestBook.get(i).getUserName());
					appService.addCoinChangeRecord(coinChangeRecord);
					mailInfo.setSubject("Rebook：图书申请未通过通知");
				    content = "您好！\n  您的申请单号为"+myRequestBook.get(i).getBookRecordID()+"的申请已被书主拒绝，请尽快登录网站查看其他相关图书借阅信息！\n\n祝好！\nRebook爱书网";
				    mailInfo.setContent(content);
				    SimpleMailSender.sendTextMail(mailInfo);
				}
			}
		}
		
		/*刷新数据*/
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<BookIN> bookINs = appService.getBookINByUserName(userName);
		List<BookIN> lendBookINs = new ArrayList<BookIN>();
		List<BookIN> sellBookINs = new ArrayList<BookIN>();
		if (bookINs.size() > 0){
			for (int i=0; i<bookINs.size(); i++){
				if ("sell".equals(bookINs.get(i).getType())){
					sellBookINs.add(bookINs.get(i));
				}
				if ("lend".equals(bookINs.get(i).getType())){
					lendBookINs.add(bookINs.get(i));
				}
			}
		}
		List<Book> booksByLendBookINs = new ArrayList<Book>();
		List<Book> booksBySellBookINs = new ArrayList<Book>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				Book book = appService.getBookByISBN(lendBookINs.get(i).getISBN());
				booksByLendBookINs.add(book);
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				Book book = appService.getBookByISBN(sellBookINs.get(i).getISBN());
				booksBySellBookINs.add(book);
			}
		}
		allRequestBooks = appService.getAllRequestBooks();
		List<RequestBook> requestBooksByLendBookINs = new ArrayList<RequestBook>();
		List<RequestBook> requestBooksBySellBookINs = new ArrayList<RequestBook>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				int bookRecordID = lendBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksByLendBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				int bookRecordID = sellBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksBySellBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		request().getSession().setAttribute("lendBookINs", lendBookINs);
		request().getSession().setAttribute("sellBookINs", sellBookINs);
		request().getSession().setAttribute("booksByLendBookINs", booksByLendBookINs);
		request().getSession().setAttribute("booksBySellBookINs", booksBySellBookINs);
		request().getSession().setAttribute("requestBooksBySellBookINs", requestBooksBySellBookINs);
		request().getSession().setAttribute("requestBooksByLendBookINs", requestBooksByLendBookINs);
		
		/*传输数据回前台*/
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		return SUCCESS;
	}
	
	public String rejectSellRequest() throws Exception{
		/*修改requestBook的状态，并更新用户书币，增加用户书币变化记录*/
		RequestBook requestBook = appService.getRequestBookByRequestID(requestID);
		requestBook.setRequestStatus("reject");
		appService.updateRequestBook(requestBook);
		BookIN bookIN = appService.getBookINByBookRecordID(requestBook.getBookRecordID());
		User user = appService.getUserByUserName(requestBook.getUserName());
		int oldCoinNum = user.getBookCoin();
		user.setBookCoin(oldCoinNum + bookIN.getCoinNumber());
		appService.updateUser(user);
		CoinChangeRecord coinChangeRecord = new CoinChangeRecord();
		coinChangeRecord.setNumber(bookIN.getCoinNumber());
		coinChangeRecord.setReason("return");
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		coinChangeRecord.setTime(nousedate);
		coinChangeRecord.setUserName(requestBook.getUserName());
		appService.addCoinChangeRecord(coinChangeRecord);
		
		String to = appService.getUserByUserName(requestBook.getUserName()).getEmail();
		System.out.println(to);
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("465");
        mailInfo.setValidate(true);
        mailInfo.setFromAddress("se_rebook@163.com");//自己邮箱
        mailInfo.setToAddress(to);//目标邮箱
        mailInfo.setUserName("se_rebook@163.com");//自己邮箱
        //需要开启此邮箱的POP3/SMTP/IMAP服务，具体设置进入邮箱以后在“设置”里进行开启
        mailInfo.setPassword("rebook123");//自己邮箱密码
        //System.out.println("password="+password);
        mailInfo.setSubject("Rebook：图书申请未通过通知");
        String content = "您好！\n  您的申请单号为"+requestBook.getRequestID()+"的申请已被书主拒绝，请尽快登录网站查看其他相关图书借阅信息！\n\n祝好！\nRebook爱书网";

        mailInfo.setContent(content);

        boolean isSend = SimpleMailSender.sendTextMail(mailInfo);

		
		
		/*刷新数据*/
		String userName = (String)request().getSession().getAttribute("loginUserName");
		List<BookIN> bookINs = appService.getBookINByUserName(userName);
		List<BookIN> lendBookINs = new ArrayList<BookIN>();
		List<BookIN> sellBookINs = new ArrayList<BookIN>();
		if (bookINs.size() > 0){
			for (int i=0; i<bookINs.size(); i++){
				if ("sell".equals(bookINs.get(i).getType())){
					sellBookINs.add(bookINs.get(i));
				}
				if ("lend".equals(bookINs.get(i).getType())){
					lendBookINs.add(bookINs.get(i));
				}
			}
		}
		List<Book> booksByLendBookINs = new ArrayList<Book>();
		List<Book> booksBySellBookINs = new ArrayList<Book>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				Book book = appService.getBookByISBN(lendBookINs.get(i).getISBN());
				booksByLendBookINs.add(book);
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				Book book = appService.getBookByISBN(sellBookINs.get(i).getISBN());
				booksBySellBookINs.add(book);
			}
		}
		List<RequestBook> allRequestBooks = appService.getAllRequestBooks();
		List<RequestBook> requestBooksByLendBookINs = new ArrayList<RequestBook>();
		List<RequestBook> requestBooksBySellBookINs = new ArrayList<RequestBook>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				int bookRecordID = lendBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksByLendBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				int bookRecordID = sellBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksBySellBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		request().getSession().setAttribute("lendBookINs", lendBookINs);
		request().getSession().setAttribute("sellBookINs", sellBookINs);
		request().getSession().setAttribute("booksByLendBookINs", booksByLendBookINs);
		request().getSession().setAttribute("booksBySellBookINs", booksBySellBookINs);
		request().getSession().setAttribute("requestBooksBySellBookINs", requestBooksBySellBookINs);
		request().getSession().setAttribute("requestBooksByLendBookINs", requestBooksByLendBookINs);
		
		List<CoinChangeRecord> coinChangeRecords = appService.getCoinChangeRecordByUserName(userName);
		request().getSession().setAttribute("coinChangeRecord", coinChangeRecords);
		User refreshUser = appService.getUserByUserName(userName);
		request().getSession().setAttribute("user", refreshUser);
		
		/*传输数据回前台*/
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		return SUCCESS;
	}
	

}
