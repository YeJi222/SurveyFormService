package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{
	PasswordAuthentication password_auth;
	
    public MailAuth() {
        String mail_ID = "21900806@handong.ac.kr";
        String mail_PW = "dedvwvcpmfmbltwl";
        
        password_auth = new PasswordAuthentication(mail_ID, mail_PW);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return password_auth;
    }
}
