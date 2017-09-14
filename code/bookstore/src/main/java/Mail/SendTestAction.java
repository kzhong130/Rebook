package Mail;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import com.opensymphony.xwork2.ActionSupport;
import Mail.MailSenderInfo;
import Mail.SimpleMailSender;
import action.BaseAction;
import model.User;
import service.AppService;

public class SendTestAction extends BaseAction {
    private static final long serialVersionUID = 1L;
    private String to;
    private String qq;
    private String password;
    private String subject;
    private String content;
    
	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService=appService;
	}
	
    private String name;
    
    public String getName(){
    	return name;
    }

    public void setName(String name){
    	this.name = name;
    }
    
    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }
    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String execute() throws Exception {
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
        mailInfo.setSubject(subject);
        mailInfo.setContent(content);

        boolean isSend = SimpleMailSender.sendTextMail(mailInfo);

        /*HttpServletResponse response;
        PrintWriter out = response.getWriter();*/

        if(isSend){
            return SUCCESS;
            //return out.write("<script>alert('发送成功！');history.back();</script>");

        }
        addActionError("发送失败!");
        return INPUT;
    }
    
    public String verify() throws Exception {
    	//System.out.println(to);
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
        mailInfo.setSubject("欢迎注册Rebook爱书网");
        int min=0;
        int max=999999;
        int randNum = min + (int)(Math.random() * ((max - min) + 1));
        mailInfo.setContent("您的验证码为\n"+randNum);
        
        boolean isSend = SimpleMailSender.sendTextMail(mailInfo);
		request().getSession().setAttribute("verifyEmail", to);

        
        /*HttpServletResponse response;
        PrintWriter out = response.getWriter();*/
        System.out.println(isSend);
        if(isSend){
        	String temp = String.valueOf(randNum);
			request().getSession().setAttribute("verification", temp);
			String a=(String) request().getSession().getAttribute("verification");
			System.out.println(a);
            return SUCCESS;
            //return out.write("<script>alert('发送成功！');history.back();</script>");

        }
        addActionError("发送失败!");
        return INPUT;
    }
    
    public String find() throws Exception {
    	//System.out.println(to);
    	User tempu = appService.getUserByUserName(name);
    	System.out.println(name);
    	if(tempu == null) return SUCCESS;
    	String mto = tempu.getEmail();
    	
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("465");
        mailInfo.setValidate(true);
        mailInfo.setFromAddress("se_rebook@163.com");//自己邮箱
        mailInfo.setToAddress(mto);//目标邮箱
        mailInfo.setUserName("se_rebook@163.com");//自己邮箱
        //需要开启此邮箱的POP3/SMTP/IMAP服务，具体设置进入邮箱以后在“设置”里进行开启
        mailInfo.setPassword("rebook123");//自己邮箱密码
        //System.out.println("password="+password);
        mailInfo.setSubject("欢迎使用Rebook爱书网找回密码功能");
        int min=0;
        int max=999999;
        int randNum = min + (int)(Math.random() * ((max - min) + 1));
        mailInfo.setContent("您的验证码为\n"+randNum);
        
        boolean isSend = SimpleMailSender.sendTextMail(mailInfo);
		request().getSession().setAttribute("verifyEmail", mto);
		request().getSession().setAttribute("userName",name);
        
        /*HttpServletResponse response;
        PrintWriter out = response.getWriter();*/
        System.out.println(isSend);
        if(isSend){
        	String temp = String.valueOf(randNum);
			request().getSession().setAttribute("verification", temp);
			String a=(String) request().getSession().getAttribute("verification");
			System.out.println(a);
            return SUCCESS;
            //return out.write("<script>alert('发送成功！');history.back();</script>");

        }
        addActionError("发送失败!");
        return INPUT;
    }

    
}