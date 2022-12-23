<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
		
		.formNameSection{
			margin-top: -140px;
			text-align: center;
			font-size: 40px;
		}
		
		.responseNumDiv{
			background-color: white;
			width: 80%;
			margin: auto;
			margin-top: 20px;
			padding: 10px 20px 10px 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
			font-size: 30px;
		}
		.questionDiv{
			background-color: white;
			width: 80%;
			margin: auto;
			margin-top: 20px;
			padding: 10px 20px 10px 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
			font-size: 30px;
		}
		.textAns{
			font-size: 22px;
			margin-top: 10px;
		}
		.ansResult{
			color: tomato;
		}
		
		.okBtn{
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
	<script>
		
	</script>
	
	<div class="header">
		<a href="home.jsp" class="serviceName">
			Survey Form Service
		</a>
		<img class="profileImg" src="images/profile.png">
		<div class="logInOut" onclick="location.href='logoutAction.jsp'">
			Logout
		</div>
	</div>
	<div class="middle">
		<form action="./createSurveyAction.jsp">
			<div class="formNameSection">
				"한스트 Staff 지원서" Result
			</div>
			
			<div class="responseNumDiv">
				<p style="text-align: left;"> 응답 3명 </p>
			</div>
			
			<div class="questionDiv">
				<p style="text-align: left;"> Q1. 지원동기를 작성하세요. </p>
				<div class="textAns" style="text-align: left;">
				[A1] ~~~ 경험을 해보고 싶어 지원하게 되었습니다.<br>
				[A2] ~~~ 역할을 해보고 싶어 지원하게 되었습니다.<br>
				[A3] ~~~ 를 배워보고 싶어 지원하게 되었습니다.<br>
				</div>
			</div>
			
			<div class="questionDiv">
				<p style="text-align: left;"> Q2. 지원할 부서는 어디입니까? </p>
				<div class="textAns" style="text-align: left;">
					● 기획팀 <span class="ansResult">&nbsp;&nbsp;0명</span><br>
					● 데코팀 <span class="ansResult">&nbsp;&nbsp;1명</span><br>
					● 새섬팀 <span class="ansResult">&nbsp;&nbsp;0명</span><br>
					● 운영팀 <span class="ansResult">&nbsp;&nbsp;2명</span><br>
				</div>
			</div>
			<div class="questionDiv">
				<p style="text-align: left;"> Q3. 관심있는 분야는 어떤 것입니까?(복수 선택 가능) </p>
				<div class="textAns" style="text-align: left;">
					■ 분야1 <span class="ansResult">&nbsp;&nbsp;1명</span><br>
					■ 분야2 <span class="ansResult">&nbsp;&nbsp;2명</span><br>
					■ 분야3 <span class="ansResult">&nbsp;&nbsp;1명</span><br>
					■ 분야4 <span class="ansResult">&nbsp;&nbsp;3명</span><br>
				</div>
			</div>
			
			
		</form>
		<div class="footer">
			<button type="submit" class="okBtn" onclick="location.href='/SurveyForm/home.jsp'">OK</button>
		</div>
		
		
	</div>
	
</body>
</html>