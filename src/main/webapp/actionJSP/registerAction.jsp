<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="userInfo.UserDTO" %>
<%@ page import="userInfo.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String userPW = null;
	String userEmail = null;
	
	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPW") != null){
		userPW = request.getParameter("userPW");
	}
	if(request.getParameter("userEmail") != null){
		userEmail = request.getParameter("userEmail");
	}
	
	if(userID == null || userPW == null || userEmail == null){
		System.out.println("Register 페이지에서 입력되지 않은 사항이 있습니다.");
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID, userPW, userEmail));
	if(result == -1){
%>
			<div id="alertContent">이미 존재하는 아이디입니다</div>
<%
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("window.open('popup.jsp', '팝업 테스트', 'width=400, height=300, top=10, left=10')");
		// script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return; 
	} else{
%>
			<div id="alertContent">회원가입 완료! 자동으로 로그인이 되었습니다 :)</div>
<%
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("alert('회원가입 완료! 자동으로 로그인이 되었습니다:) ');");
		script.println("location.href = 'home.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>