<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");

	int surveyID = 0;
	String adminID = null;
	String inputData = null;
	String commonType = null;
	
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		adminID = (String) session.getAttribute("userID");
	}
	if(request.getParameter("inputData") != null){
		inputData = request.getParameter("inputData");
	}
	if(request.getParameter("commonType") != null){
		commonType = request.getParameter("commonType");
	}
	
	if(adminID == null){
		System.out.println("로그아웃 상태 입니다.");
		
		return;
	}
	
	QuestionDAO updateDAO = new QuestionDAO();
	
	int result = updateDAO.updateResultCommonText(surveyID, commonType, inputData);
	if(result == -1){
		System.out.println("sql error -1");
	} else{
		System.out.println("sql success");
	}
%>