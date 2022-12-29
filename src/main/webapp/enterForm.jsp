<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="create.EnterDTO" %>
<%@ page import="create.EnterDAO" %>
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
		
		.formNameSection{
			margin-top: -140px;
			text-align: center;
			font-size: 40px;
		}
		.formDetailSection{
			background-color: white;
			margin: 20px;
			margin-left: 60px;
			margin-right: 60px;
			height: auto;
			/* overflow: scroll; */
			font-size: 25px;
			padding: 30px;
			border-radius: 20px;
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
		
		.questionText{
			font-size: 24px;
			width: 98%;
			height: 40px;
			font-family: "DoHyeon";
			border: none;
			border-bottom: 2px solid lightgrey;
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
			background-color: #FF7777;
		}
		.footer{
			width: 100%;
			position: fixed;
			bottom: 30px;
		}
		.buttonArea{
			text-align: center;
			margin: auto;
			padding: 20px;
		}
	</style>
</head>
<body>
	<%
		String userID = null; // 설문지에 응답하는 사람 
		int surveyID = 0;
		if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
			userID = (String) session.getAttribute("userID");
		}
		if(request.getParameter("surveyID") != null){
			surveyID = Integer.parseInt(request.getParameter("surveyID"));
		}
		
		System.out.print("userID : ");
		System.out.println(userID);
		
		String loginState = "";
		if(userID == null){ // logout 상태 
			loginState = "Login";
		} else{ // login 상태 
			loginState = "Logout";
		}
		
		EnterDAO enterDAO = new EnterDAO();
		// 중복 데이터 있는지 확인 
		System.out.println("================= checkDuplicateAnswer =================");
		int check = 0;
		if(userID != null){ // 익명 사용자가 아닌 경우 중복 여부 판단 
			check = enterDAO.checkDuplicateAnswer(surveyID, userID);
			System.out.print("check : ");
			System.out.println(check);
		} else{
			System.out.println("check: 익명 사용자");
		}
		
		// 버튼 내용 
		String buttonContent = "";
		String actionPage = "";
		if(check == 0){ // 처음 응답하면 
			buttonContent = "Submit This Form";
			actionPage = "./actionJSP/answerSaveAction.jsp";
		} else{
			buttonContent = "Edit & Go Home";
			actionPage = "./actionJSP/answerEditAction.jsp";
		}
		
		System.out.print("actionPage : ");
		System.out.println(actionPage);
		
		
		// get survey info
		String formName = null;
		String formDetail = null;
		
		CreateDAO dao = new CreateDAO();
		ArrayList<CreateDTO> list = dao.getSurveyInfoDTO(surveyID);
		
		/* System.out.print("list size : ");
		System.out.println(list.size()); */
		
		formName = list.get(0).getFormName();
		formDetail = list.get(0).getFormDetail();
	
		/* System.out.print("formName from dto : ");
		System.out.println(formName);
		System.out.print("formDetail from dto : ");
		System.out.println(formDetail); */
		
		// about question 개수 
		CreateDAO dao2 = new CreateDAO();
		int questionNum = dao2.getQuestionNum(surveyID);
		
		/* System.out.print("questionNum : ");
		System.out.println(questionNum); */
		
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
		String[] questionContent = new String[questionListSize];
		String[] type = new String[questionListSize];
		
		
		/* int[] optionID = new int[questionListSize];
		String[] optionContent = new String[questionListSize]; */
		
		/* System.out.print("Question List Size : ");
		System.out.println(questionListSize); */
		
		for(int i = 0 ; i < questionListSize ; i++){
			questionID[i] = questionInfo.get(i).getQuestionID();
			questionContent[i] = questionInfo.get(i).getQuestionContent();
			type[i] = questionInfo.get(i).getType();
			
			/* optionID[i] = questionList.get(i).getOptionID();
			optionContent[i] = questionList.get(i).getOptionContent(); */
		}
		
		/* String displayAttr = "none";
		String alertContent = ""; */
	%>
	<script>
		function popup(){
			window.open('popup_enter.jsp', '팝업 테스트', 'width=400, height=300, top=10, left=10');
		} 
		
		var user_id = "<%=userID%>";
		var enterID = "";
		
		if(user_id == "null"){ // 익명 사용자 
			/* popup();
			location.href = "index.jsp"; */
			console.log("익명 사용자");
			enterID = "익명 사용자";
		} else{ // 로그인한 사용자 
			enterID = "<%=userID%>";
		}
		console.log("참여한 사용자 : " + enterID);
		
		
	</script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<div class="header">
		<a href="home.jsp" class="serviceName">
			Survey Form Service
		</a>
		<img class="profileImg" src="images/profile.png">
		<div class="logInOut" onclick="location.href='logoutAction.jsp'">
			<%=loginState %>
		</div>
	</div>
	
	<div class="middle">
		<form action=<%=actionPage %> id="formID">
			<input type="hidden" name="surveyID" value="<%=surveyID %>">
			
			<div class="formNameSection">
				"<%=formName %>"
			</div>
			<div class="formDetailSection">
				<%=formDetail %>
			</div>
			
		<%
			for(int i = 0 ; i < questionNum ; i++){
				// get answerValue - edit 할 때 기존의 답변을 불러오기 위해 
				EnterDAO answerDAO = new EnterDAO();
				System.out.println("================= getAnswerValue =================");
				System.out.print("questionID : ");
				System.out.println(questionID[i]);
				System.out.print("answerUser : ");
				System.out.println(userID);
				
				String answerUser = "";
				if(userID != null){ // 익명 사용자가 아니면 
					answerUser = userID;
				} else{ // 익명 사용자이면 
					answerUser = "익명 사용자";
				}
				
				String answerValue = null;
				if(answerUser.equals(userID)){ // 익명 사용자가 아니면 
					System.out.println("익명 사용자가 아닙니다 ");
					answerValue = answerDAO.getAnswerValue(surveyID, answerUser, questionID[i]);
					
					/* System.out.print("answerValue : ");
					System.out.println(answerValue); */
				} else{
					System.out.println("익명 사용자입니다 ");
				}
				
				// type - 0 : text / 1 : radio / 2 : checkbox
				if(type[i].equals("textType")){
					
		%>
					<div class="questionDiv">
						<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
						<div class="textAns" style="text-align: left;">
							<input type="text" class="questionText"
		<%
							if(answerValue != null){ // 익명 사용자일 때는 placeholder만 보이게 
		%>		
								value="<%=answerValue %>"
		<%
							}
		%>
								placeholder="답변" name="0answer<%=questionID[i]%>">
						</div>
						
						<label id="alertArea<%=questionID[i] %>" style="color: red; font-size: 23px;"></label>
					</div>	
		<%	
				} else if(type[i].equals("radioType")){
					// get optionID count
					QuestionDAO daoOptionIDCount = new QuestionDAO();
					int optionID_count = daoOptionIDCount.getOptionIDCount(surveyID, questionID[i]);
					
					CreateDAO maxOptionID = new CreateDAO();
					int max_OptionID = maxOptionID.getMaxOptionID(surveyID, questionID[i]);	
		%>
					<div class="questionDiv">
						<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
						<div class="textAns" style="text-align: left;">
		<%
						/* System.out.print("optionID_count : ");
						System.out.println(optionID_count);
						System.out.print("max_OptionID : ");
						System.out.println(max_OptionID); */
						
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
								<input type="radio" name="1answer<%=questionID[i]%>" value="<%=dbOptionContent %>" 
		<%
								if(dbOptionContent.equals(answerValue)){
		%>	
									checked
		<% 
								}
		%>					
								>
								<label for="radio"><%=dbOptionContent %></label><br>
		<%
								j++;
							}
						}
		%>
						</div>
						<label id="alertArea<%=questionID[i] %>" style="color: red; font-size: 23px;"></label>
					</div>
		<%				
				} else if(type[i].equals("checkboxType")){
					System.out.print("answerValue : ");
					System.out.println(answerValue);
					
					if(answerValue == null){
						answerValue = "";
					}
					
					String[] checkList = answerValue.split(", ");
					System.out.println("%%% checkList %%%");
					for(int k = 0 ; k < checkList.length ; k++){
						System.out.println(checkList[k]);
					}
					
					// get optionID count
					QuestionDAO daoOptionIDCount = new QuestionDAO();
					int optionID_count = daoOptionIDCount.getOptionIDCount(surveyID, questionID[i]);
					
					CreateDAO maxOptionID = new CreateDAO();
					int max_OptionID = maxOptionID.getMaxOptionID(surveyID, questionID[i]);	
		%>
					<div class="questionDiv">
						<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
						<div class="textAns" style="text-align: left;">
		<%
						/* System.out.print("optionID_count : ");
						System.out.println(optionID_count);
						System.out.print("max_OptionID : ");
						System.out.println(max_OptionID); */
						
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
								<input type="checkbox" id="checkboxID<%=j %>" name="2answer<%=questionID[i]%>" value="<%=dbOptionContent %>" 
		<%
								for(int k = 0 ; k < checkList.length ; k++){
									// System.out.println(checkList[k]);
									if(dbOptionContent.equals(checkList[k])){
		%>
										checked
		<%
									}
								}
		%>
								
								>
								<label for="checkbox"><%=dbOptionContent %></label><br>
		<%
								j++;
							}
						}
		%>
						</div>
						
						<label id="alertArea<%=questionID[i] %>" style="color: red; font-size: 23px;"></label>
					</div>
		<%				
				}
				
			}
		
		%>
						
			
			<div class="footer">
				<div class="buttonArea">
					<button type="button" onclick="return enterSurvey()" class="submitBtn"><%=buttonContent %></button>
				</div>
			</div>
		</form>
	</div>
	<script>
		function enterSurvey(){
			console.log("enterSurevey function");
			
			var submitCount = 0; // submitCount가 0일때 submit되도록 
			
			// 입력되지 않은 사항이 있을 경우 예외처리 
			<%
				for(int i = 0 ; i < questionNum ; i++){
					/* System.out.print("type : ");
					System.out.println(type[i]); */
					
					if(type[i].equals("textType")){
			%>
						// 텍스트 박스 입력되지 않았을 때 발생하는 예외처리 
						var textContent = document.getElementsByName("0answer<%=questionID[i] %>");
						// console.log("textContent : " + textContent[0].value);
						
						if(textContent[0].value == ""){ // 텍스트박스에 입력이 안되었다면 
							submitCount++;
							document.getElementById("alertArea<%=questionID[i] %>").innerHTML = "# 응답하지 않은 사항이 있습니다. 응답한 후 제출 버튼을 눌러주세요 :) #";
						} else{
							document.getElementById("alertArea<%=questionID[i] %>").innerHTML = "";
						}
			<%
					} else if(type[i].equals("radioType")){
			%>
						var checkFlag = 0;
						var optionList = document.getElementsByName("1answer<%=questionID[i] %>");
						
						for(var j = 0 ; j < optionList.length ; j++){
							console.log("optionList value : " + optionList[j].value);
							console.log("option 체크 여부 : " + optionList[j].checked);
							
							// 하나라도 선택이 되면 break하고 checkFlag에 더하지 않음 
							if(optionList[j].checked == true){
								break;
							}
							
							// 마지막꺼까지 선택이 하나도 안되면 checkFlag에 1을 더함으로써 모두 선택이 안되었음을 표시
							if((j == (optionList.length - 1)) &&  optionList[j].checked == false){
								checkFlag++;
								// console.log("================ checkFlag : " + checkFlag);
							}
						}
						
						// checkFlag가 1이면 모두 선택이 안된 경우를 의미 
						if(checkFlag == 1){
							submitCount += 1;
							document.getElementById("alertArea<%=questionID[i] %>").innerHTML = "# 응답하지 않은 사항이 있습니다. 응답한 후 제출 버튼을 눌러주세요 :) #";
						} else{
							document.getElementById("alertArea<%=questionID[i] %>").innerHTML = "";
						}
			<%
					} else if(type[i].equals("checkboxType")){
						// System.out.println("================== checkboxType 예외처리 ==================");
			%>
						<%-- console.log("questionID : " + <%=questionID[i]%>);
						console.log("tagName : " + "2answer<%=questionID[i]%>"); --%>
						
						var checkFlag = 0;
						var optionList = document.getElementsByName("2answer<%=questionID[i]%>");
						// console.log("optionList : " + optionList.length);
						
						for(var j = 0 ; j < optionList.length ; j++){
							/* console.log("optionList value : " + optionList[j].value);
							console.log("option 체크 여부 : " + optionList[j].checked); */
							
							// 하나라도 선택이 되면 break하고 checkFlag에 더하지 않음 
							if(optionList[j].checked == true){
								// console.log("선택~~~~~~!!!!!");
								break;
							}
							
							// console.log("j : " + j);
							
							// 마지막꺼까지 선택이 하나도 안되면 checkFlag에 1을 더함으로써 모두 선택이 안되었음을 표시
							if((j == (optionList.length - 1)) &&  optionList[j].checked == false){
								checkFlag++;
								// console.log("================ checkFlag : " + checkFlag);
							}
						}
						
						// checkFlag가 1이면 모두 선택이 안된 경우를 의미 
						if(checkFlag == 1){
							submitCount += 1;
							document.getElementById("alertArea<%=questionID[i] %>").innerHTML = "# 응답하지 않은 사항이 있습니다. 응답한 후 제출 버튼을 눌러주세요 :) #";
						} else{
							document.getElementById("alertArea<%=questionID[i] %>").innerHTML = "";
						}
			<%
					}
				}
				
			%>
			console.log("submitCount : " + submitCount);
			
			// submitCount가 0이면 form submit되게 
			if(submitCount == 0){
				console.log("form submit");
				
				$.ajax({
					url : "actionJSP/insertEnterForm.jsp",
					type : "post",
					data : {"surveyID" : <%=surveyID%>, "enterID" : enterID, "formName" : "<%=formName%>"},
					dataType : "text",
					success : function(result){
						console.log(result);
						if(result != 0){ // 이미 응답한 내역이 있으면 
							// popup();
						} else{ // 처음 응답하면 insert하고 홈으로 
							location.href="/SurveyForm/home.jsp";
						}
					},
					error: function(error){
						console.log("Fail to insert form");
					}
				})
				
				formID.submit();
			}
			
			
		}
	</script>
</body>
</html>