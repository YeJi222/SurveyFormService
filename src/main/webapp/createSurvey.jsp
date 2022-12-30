<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
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
		.radioCheckboxSelect{
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
		System.out.println("========================== reload ==========================");	
	
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
		
		// about question list
		QuestionDAO daoQuestion = new QuestionDAO();
		ArrayList<QuestionDTO> questionList = daoQuestion.loadQuestion(surveyID);
		
		// about question info in questionList table
		QuestionDAO daoQuestionInfo = new QuestionDAO();
		ArrayList<QuestionDTO> questionInfo = daoQuestionInfo.loadQuestionInfo(surveyID);
		
		
		// question list count
		QuestionDAO daoQuestionCount = new QuestionDAO();
		int questionListSize = daoQuestionCount.questionCount(surveyID); // questionList 테이블에서 questionID 개수 
		
		int[] questionID = new int[questionListSize];
		String[] question_content = new String[questionListSize];
		String[] type = new String[questionListSize];
		
		
		int[] optionID = new int[questionListSize];
		String[] optionContent = new String[questionListSize];
		
		/* System.out.print("Question List Size : ");
		System.out.println(questionListSize); */
		
		for(int i = 0 ; i < questionListSize ; i++){
			questionID[i] = questionInfo.get(i).getQuestionID();
			question_content[i] = questionInfo.get(i).getQuestionContent();
			type[i] = questionInfo.get(i).getType();
			
			
			optionID[i] = questionList.get(i).getOptionID();
			optionContent[i] = questionList.get(i).getOptionContent();
		}
		
		// get survey info
		CreateDAO dao = new CreateDAO();
		ArrayList<CreateDTO> list = dao.getSurveyInfoDTO(surveyID);
		
		/* System.out.print("list size : ");
		System.out.println(list.size()); */
		
		formName = list.get(0).getFormName();
		formDetail = list.get(0).getFormDetail();
		
		// about question 
		CreateDAO dao2 = new CreateDAO();
		int questionNum = dao2.getQuestionNum(surveyID);
		
		// get max questionID
		CreateDAO dao5 = new CreateDAO();
		int nextQuestionID = dao5.getMaxQuestionID(surveyID) + 1; 
		
		/* System.out.print("$$$$$$$$ nextQuestionID : ");
		System.out.println(nextQuestionID); */
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
		var next_questionID = <%=nextQuestionID %>
		var radioTypeCount = 0;
		var questionDivName = '';
		var questionDeleteName = '';
		
		var textName = '';
		var radioName = '';
		var checkboxName = '';
		
		var radioOptionCount = 0; // radio option 개수 
		var radioOptionID = '';
		var checkboxOptionID = '';
		
		var existType = 0;
		
		function radioOptionAdd(questionID, optionID){
			console.log("qid : " + questionID);
			console.log("optionID : " + optionID);
			
			radioOptionID = "Radio Option" + (optionID + 1);
			
			$.ajax({
				url : "actionJSP/addOptionAction.jsp",
				type : "post",
				async: false,
				data : {"surveyID" : <%=surveyID%>, "questionID" : questionID, "type" : "radioType", "optionID" : optionID},
				dataType : "text",
				success : function(result){
					console.log("Success to update Data");	
					window.location.reload();
				},
				error: function(error){
					console.log("Fail to update Data");
				}
			})
			
		}
		
		function checkboxOptionAdd(questionID, optionID){
			checkboxOptionID = "Checkbox Option" + (optionID + 1);
			
			$.ajax({
				url : "actionJSP/addOptionAction.jsp",
				type : "post",
				data : {"surveyID" : <%=surveyID%>, "questionID" : questionID, "type" : "checkboxType", "optionID" : optionID},
				dataType : "text",
				success : function(result){
					console.log("Success to update Data");	
					window.location.reload();
				},
				error: function(error){
					console.log("Fail to update Data");
				}
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
			} else if(type == "radioType" && existType == 0){
				$.ajax({
					url : "actionJSP/defaultOptionAction.jsp",
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
			} else if(type == "checkboxType" && existType == 0){
				
				$.ajax({
					url : "actionJSP/defaultOptionAction.jsp",
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
			}
		}
		
		
	</script>
	
	<script>
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
				data : {"surveyID" : <%=surveyID%>, "questionID" : <%=nextQuestionID%>},
				dataType : "text",
				success : function(result){
					console.log("Success to insert question Data");	
					window.location.reload();
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
		
		function updateOptionContent(inputData, questionID, optionID){
			console.log("Input Data : " + inputData.value);
			console.log(inputData.name); // name
			console.log("Question ID : " + questionID);
		
			$.ajax({
				url : "actionJSP/RadioOptionContentUpdateAction.jsp",
				type : "post",
				data : {"inputData" : inputData.value, "surveyID" : <%=surveyID%>, "questionID" : questionID, "optionID" : optionID},
				dataType : "text",
				success : function(result){
					console.log("Success to update Data");	
				},
				error: function(error){
					console.log("Fail to update Data");
				}
			})
		}
		
		function deleteQuestion(questionID){
			$.ajax({
				url : "actionJSP/deleteQuestionAction.jsp",
				type : "post",
				data : {"surveyID" : <%=surveyID%>, "questionID" : questionID},
				dataType : "text",
				success : function(result){
					console.log("Success to update Data");	
					window.location.reload();
				},
				error: function(error){
					console.log("Fail to update Data");
				}
			})
		}
		
		function deleteOption(questionID, optionID){
			console.log("delete option function");
			
			$.ajax({
				url : "actionJSP/deleteOptionAction.jsp",
				type : "post",
				data : {"surveyID" : <%=surveyID%>, "questionID" : questionID, "optionID" : optionID},
				dataType : "text",
				success : function(result){
					console.log("Success to update Data");	
					window.location.reload();
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
				/* System.out.print("==== Question List Size : ");
				System.out.println(questionListSize); */
				
				for(int i = 0 ; i < questionListSize ; i++){
					/* System.out.print("==== questionID : ");
					System.out.println(questionID[i]);
					System.out.print("==== questionContent : ");
					System.out.println(question_content[i]);
					System.out.print("==== type : ");
					System.out.println(type[i]);
					System.out.print("==== optionID : ");
					System.out.println(optionID[i]);
					System.out.print("==== optionContent : ");
					System.out.println(optionContent[i]);  */
					
					// get questionContent
					CreateDAO dao4 = new CreateDAO();
					String questionContent = dao4.getQuestionContent(surveyID, i);
					
					// get select type
					CreateDAO dao3 = new CreateDAO();
					String selectType = dao3.getSelectType(surveyID, i);
					String displayType = "Select Type";
					
					if(type[i].equals("textType")){
						displayType = "Text";
					} else if(type[i].equals("radioType")){
						displayType = "Radio";
					} else if (type[i].equals("checkboxType")){
						displayType = "CheckBox";
					} 
					
					
					int existType = 0;
					if(type[i].equals("")){
						System.out.println("not determined type");
						existType = 0;
					} else{
						existType = 1;
					}
					
			%>
					<div style="background-color: white; width: 80%; margin: auto; margin-top: 20px; padding: 20px; border-radius: 15px; border: 2px solid #E3E3E3;">
						<div class="firstSet">
							<input type="text" onchange="updateQuestion(this, <%=questionID[i] %>);" class="questionContent" 
			<%
						if(!question_content[i].equals("질문 미입력")){
			%>
							value="<%=question_content[i] %>" 
			<%
						}
			%>
							placeholder="질문 내용" name="questionDivName">
							<div onclick="deleteQuestion(<%=questionID[i] %>)" class="questionDeleteName"
									style="display: inline; background-color: tomato;
									padding: 15px 18px 15px 18px; border-radius: 30px;
									color: white; margin-left: 10px; font-weight: bold;">
								-
							</div>
							<select onchange="selectionFunction(value, <%=questionID[i] %>, <%=existType %>); radioOptionCount = 0;" class="questionOpt" name="questionKind" id="questionKind">
								<option><%=displayType %></option>
								<option value="textType">Text</option>
								<option value="radioType">Radio</option>
		                        <option value="checkboxType">CheckBox</option>
							</select>
						</div>
						<img class="arrow" src="images/pencil.png" width="27px">
						
						<%
							// get max(optionID) - optionID 추가 위해 
							CreateDAO dao7 = new CreateDAO();
							int nextOptionID = dao7.getMaxOptionID(surveyID, questionID[i]) + 1; // surveyID, questionID
							/* System.out.print("nextOptionID : ");
							System.out.println(nextOptionID); */
							
							if(type[i].equals("textType")){
						%>
								<div>
									<input type="text" name="questionTextName<%=i %>" class="' + questionTextName + '" 
										style="width: 98%; font-size: 24px; height: 40px; 
										margin-top: 20px; border: none; 
										border-bottom: 2px solid lightgrey;" placeholder="답변">
								</div>
						<%
							} else if(type[i].equals("radioType")){
								// get optionID count
								QuestionDAO daoOptionIDCount = new QuestionDAO();
								int optionID_count = daoOptionIDCount.getOptionIDCount(surveyID, questionID[i]);
								
								CreateDAO maxOptionID = new CreateDAO();
								int max_OptionID = maxOptionID.getMaxOptionID(surveyID, questionID[i]);	
							
						%>
								<div style="margin-top: 20px; text-align: left;">
									<p style="font-size: 25px;">[ Radio Type ]</p>	
						<% 
									// for(int j = 0 ; j < optionID_count ; j++){ // j : optionID
									int j = 0;
									while(j < max_OptionID + 1){
										
										// get optionContent type
										CreateDAO dao6 = new CreateDAO();
										String dbOptionContent = dao6.getOptionContent(surveyID, questionID[i], j);
										
										if(dbOptionContent == null){
											optionID_count++;
											j++;
										} else{
						%>
										<div>
											<input type="radio" class="radioCheckboxSelect" name="radioGroup" id="' + radioOptionID + '" >
											<!-- <label for="' + radioOptionID + '"> -->
												<input class="optionBox" type="text" value="<%=dbOptionContent %>" onchange="updateOptionContent(this, <%=questionID[i] %>, <%=j %>)" name="radioOptionID" placeholder="Radio Option">
												<div class="optionDelete' + typeNum + '" onclick="deleteOption(<%=questionID[i] %>, <%=j %>)"
													style="display: inline; background-color: tomato;
													padding: 3px 8px 3px 8px; border-radius: 30px; color: white;
													margin-left: 2px; font-weight: bold;">-</div>
											<!-- </label><br> -->
										</div>
						<%
											j++;
										}
									}
						%>
								</div>
								<div onclick="radioOptionAdd(<%=questionID[i] %>, <%=nextOptionID %>)" class="addOption">
									<div class="optionAdd">+</div> Add Option 
								</div>
						<%
							} else if(type[i].equals("checkboxType")){
								// get optionID count
								QuestionDAO daoOptionIDCount = new QuestionDAO();
								int optionID_count = daoOptionIDCount.getOptionIDCount(surveyID, questionID[i]);
								
								CreateDAO maxOptionID = new CreateDAO();
								int max_OptionID = maxOptionID.getMaxOptionID(surveyID, questionID[i]);
							
						%>
								<div style="margin-top: 20px; text-align: left;">
								<p style="font-size: 25px;">[ Checkbox Type ]</p>	
						<% 
								int j = 0;
								while(j < max_OptionID + 1){
									
									// get optionContent type
									CreateDAO dao6 = new CreateDAO();
									String dbOptionContent = dao6.getOptionContent(surveyID, questionID[i], j);
									
									if(dbOptionContent == null){
										optionID_count++;
										j++;
									} else{
						%>
									<div>
										<input type="checkbox" class="radioCheckboxSelect" name="checkboxGroup">
										<!-- <label for="' + radioOptionID + '"> -->
											<input class="optionBox" type="text" value="<%=dbOptionContent %>" onchange="updateOptionContent(this, <%=questionID[i] %>, <%=j %>)" name="radioOptionID" placeholder="Checkbox Option">
											<div onclick="deleteOption(<%=questionID[i] %>, <%=j %>)" style="display: inline; background-color: tomato;
												padding: 3px 8px 3px 8px; border-radius: 30px; color: white;
												margin-left: 2px; font-weight: bold;">-</div>
										<!-- </label><br> -->
									</div>
						<%
										j++;
									}
								}
						%>
								</div>
								<div onclick="checkboxOptionAdd(<%=questionID[i] %>, <%=nextOptionID %>)" class="addOption">
									<div class="optionAdd">+</div> Add Option 
								</div>
						<%
							}
						%>
					</div>
			<%
				}
			%>
		<div class="footer">
			<button type="button" onclick="location.href='/SurveyForm/makeFinalPage.jsp?surveyID=<%=surveyID%>'" class="submitBtn">Make Final Page</button>
		</div>
		<br><br><br><br><br><br>
		</div>
	</form>
</body>
</html>