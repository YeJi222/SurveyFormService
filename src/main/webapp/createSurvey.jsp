<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="java.util.ArrayList" %>
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
		
		.formDetailDiv{
			background-color: white;
			width: 80%;
			margin: auto;
			margin-top: 20px;
			margin-bottom: 20px;
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
		
		.detailTextarea{
			width: 95%;
			background-color: #F4F5FF;
			margin-top: 10px;
			border: none;
			resize: none;
			height: 150px;
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
		// formName, formDetail
		String userID = null;
		int surveyID = 0;
		String formName = null;
		String formDetail = null;
		
		if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
			userID = (String) session.getAttribute("userID");
		}
		if(request.getParameter("surveyID") != null){
			surveyID = Integer.parseInt(request.getParameter("surveyID"));
		}
		
		System.out.print("surveyID from GET method : ");
		System.out.println(surveyID);
		
		// get survey info
		CreateDAO dao = new CreateDAO();
		ArrayList<CreateDTO> list = dao.getSurveyInfoDTO(surveyID);
		
		System.out.print("list size : ");
		System.out.println(list.size());
		
		formName = list.get(0).getFormName();
		formDetail = list.get(0).getFormDetail();
	
		System.out.print("formName from dto : ");
		System.out.println(formName);
		System.out.print("formDetail from dto : ");
		System.out.println(formDetail);
		
		// about question 
		CreateDAO dao2 = new CreateDAO();
		int questionNum = dao2.getQuestionNum(surveyID);
		
		System.out.print("questionNum : ");
		System.out.println(questionNum);
	%>
	<script>
		function popup(){
			// alert('before popup function');
			window.open('popup_home.jsp', '팝업 테스트', 'width=400, height=300, top=10, left=10');
		} 
		
		var user_id = "<%=userID%>";
		
		if(user_id == "null"){
			popup();
			location.href = "index.jsp";
		} 
	</script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		var count = <%=questionNum%>; // 현재 추가된 질문 개수
		var radioTypeCount = 0;
		var questionDivName = '';
		var questionDeleteName = '';
		
		var textName = '';
		var radioName = '';
		var checkboxName = '';
		
		var radioOptionCount = 0; // radio option 개수 
		var radioOptionID = '';
		
		var existType = 0;
		
		$(document).ready(function(){
			$('.createBtn').click(function(){
				count++;
				console.log("count : " + count);
				
				questionDivName = "questionDivName" + (count.toString() - 1);
				questionDeleteName = "questionDelete" + (count.toString() - 1);
				
				/* textName = "Text" + count.toString();
				radioName = "Radio" + count.toString();
				checkboxName = "Checkbox" + count.toString();  */
				
				textName = "textType";
				radioName = "radioType";
				checkboxName = "checkboxType";
				
				$('.middle').append(
					'<div class="' + questionDivName + '" style="background-color: white; width: 80%; margin: auto; margin-top: 20px; padding: 20px; border-radius: 15px; border: 2px solid #E3E3E3;">\
						<div class="firstSet">\
							<input type="text" onchange="updateQuestion(this, ' + (count.toString() - 1) + ');" class="questionContent" placeholder="질문 내용" name="questionDivName">\
							<div class="' + questionDeleteName + '" \
									style="display: inline; background-color: tomato;\
									padding: 15px 18px 15px 18px; border-radius: 30px; \
									color: white; margin-left: 10px; font-weight: bold;">\
								-\
							</div>\
							<select onchange="selectionFunction(value, ' + (count.toString() - 1) + ', ' + (existType) + '); radioOptionCount = 0;" class="questionOpt" name="questionKind" id="questionKind">\
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
					console.log('$$$');
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
		
		function selectionFunction(val, questionID, existType){
			var typeNum = questionID; // 문항 번호 
			console.log(typeNum);
			var type = val; // 무슨 type인지 
			console.log(val);
			var optionID = 0;
			var optionContent = null;
			
			
			var questionTextName = 'questionText' + typeNum;
			console.log("ExistType : " + existType);
			
			// existType이 0이면 type이 정해지기 전 
			// 1이면 이미 type이 정해진 후 
			
			if(type == "textType" && existType == 0){ // 한 질문당 하나의 타입만 들어가게 
				optionID = 0;
				optionContent = "사용자 답변";
				// console.log("%%%");
				
				$.ajax({
					url : "actionJSP/textAction.jsp",
					type : "post",
					data : {"surveyID" : <%=surveyID%>, "questionID" : questionID, "type" : type, "optionID" : optionID, "optionContent" : optionContent},
					dataType : "text",
					success : function(result){
						console.log("Success to update Data");	
						window.location.reload();
					},
					error: function(error){
						console.log("Fail to update Data");
					}
				})
				
				$('.questionDivName' + typeNum).append(
					'<div>\
						<input type="text" name="questionTextName" class="' + questionTextName + '" \
							style="width: 98%; font-size: 24px; height: 40px; \
							margin-top: 20px; border: none; \
							border-bottom: 2px solid lightgrey;" placeholder="답변">\
					</div>\
					'
				);
			} else if(type == "radioType" && existType == 0){
				var radioOptionCount = 0;
				radioTypeCount++; // radio 질문 개수 
				var radioDivName = "questionRadio" + radioTypeCount;
				
				$.ajax({
					url : "actionJSP/radioFirstAction.jsp",
					type : "post",
					data : {"surveyID" : <%=surveyID%>, "questionID" : questionID, "type" : type},
					dataType : "text",
					success : function(result){
						console.log("Success to update Data");	
						window.location.reload();
					},
					error: function(error){
						console.log("Fail to update Data");
					}
				})
				
				
				$('.questionDivName' + typeNum).append(
					'<div class="' + radioDivName + '" style="margin-top: 20px; text-align: left;">\
						<p style="font-size: 25px;">[ Radio Type ]</p>\
						<div>\
							<input type="radio" class="radioCircle" name="radioGroup" id="' + radioOptionID + '" >\
							<label for="' + radioOptionID + '">\
								<input class="optionBox" type="text" onchange="updateOptionContent()" name="radioOptionID" placeholder="Radio Option1">\
								<div class="optionDelete' + typeNum + '" style="display: inline; background-color: tomato;\
									padding: 3px 8px 3px 8px; border-radius: 30px; color: white;\
									margin-left: 2px; font-weight: bold;">-</div>\
							</label><br>\
						</div>\
					</div>\
					<div onclick="radioOptionAdd(' + typeNum + ", " + radioTypeCount + ');" class="addOption">\
						<div class="optionAdd">+</div> Add Option \
					</div>\
					'
				);
				
				/* $('#radio1').change(function(){
					alert('radio1');
				}); */
			} else if(type == "checkboxType" && existType == 0){
				$('.questionDivName' + typeNum).append(
					'<div class="questionCheckbox">\
						<p style="font-size: 25px;">[ Checkbox Type ]</p>\
					</div>\
					<div onclick="checkboxOptionAdd();" class="addOption">\
						<div class="optionAdd">+</div> Add Option \
					</div>\
					'
				);
			}
		}
	</script>
	
	<script>
		/*
		var surveyID = 0; // global variable
		
		function loadSurveyID(){ // 추가해줄 surveyID 찾기 - <body> onload
			console.log("Load surveyID");
			
			$.ajax({
				url : "loadSurveyIDAction.jsp",
				type : "post",
				success : function(result){
					console.log("Success to load surveyID");
					
					
					surveyID = result - 1;
					console.log(surveyID);
				}
			})
		}
		*/
	
		function updateSurveyDB(inputData){ // inputData : 입력되는 내용들 
			console.log("Input Data : " + inputData.value);
			console.log(inputData.name); // name
			// console.log("In create page : " + surveyID);
		
			$.ajax({
				url : "actionJSP/updateAjaxAction.jsp",
				type : "post",
				data : {"inputName" : inputData.name, "inputData" : inputData.value, "surveyID" : <%=surveyID%>},
				dataType : "text",
				success : function(result){
					console.log("Success to update Data");	
				},
				error: function(error){
					console.log("Fail to update Data");
				}
			})
		}
		
		function createQuestion(){ // 항목 추가하기 버튼 누르면 문항 추가 (adminSurvey table에 추가)
			
			$.ajax({
				url : "actionJSP/insertQuestionAction.jsp",
				type : "post",
				data : {"surveyID" : <%=surveyID%>, "questionID" : count},
				dataType : "text",
				success : function(result){
					console.log("Success to insert question Data");	
				},
				error: function(error){
					console.log("Fail to insert question Data");
				}
			})
		}
		
		function updateQuestion(inputData, questionID){
			console.log("Input Data : " + inputData.value);
			console.log(inputData.name); // name
			console.log("Question ID : " + questionID);
		
			$.ajax({
				url : "actionJSP/updateQuestionAction.jsp",
				type : "post",
				data : {"inputData" : inputData.value, "surveyID" : <%=surveyID%>, "questionID" : questionID},
				dataType : "text",
				success : function(result){
					console.log("Success to update Data");	
				},
				error: function(error){
					console.log("Fail to update Data");
				}
			})
		}
		
		function updateOptionContent(inputData, questionID){
			console.log("Input Data : " + inputData.value);
			console.log(inputData.name); // name
			console.log("Question ID : " + questionID);
		
			$.ajax({
				url : "actionJSP/contentFirstRadioAction.jsp",
				type : "post",
				data : {"inputData" : inputData.value, "surveyID" : <%=surveyID%>, "questionID" : questionID},
				dataType : "text",
				success : function(result){
					console.log("Success to update Data");	
				},
				error: function(error){
					console.log("Fail to update Data");
				}
			})
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
	<form action="/actionJSP/createSurveyAction.jsp">
		<div class="middle">
			<button type="button" class="createBtn" onclick="createQuestion()">
				+ 항목 추가하기
			</button>
			
			<div class="formNameSection">
				<input type="text" onchange="updateSurveyDB(this);" class="formName" placeholder="Form Name" value="<%=formName %>" name="formName">
			</div>
			
			<div class="formDetailDiv">
				<textarea class="detailTextarea" onchange="updateSurveyDB(this);" name="formDetail" placeholder="생성할 폼에 대한 설명"><%=formDetail %></textarea>
			</div>
			
			<%
				for(int i = 0 ; i < questionNum ; i++){
					// get questionContent
					CreateDAO dao4 = new CreateDAO();
					String questionContent = dao4.getQuestionContent(surveyID, i);
					
					// get select type
					CreateDAO dao3 = new CreateDAO();
					String selectType = dao3.getSelectType(surveyID, i);
					
					int existType = 0;
					if(selectType.equals("")){
						System.out.println("not determined type");
						existType = 0;
					} else{
						existType = 1;
					}
					
					/* System.out.print("selectType : ");
					System.out.println(selectType); */
			%>
					<div class="' + questionDivName<%=i %> + '" style="background-color: white; width: 80%; margin: auto; margin-top: 20px; padding: 20px; border-radius: 15px; border: 2px solid #E3E3E3;">
						<div class="firstSet">
							<input type="text" onchange="updateQuestion(this, <%=i %>);" class="questionContent" value="<%=questionContent %>" placeholder="질문 내용" name="questionDivName">
							<div class="' + questionDeleteName + '"
									style="display: inline; background-color: tomato;
									padding: 15px 18px 15px 18px; border-radius: 30px;
									color: white; margin-left: 10px; font-weight: bold;">
								-
							</div>
							<select onchange="selectionFunction(value, <%=i %>, <%=existType %>); radioOptionCount = 0;" class="questionOpt" name="questionKind" id="questionKind">
								<option>Select Type</option>
								<option value="textType">Text</option>
								<option value="radioType">Radio</option>
		                        <option value="checkboxType">CheckBox</option>
							</select>
						</div>
						<img class="arrow" src="images/pencil.png" width="27px">
						
						<%
							if(selectType.equals("textType")){
						%>
								<div>
									<input type="text" name="questionTextName<%=i %>" class="' + questionTextName + '" 
										style="width: 98%; font-size: 24px; height: 40px; 
										margin-top: 20px; border: none; 
										border-bottom: 2px solid lightgrey;" placeholder="답변">
								</div>
						<%
							} else if(selectType.equals("radioType")){
								// get optionContent type
								CreateDAO dao6 = new CreateDAO();
								String dbOptionContent = dao6.getOptionContent(surveyID, i);
						%>
								<div class="' + radioDivName + '" style="margin-top: 20px; text-align: left;">
									<p style="font-size: 25px;">[ Radio Type ]</p>
									<div>
										<input type="radio" class="radioCircle" name="radioGroup" id="' + radioOptionID + '" >
										<label for="' + radioOptionID + '">
											<input class="optionBox" type="text" value="<%=dbOptionContent %>" onchange="updateOptionContent(this, <%=i %>)" name="radioOptionID" placeholder="Radio Option1">
											<div class="optionDelete' + typeNum + '" style="display: inline; background-color: tomato;
												padding: 3px 8px 3px 8px; border-radius: 30px; color: white;
												margin-left: 2px; font-weight: bold;">-</div>
										</label><br>
									</div>
								</div>
								<div onclick="radioOptionAdd(' + typeNum + ", " + radioTypeCount + ')" class="addOption">
									<div class="optionAdd">+</div> Add Option 
								</div>
						<%
							}
						%>
					</div>
			<%
					// System.out.println("%%%");
				}
			%>
			
		</div>
	</form>
</body>
</html>