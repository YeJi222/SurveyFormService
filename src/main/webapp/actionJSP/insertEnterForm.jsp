<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.EnterDTO" %>
<%@ page import="create.EnterDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%
	request.setCharacterEncoding("UTF-8");

	int surveyID = 0;
	String enterID = null;
	String formName = null;
	
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	if(request.getParameter("enterID") != null){
		enterID = request.getParameter("enterID");
	}
	if(request.getParameter("formName") != null){
		formName = request.getParameter("formName");
	}
	
	EnterDAO enterDAO = new EnterDAO();
	
	int result = enterDAO.findDuplicateSurvey(surveyID, enterID);
	/* System.out.print("result : ");
	System.out.println(result); */
	
	// 0이면 이전에 응답하지 않은 경우, -1이 아니면 이전에 응답한 경우 
	if(result == 0){
		System.out.println("응답 내역 없음 :)");
		
		PrintWriter script = response.getWriter();
		// script.println("<script>");
		script.println(result); // 0
		// script.println("</script>");
		script.close(); 
		
		int result2 = enterDAO.insertAdminList(surveyID, enterID, formName);
		if(result2 == -1){
			// System.out.println("이미 응답한 설문조사입니다 :)");
			// PrintWriter script = response.getWriter();
			script.println("<script>");
			// script.println("location.href = 'create.jsp';");
			script.println("</script>");
			script.close();
			
			// return;
		} else{
			// PrintWriter script = response.getWriter();
			script.println("<script>");
			// script.print(result);
			// script.println("location.href = '/SurveyForm/home.jsp;'");
			script.println("</script>");
			script.close();
			// return;
		}
	} else{
		PrintWriter script = response.getWriter();
		// script.println("<script>");
		script.println(result); // 1
		// script.println("</script>");
		script.close(); 
		
		
		System.out.println("이미 응답한 설문조사 :)");
	}
%>
