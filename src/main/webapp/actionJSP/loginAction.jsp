<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="userInfo.UserDTO" %>
<%@ page import="userInfo.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPW = null;
	
	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPW") != null){
		userPW = request.getParameter("userPW");
	}
	if(userID == null || userPW == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userID, userPW);
	if(result == 1){
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.print(0); // 로그인 성공 
		script.close();
		return;
	} else if (result == 0){
		PrintWriter script = response.getWriter();
		script.print(1); // 비밀번호 틀림 
		script.close(); 
		return;
	} else if (result == -1){
		PrintWriter script = response.getWriter();
		script.print(2); // 아이디 존재하지 않음 
		script.close();
		return;
	} else if (result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("alert('데이터베이스 오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>