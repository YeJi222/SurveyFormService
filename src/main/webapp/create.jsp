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
			margin-top: -140px;
			text-align: left;
			margin-left: 30px;
		}
		.formName{
			font-size: 30px;
			padding-left: 10px;
			background-color: #EEEEEE;
			width: 480px;
			height: 55px;
			border: none;
		}
		::placeholder {
		 	color: #A0A0A0;
		 	font-family: "DoHyeon";
		}
		
		.finalQuestionDiv{
			background-color: white;
			width: 80%;
			margin: auto;
			margin-top: 20px;
			margin-bottom: 120px;
			padding: 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
		}
		
		.firstSet{
			/* background-color: tomato; */
			width: 100%;
			text-align: left;
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
		.arrow{
			float: right;
			margin-top: -38px;
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
		
		/*
		.questionRadio{
			margin-top: 20px;
			text-align: left;
		}
		*/
		.optionBox{
			border: none;
			font-size: 23px;
			width: 200px;
		}
		.radioCircle{
			width: 17px;
			height: 17px;
		}
		.optionDelete{
			display: inline;
			background-color: tomato;
			padding: 3px 8px 3px 8px;
			border-radius: 30px;
			color: white;
			margin-left: 2px;
			font-weight: bold;
		}
		.optionAdd{
			display: inline;
			background-color: tomato;
			padding: 3px 8px 3px 8px;
			border-radius: 30px;
			color: white;
			margin-left: 2px;
			font-weight: bold;
		}
		.addOption{
			color: tomato;
			font-size: 20px;
			margin-left: -2px;
			margin-top: 5px;
			text-align: left;
		}
		
		.questionCheckbox{
			margin-top: 20px;
			text-align: left;
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
		var count = 0; // 현재 추가된 질문 개수
		var radioTypeCount = 0;
		var questionDivName = '';
		var questionDeleteName = '';
		
		var textName = '';
		var radioName = '';
		var checkboxName = '';
		var typeExist = [];
		
		var radioOptionCount = 0; // radio option 개수 
		var radioOptionID = '';
		
		$(document).ready(function(){
			$('.createBtn').click(function(){
				count++;
				typeExist.push(false);
				
				questionDivName = "questionDiv" + count.toString();
				questionDeleteName = "questionDelete" + count.toString();
				
				textName = "Text" + count.toString();
				radioName = "Radio" + count.toString();
				checkboxName = "Checkbox" + count.toString();
				
				$('.middle').append(
					'<div class="' + questionDivName + '" style="background-color: white; width: 80%; margin: auto; margin-top: 20px; padding: 20px; border-radius: 15px; border: 2px solid #E3E3E3;">\
						<div class="firstSet">\
							<input type="text" class="questionContent" placeholder="질문 내용" name="questionDivName">\
							<div class="' + questionDeleteName + '" \
									style="display: inline; background-color: tomato;\
									padding: 15px 18px 15px 18px; border-radius: 30px; \
									color: white; margin-left: 10px; font-weight: bold;">\
								-\
							</div>\
							<select onchange="selectionFunction(value); radioOptionCount = 0;" class="questionOpt" name="questionKind" id="questionKind">\
								<option>Select Type</option>\
								<option value="' + textName + '">Text</option>\
								<option value="' + radioName + '">Radio</option>\
		                        <option value="' + checkboxName + '">Checkbox</option>\
							</select>\
						</div>\
						<img class="arrow" src="images/pencil.png" width="27px">\
					</div>\
					'
				);
				
				
				$('.' + questionDeleteName).on('click', function(){
					count--;
					$(this).prev().remove(); // input
					$(this).next().remove(); // select
					$(this).parent().next().remove(); // img
					$(this).parent().parent().remove(); // questionDiv class
					$(this).remove(); // button
				})
				
			})
		})
		
		function radioOptionAdd(typeNum, radioTypeCount){
			// var radioOptionCount = 0;
			radioOptionCount++;
			
			// radioOptionID = "Q" + typeNum + " Radio " + radioOptionCount.toString();
			radioOptionID = "Q" + radioTypeCount + " Radio" + radioOptionCount;
			var radioDivName = "questionRadio" + radioTypeCount;
			
			$('.' + radioDivName).append(
				'<div>\
					<input type="radio" class="radioCircle" name="radioGroup" id="' + radioOptionID + '" >\
					<label for="' + radioOptionID + '">\
						<input class="optionBox" type="text" name="radioOptionID" placeholder="' + radioOptionID + '">\
						<div class="optionDelete' + typeNum + '" style="display: inline; background-color: tomato;\
							padding: 3px 8px 3px 8px; border-radius: 30px; color: white;\
							margin-left: 2px; font-weight: bold;">-</div>\
					</label><br>\
				</div>\
				'
			);
			
			$('.optionDelete' + typeNum).on('click', function(){
				// radioOptionCount--;
				$(this).prev().remove(); // input box
				$(this).parent().prev().remove(); // radio circle
				$(this).parent().parent().remove(); // radio's div
				$(this).remove(); // button	
			})
		}
		
		function checkboxOptionAdd(){
			$('.questionCheckbox').append(
				'<div>\
					<input type="checkbox" class="checkSquare" name="checkGroup" id="check1" >\
					<label for="check1">\
						<input class="optionBox" type="text" placeholder="Option">\
						<div class="optionDelete" style="display: inline; background-color: tomato;\
						padding: 3px 8px 3px 8px; border-radius: 30px; color: white;\
						margin-left: 2px; font-weight: bold;">-</div>\
					</label><br>\
				</div>\
				'
			);
			
			$('.optionDelete').on('click', function(){
				$(this).prev().remove(); // input box
				$(this).parent().prev().remove(); // checkbox square
				$(this).parent().parent().remove(); // checkbox's div
				$(this).remove(); // button
			})
		}
		
		function selectionFunction(val){
			var typeNum = val[val.length-1]; // 마지막 글자(번호) 추출 
			var typeName = val.substr(0, val.length-1); // 무슨 type인지 
			
			var questionTextName = 'questionText' + typeNum;
			// alert(questionTextName);
			
			if(typeName == 'Text' && typeExist[typeNum-1] == false){ // 한 질문당 하나의 타입만 들어가게 
				$('.questionDiv' + typeNum).append(
					'<div>\
						<input type="text" name="questionTextName" class="' + questionTextName + '" \
							style="width: 98%; font-size: 24px; height: 40px; \
							margin-top: 20px; border: none; \
							border-bottom: 2px solid lightgrey;" placeholder="답변">\
					</div>\
					'
				);
				typeExist[typeNum-1] = true;
			} else if(typeName == 'Radio' && typeExist[typeNum-1] == false){
				var radioOptionCount = 0;
				radioTypeCount++; // radio 질문 개수 
				var radioDivName = "questionRadio" + radioTypeCount;
				
				
				$('.questionDiv' + typeNum).append(
					'<div class="' + radioDivName + '" style="margin-top: 20px; text-align: left;">\
						<p style="font-size: 25px;">[ Radio Type ]</p>\
					</div>\
					<div onclick="radioOptionAdd(' + typeNum + ", " + radioTypeCount + ');" class="addOption">\
						<div class="optionAdd">+</div> Add Option \
					</div>\
					'
				);
				
				$('#radio1').change(function(){
					alert('radio1');
				});
					
				typeExist[typeNum-1] = true;
			} if(typeName == 'Checkbox' && typeExist[typeNum-1] == false){
				$('.questionDiv' + typeNum).append(
					'<div class="questionCheckbox">\
						<p style="font-size: 25px;">[ Checkbox Type ]</p>\
					</div>\
					<div onclick="checkboxOptionAdd();" class="addOption">\
						<div class="optionAdd">+</div> Add Option \
					</div>\
					'
				);
				typeExist[typeNum-1] = true;
			}
		}
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
	<form action="./createSurveyAction.jsp">
		<div class="middle">
			<button type="button" class="createBtn" onclick="createQuestion()">
				+ 항목 추가하기
			</button>
			
			<div class="formNameSection">
				<input type="text" class="formName" placeholder="Form Name" name="formName">
			</div>
			
			<div class="footer">
				<button type="submit" class="submitBtn">Survey 만들기</button>
			</div>
		</div>
	</form>
	<div class="finalQuestionDiv">
		<div class="firstSet">
			<input type="text" class="questionContent" placeholder="폼 작성 완료 후, 페이지 제목" name="questionName">
			<div class="finishOpt">
				Finish
			</div>
			
			<textarea class="finishTextarea" placeholder="폼 작성 완료 후, 페이지 내용"></textarea>
			
		</div>
	</div>
</body>
</html>