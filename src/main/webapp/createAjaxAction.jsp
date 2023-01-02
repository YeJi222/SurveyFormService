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
	
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		adminID = (String) session.getAttribute("userID");
	}
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	
	if(adminID == null){
		System.out.println("입력되지 않은 사항이 있습니다.");
		
		return;
	}
	
	System.out.print("Survey ID : ");
	System.out.println(surveyID);
	System.out.print("Admin ID : ");
	System.out.println(adminID);
	
	CreateDAO createDAO = new CreateDAO();
	
	int result = createDAO.insertAdminList(surveyID, adminID);
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
		script.println("location.href = '/SurveyForm/createSurvey.jsp?surveyID=" + surveyID + "';");
		script.println("</script>");
		script.close();
		// return;
	}
	
	QuestionDAO questionDAO = new QuestionDAO();
	
	// resultContent 테이블에 공통 질문 삽입 - commonTitle
	int result2 = questionDAO.insertCommonResult(surveyID, adminID, "commonTitle", "<title>해당 Form에 대한 안내 페이지입니다</title>");
	if(result2 == -1){
		System.out.println("sql error -1");
	} else{
		System.out.println("sql success");
	}
	
	// resultContent 테이블에 공통 질문 삽입 - commonContent
	int result3 = questionDAO.insertCommonResult(surveyID, adminID, "commonContent", "<headerText>응답해주셔서 감사합니다 :)</headerText>");
	if(result3 == -1){
		System.out.println("sql error -1");
	} else{
		System.out.println("sql success");
	}
%>

<%-- <script>
	location.href="/SurveyForm/createSurvey.jsp?surveyID=<%=surveyID%>";
</script> --%>