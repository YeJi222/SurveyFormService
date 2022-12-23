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
		
		.formNameSection{
			margin-top: -140px;
			text-align: center;
			font-size: 40px;
		}
		.formDetailSection{
			background-color: white;
			margin: 20px;
			margin-left: 70px;
			margin-right: 70px;
			height: 180px;
			overflow: scroll;
			font-size: 25px;
			padding: 20px;
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
		
		System.out.print("surveyID in enterForm : ");
		System.out.println(surveyID);
		
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
		
		int questionListSize = questionList.size();
		int[] questionID = new int[questionListSize];
		String[] questionContent = new String[questionListSize];
		String[] type = new String[questionListSize];
		int[] optionID = new int[questionListSize];
		String[] optionContent = new String[questionListSize];
		
		System.out.print("Question List Size : ");
		System.out.println(questionListSize);
		
		for(int i = 0 ; i < questionListSize ; i++){
			questionID[i] = questionList.get(i).getQuestionID();
			questionContent[i] = questionList.get(i).getQuestionContent();
			type[i] = questionList.get(i).getType();
			optionID[i] = questionList.get(i).getOptionID();
			optionContent[i] = questionList.get(i).getOptionContent();
		}
	%>
	<script>
		function popup(){
			window.open('popup_home.jsp', '팝업 테스트', 'width=400, height=300, top=10, left=10');
		} 
		
		var user_id = "<%=userID%>";
		var enterID = "";
		
		if(user_id == "null"){ // 익명 사용
			/* popup();
			location.href = "index.jsp"; */
			console.log("익명 사용자");
			enterID = "익명 사용자";
		} else{ // 로그인한 사용자 
			enterID = "<%=userID%>";
		}
		console.log(enterID);
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
		<form action="./createSurveyAction.jsp">
			<div class="formNameSection">
				"<%=formName %>"
			</div>
			<div class="formDetailSection">
				<%=formDetail %>
			</div>
			
		<%
			for(int i = 0 ; i < questionNum ; i++){
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
		%>
					<div class="questionDiv">
						<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
						<div class="textAns" style="text-align: left;">
							<input type="radio" class="radioCircle" name="radioGroup" id="radio1" >
							<label for="radio1">기획팀</label><br>
							<input type="radio" class="radioCircle" name="radioGroup" id="radio2">
							<label for="radio2">데코팀</label><br>
							<input type="radio" class="radioCircle" name="radioGroup" id="radio3">
							<label for="radio3">새섬팀</label><br>
							<input type="radio" class="radioCircle" name="radioGroup" id="radio4">
							<label for="radio4">운영팀</label><br>
						</div>
					</div>	
		<%
				}
			}
		%>
			
			<!-- <div class="questionDiv">
				<p style="text-align: left;"> Q2. 지원할 부서는 어디입니까? </p>
				<div class="textAns" style="text-align: left;">
					<input type="radio" class="radioCircle" name="radioGroup" id="radio1" >
					<label for="radio1">기획팀</label><br>
					<input type="radio" class="radioCircle" name="radioGroup" id="radio2">
					<label for="radio2">데코팀</label><br>
					<input type="radio" class="radioCircle" name="radioGroup" id="radio3">
					<label for="radio3">새섬팀</label><br>
					<input type="radio" class="radioCircle" name="radioGroup" id="radio4">
					<label for="radio4">운영팀</label><br>
				
				</div>
			</div>
			<div class="questionDiv">
				<p style="text-align: left;"> Q3. 관심있는 분야는 어떤 것입니까?(복수 선택 가능) </p>
				<div class="textAns" style="text-align: left;">
					<input type="checkbox" class="checkSquare" name="checkGroup" id="check1" >
					<label for="check1">분야1</label><br>
					<input type="checkbox" class="checkSquare" name="checkGroup" id="check2" >
					<label for="check2">분야2</label><br>
					<input type="checkbox" class="checkSquare" name="checkGroup" id="check3" >
					<label for="check3">분야3</label><br>
					<input type="checkbox" class="checkSquare" name="checkGroup" id="check3" >
					<label for="check3">분야4</label><br>
				</div>
			</div> -->
			
		</form>
		<div class="footer">
			<button type="submit" class="submitBtn" onclick="location.href='/SurveyForm/home.jsp'">Submit This Form</button>
		</div>
		
		
	</div>
	
</body>
</html>