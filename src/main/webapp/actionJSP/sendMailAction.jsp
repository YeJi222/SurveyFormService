<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mail.MailAuth" %>
<%@ page import="mail.MailSend" %>
<%@ page import="userInfo.UserDTO" %>
<%@ page import="userInfo.UserDAO" %>
<%
	int surveyID = 0;
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	
	String imageURL = null;
	if(request.getParameter("imageURL") != null){
		imageURL = request.getParameter("imageURL");
	}
	
	String userID = null;
	
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		userID = (String) session.getAttribute("userID");
	}
	
	UserDAO userDAO = new UserDAO();
		
	String userEmail = userDAO.getUserEmail(userID);
	
	System.out.print("surveyID : ");
	System.out.println(surveyID);
	System.out.print("userEmail : ");
	System.out.println(userEmail);
	System.out.print("imageURL : ");
	System.out.println(imageURL);
	
	MailSend ms = new MailSend();
	ms.MailSend(surveyID, imageURL, userEmail);
	
	System.out.println("메일이 성공적으로 전송되었습니다.");
%>