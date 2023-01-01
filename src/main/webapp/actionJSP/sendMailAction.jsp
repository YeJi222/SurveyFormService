<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mail.MailAuth" %>
<%@ page import="mail.MailSend" %>

<%
	int surveyID = 0;
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	
	String imageURL = null;
	if(request.getParameter("imageURL") != null){
		imageURL = request.getParameter("imageURL");
	}
	
	System.out.print("surveyID : ");
	System.out.println(surveyID);
	System.out.print("imageURL : ");
	System.out.println(imageURL);
	
	MailSend ms = new MailSend();
	ms.MailSend(surveyID, imageURL);
	
	System.out.println("메일이 성공적으로 전송되었습니다.");
%>