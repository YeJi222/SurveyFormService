<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="create.AnswerDTO" %>
<%@ page import="create.AnswerDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <!-- <link href="css/bootstrap-switch/bootstrap-switch.css" rel="stylesheet"> -->
	<link href="css/common.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
	
	
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
			margin-top: -150px;
			text-align: center;
			font-size: 40px;
		}
		
		.responseUserArea{
			background-color: white;
			width: 80%;
			margin: auto;
			margin-top: 20px;
			padding: 10px 20px 10px 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
			font-size: 30px;
		}
		
		.responseNumDiv{
			background-color: white;
			width: 80%;
			height: 85px;
			margin: auto;
			margin-top: 20px;
			padding: 10px 20px 10px 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
			font-size: 30px;
		}
		
		.userNamesDiv{
			text-align: left;
			font-size: 30px;
			/* margin-left: 10px; */
			margin-top: 10px;
		}
		.cardArea{
			text-align: center;
			margin: auto;
			margin-bottom: 10px;
			margin-top: -10px;
			padding: 20px;
			width: 75%;
			height: 130px;
			/* background-color: tomato;  */
			overflow: auto;
			white-space: nowrap;
		}
		.card{
			text-align: center;
			display: inline-block;
			margin-right: 15px;
			background-color: white;
			border: 2px solid lightgrey;
			width: 150px;
			height: 100px;
			border-radius: 20px;
			padding: 15px;
			z-index: -1;
		}
		.card:hover{
			background-color: tomato;
			color: white;
		}
		.cardArea::-webkit-scrollbar{ /* hidden scrollbar */
		    display: none; 
		}
		.cardTitle{
			font-size: 25px;
			margin-top: 15px;
			overflow: scroll;
		}
		.cardTitle::-webkit-scrollbar {
			display: none;
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
		.answerLenDiv{
			background-color: white;
			font-size: 25px;
			text-align: left;
			padding-left: 5px;
			color: darkorange;
			margin-bottom: 10px;
		}
		.textAnswerDiv{
			background-color: #F4F5FF;
			width: 95%;
			margin: auto;
			margin-top: 5px;
			margin-bottom: 5px;
			padding: 10px 20px 10px 20px;
			border-radius: 15px;
			/* border: 2px solid #E3E3E3; */
			font-size: 30px;
			text-align: left;
		}
		.textAns{
			font-size: 22px;
			margin-top: 10px;
		}
		.ansResult{
			color: tomato;
		}
		
		.radioResultInfo{
			float: right;
			position: relative;
			top: -290px;
			right: 40px;
			text-align: left;
			font-size: 20px;
		}
		.countText{
			color: tomato;
			text-align: right;
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
		.middle{
			margin-bottom: 120px;
		}
		.footer{
			width: 100%;
			position: fixed;
			bottom: 30px;
		}
		.toggleArea{
			text-align: right;
			position: relative;
			left: 5px;
			top: -63px; 
		}
		
		.questionText{
			background-color: #F4F5FF;
			width: 95%;
			margin: auto;
			margin-top: 5px;
			margin-bottom: 5px;
			padding: 10px 20px 10px 20px;
			border-radius: 15px;
			/* border: 2px solid #E3E3E3; */
			font-size: 25px;
			text-align: left;
		}
	</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
			userID = (String) session.getAttribute("userID");
		}
		
		int surveyID = 0;
		if(request.getParameter("surveyID") != null){
			surveyID = Integer.parseInt(request.getParameter("surveyID"));
		}
		
		// get survey info
		String formName = null;
		String formDetail = null;
		
		CreateDAO dao = new CreateDAO();
		ArrayList<CreateDTO> list = dao.getSurveyInfoDTO(surveyID);
		
		formName = list.get(0).getFormName();
		// formDetail = list.get(0).getFormDetail();
		
		QuestionDAO answerDAO = new QuestionDAO();
		int answerCount = 0;
		answerCount = answerDAO.getAnswerCount(surveyID);
		
		// about question 개수 
		CreateDAO dao2 = new CreateDAO();
		int questionNum = dao2.getQuestionNum(surveyID);
		
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
		
		for(int i = 0 ; i < questionListSize ; i++){
			questionID[i] = questionInfo.get(i).getQuestionID();
			questionContent[i] = questionInfo.get(i).getQuestionContent();
			type[i] = questionInfo.get(i).getType();
		}
		
	%>
	<script>
		function popup(){
			var alertContent = "로그인을 하셔야<br>서비스를 이용하실 수 있습니다 :)";
			window.open('popup.jsp?alertContent='+alertContent, '팝업', 'width=400, height=250, top=10, left=10');
		} 
		
		var user_id = "<%=userID%>";
		// alert(user_id);
		
		if(user_id == "null"){
			popup();
			location.href = "index.jsp";
		} 
		
		function staticsAnswer(){
			console.log("staticsAnswer");
			
			document.getElementById("eachAnserBtn").style.background = "white";
			document.getElementById("eachAnserBtn").style.color = "black";
			
			document.getElementById("staticsrBtn").style.background = "tomato";
			document.getElementById("staticsrBtn").style.color = "white";
			document.getElementById("staticsrBtn").style.border = "lightgrey";
			
			location.href="http://localhost:8080/SurveyForm/result.jsp?surveyID=<%=surveyID %>";
		}
		
		function eachAnswer(){
			console.log("eachAnswer");
			
			document.getElementById("eachAnserBtn").style.background = "tomato";
			document.getElementById("eachAnserBtn").style.color = "white";
			
			document.getElementById("staticsrBtn").style.background = "white";
			document.getElementById("staticsrBtn").style.color = "black";
			document.getElementById("staticsrBtn").style.border = "lightgrey";
			
			location.href="http://localhost:8080/SurveyForm/result.jsp?surveyID=9";
		}
		
		function setAnswerUser(answerUser){
			console.log("answerUser : " + answerUser);
			
			$.ajax({
				url : "actionJSP/openEachAnswer.jsp",
				type : "post",
				async: false,
				data : {"surveyID" : <%=surveyID%>, "answerUser" : answerUser},
				dataType : "text",
				success : function(result){
					console.log("Success to load eachAnswer");	
					console.log(result);
					
					document.getElementById("appendAnwerInfo").innerHTML = result;
					// window.location.reload();
				},
				error: function(error){
					console.log("Fail to load eachAnswer");
				}
			})
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
		<form>
			<div class="formNameSection">
				"<%=formName %>" Form Result
			</div>
			
			<div class="responseNumDiv">
				<p style="text-align: left; padding-top: 10px;"> 응답 <%=answerCount %>명 </p>
				<div class="toggleArea">
					<div class="btn-group">
			             <button type="button" id="staticsrBtn" data-switch-toggle="state" class="btn btn-danger" style="background-color: white; color: black; border-color: lightgrey; height: 60px; width: 140px; font-size: 20px;" onclick="staticsAnswer()">
			             	Statistics
			             </button>
			             
			             <button type="button" id="eachAnserBtn" data-switch-set="state" data-switch-value="true" class="btn btn-default" style="background-color: tomato; color: white; height: 60px; width: 140px; font-size: 20px;" onclick="eachAnswer()">
			             	Each Answer
			             </button>
			        </div>
				</div>
			</div>
	  <%
	  		ArrayList<String> textAnswerUserArr = new ArrayList<>();
	  
			for(int i = 0 ; i < questionNum ; i++){
				// surveyID와 questionID에 따른 answer 가져오기 
				AnswerDAO answerArr = new AnswerDAO();
				ArrayList<AnswerDTO> textAnswerArr = answerArr.getTextAnswer(surveyID, questionID[i]);
				
				System.out.print("textType answer 개수 : ");
				System.out.println(textAnswerArr.size());
				
				int textAnswerLen = textAnswerArr.size();
				
				String[] textAnswerUser = new String[textAnswerLen];
				String[] textAnswer = new String[textAnswerLen];
				
				for(int j = 0 ; j < textAnswerLen ; j++){
					textAnswerUser[j] = textAnswerArr.get(j).getAnswerUser();
					textAnswer[j] = textAnswerArr.get(j).getAnswer();
					
					if(!textAnswerUserArr.contains(textAnswerUser[j])){	
						textAnswerUserArr.add(textAnswerUser[j]);
					}
					
					System.out.print("answerUsers : ");
					System.out.println(textAnswerUser[j]);
				}
			}
		%>
			<div class="responseUserArea">
				<p class="userNamesDiv">응답한 User별 응답 보기</p>
				<div class="cardArea">
					<%
					for(int j = 0 ; j < textAnswerUserArr.size() ; j++){
					%>
						<button type="button" class="card" onclick="setAnswerUser('<%=textAnswerUserArr.get(j)%>');">
							<p class="cardTitle"><%=textAnswerUserArr.get(j)%></p>
						</button>	
					<%
					}
					%>
				</div>
			</div>
			
			<div id="appendAnwerInfo"></div>
		
		<div class="footer">
			<button type="button" class="okBtn" onclick="location.href='/SurveyForm/home.jsp'">OK</button>
		</div>
	</div>
</body>
</html>