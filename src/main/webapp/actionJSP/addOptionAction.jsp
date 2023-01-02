<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%
	request.setCharacterEncoding("UTF-8");

	int surveyID = 0;
	String adminID = null;
	int questionID = 0;
	String type = null;
	int optionID = 0;
	String questionContent = null;
	
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		adminID = (String) session.getAttribute("userID");
	}
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	if(request.getParameter("questionID") != null){
		questionID = Integer.parseInt(request.getParameter("questionID"));
	}
	if(request.getParameter("type") != null){
		type = request.getParameter("type");
	}
	if(request.getParameter("optionID") != null){
		optionID = Integer.parseInt(request.getParameter("optionID"));
	}
	if(request.getParameter("questionContent") != null){
		questionContent = request.getParameter("questionContent");
	}
	
	if(adminID == null){
		System.out.println("로그아웃 상태입니다.");
		
		return;
	}
	
	CreateDAO createDAO = new CreateDAO();
	
	int result = createDAO.insertOptionType(surveyID, adminID, questionID, type, optionID);
	if(result == -1){
		System.out.println("sql error -1");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'create.jsp';");
		script.println("</script>");
		script.close();
		
		// return;
	} else{
		session.setAttribute("userID", adminID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("location.href = 'home.jsp';");
		script.println("</script>");
		script.close();
		// return;
	}
	
	QuestionDAO questionDAO = new QuestionDAO();
	
	// 해당 surveyID, queestionID가 있으면 insert 
	int result2 = questionDAO.getResultQuestionExist(surveyID, questionID);
	
	System.out.print("surveyID : ");
	System.out.println(surveyID);
	System.out.print("questionID : ");
	System.out.println(questionID);
	System.out.print("question Exist : ");
	System.out.println(result2);
	
	if(result2 != 0){
		System.out.println("resultContent 테이블에 존재");
		
		int result3 = questionDAO.insertResultContent_option(surveyID, adminID, questionID, questionContent, optionID);
		if(result3 == -1){
			System.out.println("sql error -1");
		} else{
			session.setAttribute("userID", adminID);
		}
	} else{
		System.out.println("resultContent insert!");
	}
%>