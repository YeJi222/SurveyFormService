<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Page</title>
	<style>
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
		.registerBox{
			margin: auto;
			margin-top: 250px;
			width: 650px;
			height: 650px;
			background-color: #FFBDBD;
		}
		.closeBtn{
			font-size: 30px;
			margin: 20px;
			position: relative;
			left: 595px;
			top: 15px;
			text-decoration: none;
			color: black;
		}
		.registerTitle{
			font-size: 60px;
			text-align: center;
			margin-top: 5px;
			margin-bottom: 40px;
		}
		.idSection{
			margin-left: 25px;
			margin-bottom: -10px;
		}
		.pwSection{
			margin-left: 25px;
			margin-bottom: -10px;
		}
		.emailSection{
			margin-left: 25px;
			margin-bottom: -10px;
		}
		.emoji{
			width: 90px;
			height: 90px;
			/* background-color: red; */
		}
		#idBlank{
			position: relative;
			bottom: 30px;
			width: 470px;
			height: 70px;
			background-color: #EEE0E0;
			border-radius: 15px;
			border: none;
			padding-left: 20px;
			font-size: 2em;
		}
		#pwBlank{
			position: relative;
			bottom: 30px;
			width: 470px;
			height: 70px;
			background-color: #EEE0E0;
			border-radius: 15px;
			border: none;
			padding-left: 20px;
			font-size: 2em;
		}
		#emailBlank{
			position: relative;
			bottom: 30px;
			width: 470px;
			height: 70px;
			background-color: #EEE0E0;
			border-radius: 15px;
			border: none;
			padding-left: 20px;
			font-size: 2em;
		}
		::placeholder {
		 	color: #AAA4A4;
		}
		.registerBtnArea{
			text-align: center;
		}
		.registerBtn{
			color: white;
			background-color: #F86B6B;
			border-radius: 40px;
			font-size: 38px;
			text-align: center;
			margin-bottom: 5px;
			/* float: right; */
			/* margin-right: 40px; */
			margin-top: 10px;
			width: 230px;
			height: 55px;
			border: none;
			font-family: "DoHyeon";
		}
		.goToLogin{
			text-align: center;
		}
		.loginHref{
			color: #0C3E8A;
			font-size: 40px;
			text-decoration: none;
			position: relative;
			top: -15px;
		}
		.hrLeft{
			margin-left: 50px;
			width: 38%;
			height: 2px;
			background-color: #969090;
			float: left;
		}
		.hrRight{
			margin-right: 50px;
			width: 38%;
			height: 2px;
			background-color: #969090;
			float: right;
		}
		.orText{
			font-size: 30px;
			position: relative;
			bottom: 20px;
			color: #969090;
		}
		.alertContent{
			text-align: center;
			color: red;
			font-size: 30px;
		}
		#alertArea{
			position: relative;
			top: 200px;
			color: tomato;
			font-size: 25px;
			text-align: center;
		}
	</style>
</head>
<body>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function popup(){
			var alertContent = "회원가입 완료! 자동으로 로그인이 되었습니다 :)";
			window.open('popup.jsp?alertContent='+alertContent, '팝업', 'width=450, height=330, top=10, left=10');
		}
	
		function checkRegister(){
			var idBlank = document.getElementById("idBlank").value;
			var pwBlank = document.getElementById("pwBlank").value;
			var emailBlank = document.getElementById("emailBlank").value;
			
			$.ajax({
				url : "actionJSP/registerAction.jsp",
				type : "post",
				async: false,
				data : {"userID" : idBlank, "userPW" : pwBlank, "userEmail" : emailBlank},
				dataType : "text",
				success : function(result){
					if(result == '0'){ // 회원가입 완료 
						popup();
						location.href = 'home.jsp'
					} else if(result == '1'){ // 이미 존재하는 아이디 
						document.getElementById("alertArea").innerHTML = "# 이미 존재하는 아이디입니다";
					} 
				},
				error: function(error){
					console.log("Fail to login");
				}
			})
		}
	</script>
	<div id="alertArea"></div>
	<div class="registerBox">
		<a class="closeBtn" href="/SurveyForm/index.jsp">
			X
		</a>
		<p class="registerTitle">
			Register
		</p>
		<!-- <form action="actionJSP/registerAction.jsp" method="post"> -->
			<div class="idSection">
				<img class="emoji" src="images/idImg.png">
				<input id="idBlank" type="text" placeholder="ID" name="userID" required>
			</div>
			<div class="pwSection">
				<img class="emoji" src="images/pwImg.png">
				<input id="pwBlank" type="password" placeholder="Password" name="userPW" required>
			</div>
			<div class="emailSection">
				<img class="emoji" src="images/email.png">
				<input id="emailBlank" type="email" placeholder="Email Address" name="userEmail" required>
			</div>
			<div class="registerBtnArea">
				<button class="registerBtn" onclick="checkRegister()">
					Register
				</button>
			</div> 
		<!-- </form> -->
		<br>
		<hr class="hrLeft">&nbsp;&nbsp;
		<span class="orText">or</span>
		<hr class="hrRight">
		
		<div class="goToLogin">
			<a class="loginHref" href="/SurveyForm/login.jsp">
				Go To Login
			</a>
		</div> 
	</div>
</body>
</html>