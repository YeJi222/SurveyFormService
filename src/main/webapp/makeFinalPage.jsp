<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Make Final Page</title>
	<link href="css/common.css" rel="stylesheet">
	<script>
		
	</script>
	<style>
		.serviceName{
			text-decoration: none;
			color: black;
		}
		.profileImg{
			width: 100px;
			float: right;
			margin-left: -30px;
		}
		
		::placeholder {
		 	color: #A0A0A0;
		 	font-family: "DoHyeon";
		}
		
		.finalQuestionDiv{
			background-color: white;
			width: 80%;
			margin: auto;
			margin-top: 50px;
			margin-bottom: 30px;
			padding: 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
		}
		
		.firstSet{
			/* background-color: tomato; */
			width: 100%;
			text-align: left;
			margin-left: 10px;
		}
		.questionDelete{
			display: inline;
			background-color: tomato;
			padding: 15px 18px 15px 18px;
			border-radius: 30px;
			color: white;
			margin-left: 10px;
			font-weight: bold;
		}
		.questionContent{
			/* position: relative;
			right: 245px; */
			background-color: #E3E5F3;
			width: 400px;
			font-size: 24px;
			border: none;
			border-radius: 10px;
			padding: 10px;
			font-family: "DoHyeon";
		}
		.questionOpt{
			float: right;
			background-color: #D4DEFF;
			height: 40px;
			width: 150px;
			border: none;
			border-radius: 10px;
			padding: 10px;
			text-align: center;
			font-family: "DoHyeon";
			font-size: 20px;
			appearance: none;
		}
		.finishOpt{
			float: right;
			margin-right: 30px;
			background-color: #D4DEFF;
			height: 23px;
			width: 130px;
			border: none;
			border-radius: 10px;
			padding: 10px;
			text-align: center;
			font-family: "DoHyeon";
			font-size: 20px;
			appearance: none;
			
		}
		
		.questionText{
			font-size: 24px;
			width: 98%;
			height: 40px;
			font-family: "DoHyeon";
			margin-top: 20px;
			border: none;
			border-bottom: 2px solid lightgrey;
		}
		
		.finishTextarea{
			width: 95%;
			background-color: #F4F5FF;
			margin-top: 20px;
			border: none;
			resize: none;
			height: 300px;
			border-radius: 15px;
			padding: 20px;
			font-size: 23px;
			
		}
		textarea::placeholder{
			font-size: 23px;
		}
		
		.shareLinkDiv{
			background-color: white;
			width: 80%;
			margin: auto;
			margin-bottom: 100px;
			padding: 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
		}
		.linkText{
			font-size: 25px;
			margin-bottom: 10px;
		}
		.shareLinkText{
			font-size: 30px;
			color: darkgrey;
		}
		
		.submitBtn{
			font-family: "DoHyoen";
			position: relative;
			bottom: 0;
			color: white;
			font-size: 30px;
			font-weight: bold;
			border-radius: 20px;
			width: 350px;
			height: 60px;
			border: none;
			background-color: #D5DEFF;
		}
		.footer{
			width: 100%;
			position: fixed;
			bottom: 30px;
		}
		
	</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
			userID = (String) session.getAttribute("userID");
		}
		
		int surveyID = 0;
		if(request.getParameter("surveyID") != null){
			surveyID = Integer.parseInt(request.getParameter("surveyID"));
		}
	%>
	<script>
		function popup(){
			// alert('before popup function');
			window.open('popup_home.jsp', '팝업 테스트', 'width=400, height=300, top=10, left=10');
		} 
		
		// alert("<%=userID%>");
		var user_id = "<%=userID%>";
		// alert(user_id);
		
		if(user_id == "null"){
			popup();
			location.href = "index.jsp";
		} 
	</script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<div class="header">
		<a href="home.jsp" class="serviceName">
			Survey Form Service
		</a>
		<img class="profileImg" src="images/profile.png">
		<div class="logInOut" onclick="location.href='logoutAction.jsp'">
			Logout
		</div>
	</div>
	
	<div class="finalQuestionDiv">
		<div class="firstSet">
			<input type="text" class="questionContent" placeholder="폼 작성 완료 후, 페이지 제목" name="questionName">
			<div class="finishOpt">
				Finish
			</div>
			
			<textarea class="finishTextarea" placeholder="폼 작성 완료 후, 페이지 내용"></textarea>
			
		</div>
	</div>
	
	<div class="shareLinkDiv">
		<div class="linkText">Survey Form Link</div>
		<div class="shareLinkText">
			http://localhost:8080/SurveyForm/enterForm.jsp?surveyID=<%=surveyID %>
		</div>
	</div>
</body>
</html>