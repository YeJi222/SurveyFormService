<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
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
%>

<%-- <script>
	location.href="/SurveyForm/createSurvey.jsp?surveyID=<%=surveyID%>";
</script> --%>