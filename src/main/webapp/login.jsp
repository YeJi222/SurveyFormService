<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
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
		.loginBox{
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
		.loginTitle{
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
		.loginBtn{
			color: white;
			background-color: #F86B6B;
			border-radius: 40px;
			font-size: 38px;
			text-align: center;
			float: right;
			margin-right: 40px;
			margin-top: 10px;
			width: 180px;
			height: 55px;
			border: none;
			font-family: "DoHyeon";
		}
		.registerHref{
			color: #0C3E8A;
			font-size: 40px;
			text-decoration: none;
			margin: 50px;
			position: relative;
			top: 15px;
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
		.googleLogin{
			background-color: white;
			border-radius: 30px;
			width: 520px;
			height: 65px;
			margin-left: 60px;
			border: none;
		}
		.googleLogo{
			margin-top: 12px;
			margin-right: 30px;
		}
		.googleText{
			display: inline;
			font-size: 40px;
			font-family: "DoHyeon";
			position: relative;
			bottom: 9px;
		}
	</style>
</head>
<body>
	<div class="loginBox">
		<a class="closeBtn" href="/SurveyForm/index.jsp">
			X
		</a>
		<p class="loginTitle">
			LOGIN
		</p>
		<form action="loginAction.jsp" method="post">
			<div class="idSection">
				<img class="emoji" src="images/idImg.png">
				<input class="idBlank" type="text" placeholder="ID" name="userID" required>
			</div>
			<div class="pwSection">
				<img class="emoji" src="images/pwImg.png">
				<input class="idBlank" type="password" placeholder="Password" name="userPW" required>
			</div>
			<button class="loginBtn">
				Login
			</button>
		</form>
		<a class="registerHref" href="/SurveyForm/register.jsp">
			Register
		</a>
		<br><br><br><br>
		<hr class="hrLeft">&nbsp;&nbsp;
		<span class="orText">or</span>
		<hr class="hrRight">
		
		<button class="googleLogin" onclick="location.href='/SurveyForm/index.jsp'">
			<img class="googleLogo" src="images/googleLogo.png" width="45px;">
			<p class="googleText">Login with Google<p>
		</button>
	</div>
</body>
</html>