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
			margin-bottom: 50px;
		}
		.idSection{
			margin-left: 25px;
		}
		.pwSection{
			margin-left: 25px;
		}
		.emoji{
			width: 90px;
			height: 90px;
			/* background-color: red; */
		}
		.idBlank{
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
			margin-top: 20px;
			width: 250px;
			height: 60px;
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
	</style>
</head>
<body>
	<div class="registerBox">
		<a class="closeBtn" href="/SurveyForm/index.jsp">
			X
		</a>
		<p class="registerTitle">
			Register
		</p>
		<form action="./registerAction.jsp" method="post">
			<div class="idSection">
				<img class="emoji" src="images/idImg.png">
				<input class="idBlank" type="text" placeholder="ID" name="userID" required>
			</div>
			<div class="pwSection">
				<img class="emoji" src="images/pwImg.png">
				<input class="idBlank" type="text" placeholder="Password" name="userPW" required>
			</div>
			<div class="registerBtnArea">
				<button class="registerBtn">
					Register
				</button>
			</div>
		</form>
		
		<br><br><br>
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