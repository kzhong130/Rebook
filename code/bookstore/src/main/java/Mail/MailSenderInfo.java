package Mail;

/*
import java.util.Properties;

public class MailSenderInfo {
    //发送邮件服务器IP
    private String mailServerHost ;
    //发送邮件服务器端口
    private String mailServerPort = "25";
    //邮件发送地址
    private String fromAddress;
    //邮件接受者地址
    private String toAddress;
    //发送邮件服务器的登录用户名
    private String userName;
    //发送邮件服务器的登录密码
    private String password;
    //是否需要身份验证
    private boolean validate = false;
    //邮件主题
    private String subject;
    //邮件的文本内容
    private String content;
    //邮件附件的文件名
    private String[] attachFileNames;
    //发送人的邮件信息,在创建Session是使用
    public Properties getProperties(){
        Properties p = new Properties();
        p.put("mail.smtp.host", this.mailServerHost);
        p.put("mail.smtp.port", this.mailServerPort);
        p.put("mail.smtp.auth", validate ? "true" : "false");
        return p;
    }
    public String getMailServerHost() {
        return mailServerHost;
    }
    public void setMailServerHost(String mailServerHost) {
        this.mailServerHost = mailServerHost;
    }
    public String getMailServerPort() {
        return mailServerPort;
    }
    public void setMailServerPort(String mailServerPort) {
        this.mailServerPort = mailServerPort;
    }
    public String getFromAddress() {
        return fromAddress;
    }
    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }
    public String getToAddress() {
        return toAddress;
    }
    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public boolean isValidate() {
        return validate;
    }
    public void setValidate(boolean validate) {
        this.validate = validate;
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
    public String[] getAttachFileNames() {
        return attachFileNames;
    }
    public void setAttachFileNames(String[] attachFileNames) {
        this.attachFileNames = attachFileNames;
    } 
}

*/

import com.sun.mail.util.MailSSLSocketFactory;  
import java.security.GeneralSecurityException;  
import java.util.ArrayList;      
import java.util.Properties;  
import java.util.Vector;  
import java.util.logging.Level;  
import java.util.logging.Logger;  
public class MailSenderInfo {      
    // 发送邮件的服务器的IP和端口      
    private String mailServerHost;      
    private String mailServerPort = "465";      
    // 邮件发送者的地址      
    private String fromAddress;      
    // 邮件接收者的地址      
    private String toAddress;      
    // 登陆邮件发送服务器的用户名和密码      
    private String userName;      
    private String password;      
    // 是否需要身份验证      
    private boolean validate = false;      
    //是否需要SSL加密  
    private boolean ssl = true;  
    // 邮件主题      
    private String subject;      
    // 邮件的文本内容      
    private String content;      
    // 邮件附件的文件名      
    private Vector  attachFileNames = new Vector();;        
      
         
    public Properties getProperties(){      
      Properties p = new Properties();      
      p.put("mail.smtp.ssl.enable",ssl ? "true" : "false");  
      p.put("mail.smtp.host", this.mailServerHost);      
      p.put("mail.smtp.port", this.mailServerPort);      
      p.put("mail.smtp.auth", validate ? "true" : "false");     
      if(ssl){  
            MailSSLSocketFactory sf;    
              try {  
                  sf = new MailSSLSocketFactory();  
                  sf.setTrustAllHosts(true);    
                  p.put("mail.smtp.ssl.socketFactory", sf);   
              } catch (GeneralSecurityException ex) {  
                  ex.printStackTrace();  
              }  
      }  
      return p;      
    }      
     
      
      
    public String getMailServerHost() {      
      return mailServerHost;      
    }      
    public void setMailServerHost(String mailServerHost) {      
      this.mailServerHost = mailServerHost;      
    }     
    public String getMailServerPort() {      
      return mailServerPort;      
    }     
    public void setMailServerPort(String mailServerPort) {      
      this.mailServerPort = mailServerPort;      
    }     
    public boolean isValidate() {      
      return validate;      
    }     
    public boolean isSSL(){  
        return ssl;  
    }  
    public void setValidate(boolean validate) {      
      this.validate = validate;      
    }     
    public void setSSL(boolean ssl){  
        this.ssl = ssl;  
    }  
    public Vector  getAttachFileNames() {      
      return attachFileNames;      
    }     
    public void setAttachFileNames(Vector fileNames) {      
      this.attachFileNames = fileNames;      
    }     
    public void addAttachFileNames(String fileName) {   
        this.attachFileNames.add(fileName);  
    }  
    public String getFromAddress() {      
      return fromAddress;      
    }      
    public void setFromAddress(String fromAddress) {      
      this.fromAddress = fromAddress;      
    }     
    public String getPassword() {      
      return password;      
    }     
    public void setPassword(String password) {      
      this.password = password;      
    }     
    public String getToAddress() {      
      return toAddress;      
    }      
    public void setToAddress(String toAddress) {      
      this.toAddress = toAddress;      
    }      
    public String getUserName() {      
      return userName;      
    }     
    public void setUserName(String userName) {      
      this.userName = userName;      
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
    public void setContent(String textContent) {      
      this.content = textContent;      
    }      
}     

