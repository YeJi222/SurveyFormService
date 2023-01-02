package mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import create.CreateDAO;
import create.CreateDTO;
import java.util.ArrayList;
import java.util.Base64;

public class MailSend {
    public void MailSend(int surveyID, String imageURL, String userEmail) throws Exception {
    	System.out.print("surveyID : ");
    	System.out.println(surveyID);
    	System.out.print("imageURL : ");
    	System.out.println(imageURL);
    	System.out.print("userEmail : ");
    	System.out.println(userEmail);
    	
    	String formName = null;
    	CreateDAO dao = new CreateDAO();
		ArrayList<CreateDTO> list = dao.getSurveyInfoDTO(surveyID);
		
		formName = list.get(0).getFormName();
		
		System.out.print("formName : ");
    	System.out.println(formName);
    	
    	System.out.println("Mail Send");
    	
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.transport.protocol", "smtp");

        Authenticator auth = new MailAuth();
        Session session = Session.getDefaultInstance(prop, auth);
        session.setDebug(false);
        Transport transport = session.getTransport();
        
        MimeMessage msg = new MimeMessage(session);
        msg.setSentDate(new Date());
        msg.setFrom(new InternetAddress("21900806@handong.ac.kr", "SurveyForm 관리자"));
        InternetAddress to = new InternetAddress(userEmail);         
        msg.setRecipient(Message.RecipientType.TO, to);            
        msg.setSubject("Survey Form Service - '" + formName + "'", "UTF-8");     
        
        MimeMultipart multipart = new MimeMultipart("related");
        BodyPart messageBodyPart = new MimeBodyPart();
        
        final String bodyContent = String.join(
            System.getProperty("line.separator"),
            "<h3>" + "'" + formName + "' 응답 안내글입니다 :)" + "</h3>" + 
            "<img width='90%' src=\"cid:image\" alt='img'>"
        );
        messageBodyPart.setContent(bodyContent, "text/html;charset=UTF-8");
        multipart.addBodyPart(messageBodyPart);
        
        messageBodyPart = new MimeBodyPart();
        imageURL = imageURL.split(",")[1];
        byte[] rawImage = Base64.getDecoder().decode(imageURL);
        DataSource fds = new ByteArrayDataSource(rawImage, "image/*"); // new FileDataSource(imageURL);
        messageBodyPart.setDataHandler(new DataHandler(fds));
        messageBodyPart.setFileName("SurveyFormService.jpg");
        messageBodyPart.setHeader("Content-ID", "<image>");
        
        multipart.addBodyPart(messageBodyPart);
        msg.setContent(multipart);

        transport.connect();
        transport.sendMessage(msg, msg.getRecipients(Message.RecipientType.TO));
        transport.close();
    }
}