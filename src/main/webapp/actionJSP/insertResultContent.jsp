<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
	int surveyID = 0;
	int questionID = 0;
	String adminID = null;
	
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	if(request.getParameter("questionID") != null){
		questionID = Integer.parseInt(request.getParameter("questionID"));
	}
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		adminID = (String) session.getAttribute("userID");
	}
	
	if(adminID == null){
		System.out.println("로그아웃 상태입니다.");
		
		return;
	}
	
	CreateDAO dao6 = new CreateDAO();
	String questionContent = dao6.getQuestionContent(surveyID, questionID);
	
	System.out.print("questionContent : ");
	System.out.println(questionContent);
	
	QuestionDAO radio_dto = new QuestionDAO();
	ArrayList<QuestionDTO> radioQuestion = radio_dto.getRadioQuestion(surveyID, questionID);
	
	System.out.print("option 개수 : ");
	int radioOptionSize = radioQuestion.size();
	System.out.println(radioOptionSize);
	
	int[] optionID = new int[radioOptionSize];
	String[] optionContent = new String[radioOptionSize];
	
	for(int i = 0 ; i < radioOptionSize ; i++){
		ArrayList<QuestionDTO> radioOption = radio_dto.getRadioOption(surveyID, questionID);
		
		optionID[i] = radioOption.get(i).getOptionID();
		optionContent[i] = radioOption.get(i).getOptionContent();
		
		System.out.print("optionID : ");
		System.out.println(optionID[i]);
		System.out.print("optionContent : ");
		System.out.println(optionContent[i]);
		
		// 해당 surveyID, questionID가 없으면 insert
		QuestionDAO resultDAO = new QuestionDAO();
		
		int check = resultDAO.getResultContent(surveyID, questionID);
		
		if(check != radioOptionSize){
			// resultContent 테이블에 insert 
			int result = resultDAO.insertResultContent(surveyID, adminID, questionID, questionContent, optionID[i], optionContent[i]);
			if(result == -1){
				System.out.println("sql error -1");
			} else{
				// System.out.println("sql success");
			}
		}
	}
	
	
	
	
	
%>

<!-- <div>fdfefdfd</div> -->