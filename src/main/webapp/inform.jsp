<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="css/common.css" rel="stylesheet">
	<style>
		.profileImg{
			width: 100px;
			float: right;
			margin-left: -30px;
		}
		@font-face {
			font-family: "DoHyeon";
			src: url("fonts/DoHyeon-Regular.ttf");
		}
		body{
			background-color: #FFF3F3;
			font-family: "DoHyeon";
		}
		*{
			margin: 0;
			padding: 0;
		}
		.informBox{
			margin: auto;
			margin-top: 120px;
			width: 900px;
			height: 900px;
			background-color: #FFBDBD;
		}
		.closeBtn{
			font-size: 30px;
			margin: 20px;
			position: relative;
			left: 840px;
			top: 15px;
			text-decoration: none;
			color: black;
		}
		.informTitle{
			font-size: 60px;
			text-align: center;
			margin-top: 50px;
			margin-bottom: 50px;
		}
		
		.btn{
			background-color: white;
			border-radius: 40px;
			width: 300px;
			height: 75px;
			border: none;
			margin: 50px;
		}
		.Logo{
			margin-top: 12px;
			margin-right: 10px;
		}
		.btnText{
			display: inline;
			font-size: 35px;
			font-family: "DoHyeon";
			position: relative;
			bottom: 9px;
		}
		
		.btnArea{
			text-align: center;
			margin-top: 80px;
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
			// alert('before popup function');
			window.open('popup_home.jsp', '팝업 테스트', 'width=400, height=300, top=10, left=10');
		} 
		
		var user_id = "<%=userID%>";
		// alert(user_id);
		
		if(user_id == "null"){
			popup();
			location.href = "index.jsp";
		} 
	</script>
	<div class="header">
		<div class="serviceName">
			Survey Form Service
		</div>
		<img class="profileImg" src="images/profile.png">
		<div class="logInOut">
			Logout
		</div>
		
		<div class="informBox">
			<a class="closeBtn" href="/SurveyForm/home.jsp">
				X
			</a>
			<p class="informTitle">
				응답해 주셔서 감사합니다 :)
			</p>
			
			<br><br><br><br>
			
			<h1 style="text-align: center;">
				면접 일정은 2022.12.22 오후 2시 입니다. <br>
				아래의 줌 링크로 들어오시면 됩니다 :) <br>
				<br>
				줌 링크 : https://us05web.zoom.us/j/~~ <br>
				<br>
				<br>
				면접 때 뵙겠습니다~ <br>
				[문의] 21900806@handong.ac.kr
			</h1>
			
			<div class="btnArea">
				<button class="btn" onclick="location.href='/SurveyForm/home.jsp'">
					<img class="Logo" src="images/homeLogo.png" width="45px;">
					<p class="btnText">Home<p>
				</button>
				
				<button class="btn" onclick="location.href='#'">
					<img class="Logo" src="images/sendLogo.png" width="45px;">
					<p class="btnText">Send to Email<p>
				</button>
			</div>
			
		</div>
	</div>
</body>
</html>