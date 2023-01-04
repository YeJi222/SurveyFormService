<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userInfo.UserDTO" %>
<%@ page import="userInfo.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/common.css" rel="stylesheet">
	<title>Survey Form Service</title>
	<style>
		.surveyImg{
			width: 400px;
		}
		.loginBtn{
			display: block;
			border: none;
			background-color: #FF8888;
			font-size: 30px;
			width: 400px;
			height: 65px;
			color: white;
			border-radius: 20px;
			margin: auto;
			margin-top: 60px;
			line-height: 65px;
			text-decoration:none;
		}
		.registerBtn{
			background-color: #A4B2FF;
			border: none;
			display: block;
			font-size: 30px;
			width: 400px;
			height: 65px;
			color: white;
			border-radius: 20px;
			margin: auto;
			margin-top: 30px;
			line-height: 65px;
			text-decoration:none;
		}
		
	</style>
	
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
			userID = (String) session.getAttribute("userID");
		}
	%>
	<script>
		function popup(){
			var alertContent = "이미 로그인 된 상태입니다. <br>Home 화면으로 이동합니다 :)";
			window.open('popup.jsp?alertContent='+alertContent, '팝업 테스트', 'width=400, height=300, top=10, left=10');
		} 
		
		// alert("<%=userID%>");
		var user_id = "<%=userID%>";
		// alert(user_id);
		
		if(user_id != "null"){
			popup();
			location.href = "home.jsp";
		} 
	</script>
	
	<div class="header">
		<div class="serviceName">
			Survey Form Service
		</div>
		<div class="logInOut">
			Welcome :)
		</div>
	</div>
	<div class="middle">
		<img class="surveyImg" src="images/surveyImg.png">
		<a class="loginBtn" href="/SurveyForm/login.jsp">
			Login
		</a>
		<a class="registerBtn" href="/SurveyForm/register.jsp">
			Register
		</a>
	</div>
</body>
</html>