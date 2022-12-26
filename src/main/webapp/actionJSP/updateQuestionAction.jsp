<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%
	request.setCharacterEncoding("UTF-8");

	int surveyID = 0;
	int questionID = 0;
	String adminID = null;
	String inputData = null;
	
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		adminID = (String) session.getAttribute("userID");
	}
	if(request.getParameter("questionID") != null){
		questionID = Integer.parseInt(request.getParameter("questionID"));
	}
	if(request.getParameter("inputData") != null){
		inputData = request.getParameter("inputData");
	}
	
	
	/* if(inputName.equals("formName")){
		formName = inputData;
	} else if(inputName.equals("formDetail")){
		formDetail = inputData;
	} */
	
	if(adminID == null){
		System.out.println("로그아웃 상태 입니다.");
		
		return;
	}
	
	System.out.print("Survey ID : ");
	System.out.println(surveyID);
	System.out.print("Admin ID : ");
	System.out.println(adminID);
	System.out.print("questionID : ");
	System.out.println(questionID);
	System.out.print("inputData : ");
	System.out.println(inputData);
	
	CreateDAO createDAO = new CreateDAO();
	
	int result = createDAO.updateAdminSurvey(surveyID, questionID, inputData);
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
		script.println("location.href = 'home.jsp';");
		script.println("</script>");
		script.close();
		// return;
	}
	
	int result2 = createDAO.updateQuestionList_content(surveyID, questionID, inputData);
	if(result2 == -1){
		System.out.println("sql error -1");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("location.href = 'create.jsp';");
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
%>