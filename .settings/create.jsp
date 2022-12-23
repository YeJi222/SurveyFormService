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
		.createBtn{
			position: fixed;
			top: 0;
			right: 0;
			margin-right: 25px;
			margin-top: 120px;
			background-color: #A4B2FF;
			color: white;
			border: none;
			font-family: "DoHyoen";
			font-weight: bold;
			font-size: 25px;
			border-radius: 40px;
			padding: 17px 30px 15px 30px;
			box-shadow: 3px 3px 5px grey;
		}
		.formNameSection{
			background-color: tomato;
			padding: 10px;
			width: 100%;
		}
		.formName{
			font-size: 30px;
			padding-left: 10px;
			background-color: #EEEEEE;
			width: 400px;
			height: 60px;
			border: none;
			
			/* margin-top: -240px; */
		}
		::placeholder {
		 	color: #A0A0A0;
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
	<div class="header">
		<div class="serviceName">
			Survey Form Service
		</div>
		<img class="profileImg" src="images/profile.png">
		<div class="logInOut">
			Logout
		</div>
	</div>
	<div class="middle">
		<button class="createBtn" onclick="location.href='#'">
			+ 항목 추가하기
		</button>
		
		<form>
			<div class="formNameSection">
				<input type="text" class="formName" placeholder="Form Name" name="formName">
			</div>
			
			
			<div class="footer">
				<button type="submit" class="submitBtn">Survey 만들기</button>
			</div>
		</form>
		
		
		
	</div>
</body>
</html>