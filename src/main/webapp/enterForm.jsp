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
			overflow: scroll;
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
		
		// get formName
		/* EnterDAO enterDAO = new EnterDAO();
		String formName = enterDAO.getFormName(surveyID);
		
		System.out.print("formName in enterForm : ");
		System.out.println(formName); */
		
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
		
		System.out.print("questionNum : ");
		System.out.println(questionNum);
		
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
		
		
		int[] optionID = new int[questionListSize];
		String[] optionContent = new String[questionListSize];
		
		System.out.print("Question List Size : ");
		System.out.println(questionListSize);
		
		for(int i = 0 ; i < questionListSize ; i++){
			questionID[i] = questionInfo.get(i).getQuestionID();
			questionContent[i] = questionInfo.get(i).getQuestionContent();
			type[i] = questionInfo.get(i).getType();
			
			
			optionID[i] = questionList.get(i).getOptionID();
			optionContent[i] = questionList.get(i).getOptionContent();
		}
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
		
		function enterSurvey(){
			$.ajax({
				url : "actionJSP/insertEnterForm.jsp",
				type : "post",
				data : {"surveyID" : <%=surveyID%>, "enterID" : enterID, "formName" : "<%=formName%>"},
				dataType : "text",
				success : function(result){
					console.log(result);
					if(result != 0){ // 이미 응답한 내역이 있으면 
						popup();
					} else{ // 처음 응답하면 insert하고 홈으로 
						location.href="/SurveyForm/home.jsp";
					}
					
				},
				error: function(error){
					console.log("Fail to insert form");
				}
			})
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
	
	<div class="middle">
		<form action="./actionJSP/answerSaveAction.jsp?surveyID=<%=surveyID%>">
			<div class="formNameSection">
				"<%=formName %>"
			</div>
			<div class="formDetailSection">
				<%=formDetail %>
			</div>
			
		<%
			for(int i = 0 ; i < questionNum ; i++){
				System.out.print("i : ");
				System.out.println(i);
				System.out.print("type[i] : ");
				System.out.println(type[i]);
				
				if(type[i].equals("textType")){
		%>
					<div class="questionDiv">
						<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
						<div class="textAns" style="text-align: left;">
							<input type="text" class="questionText" placeholder="답변">
						</div>
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
						System.out.print("optionID_count : ");
						System.out.println(optionID_count);
						System.out.print("max_OptionID : ");
						System.out.println(max_OptionID);
						
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
								<input type="radio" class="radioCircle" name="radioGroup" id="radio1" >
								<label for="radio1"><%=dbOptionContent %></label><br>
		<%
								j++;
							}
						}
		%>
						</div>
					</div>
		<%				
				}
			}
		
		%>
						
			
			<div class="footer">
				<div class="buttonArea">
					<button type="button" onclick="location.href='/SurveyForm/home.jsp'" class="submitBtn" style="background-color: #A4B2FF;">Edit & Go Home</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="enterSurvey()" class="submitBtn">Submit This Form</button>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>