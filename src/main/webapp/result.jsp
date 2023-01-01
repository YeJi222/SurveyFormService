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
		.toggleArea{
			text-align: right;
			position: relative;
			left: 5px;
			top: -63px; 
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
		
		function staticsAnswer(){
			console.log("staticsAnswer");
			
			document.getElementById("eachAnserBtn").style.background = "white";
			document.getElementById("eachAnserBtn").style.color = "black";
			
			document.getElementById("staticsrBtn").style.background = "tomato";
			document.getElementById("staticsrBtn").style.color = "white";
			document.getElementById("staticsrBtn").style.border = "lightgrey";
			
			location.href="http://localhost:8080/SurveyForm/result.jsp?surveyID=9";
		}
		
		function eachAnswer(){
			console.log("eachAnswer");
			
			document.getElementById("eachAnserBtn").style.background = "tomato";
			document.getElementById("eachAnserBtn").style.color = "white";
			
			document.getElementById("staticsrBtn").style.background = "white";
			document.getElementById("staticsrBtn").style.color = "black";
			document.getElementById("staticsrBtn").style.border = "lightgrey";
			
			location.href="http://localhost:8080/SurveyForm/eachResult.jsp?surveyID=9";
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
		<div class="formNameSection">
			"<%=formName %>" Form Result
		</div>
		
		<div class="responseNumDiv">
			<p style="text-align: left; padding-top: 10px;"> 응답 <%=answerCount %>명 </p>
		
			<div class="toggleArea">
				<div class="btn-group">
		             <button type="button" id="staticsrBtn" data-switch-toggle="state" class="btn btn-danger" style="background-color: tomato; height: 60px; width: 140px; font-size: 20px;" onclick="staticsAnswer()">
		             	Statistics
		             </button>
		             
		             <button type="button" id="eachAnserBtn" data-switch-set="state" data-switch-value="true" class="btn btn-default" style="height: 60px; width: 140px; font-size: 20px;" onclick="eachAnswer()">
		             	Each Answer
		             </button>
		        </div>
			</div>
		</div>
		
		<%
		for(int i = 0 ; i < questionNum ; i++){
			// type - 0 : text / 1 : radio / 2 : checkbox
			if(type[i].equals("textType")){
				System.out.print("textType questionID : ");
				System.out.println(questionID[i]);
				
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
					
					System.out.print("answerUsers : ");
					System.out.println(textAnswerUser[j]);
				}
	%>
				<div class="questionDiv">
					<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
					<div class="answerLenDiv">응답 <%=textAnswerLen %>개</div>
	<%
					for(int j = 0 ; j < textAnswerLen ; j++){
	%>
						<%-- <div class="textAnswerUserDiv"><%=textAnswerUser[j] %></div> --%>
						<div class="textAnswerDiv">
							<%=textAnswer[j] %> 
						</div>
	<%					
					}
	%>
				</div>	
	<%	
			} else if(type[i].equals("radioType")){
				// get optionContent list
				CreateDAO optionDAO = new CreateDAO();
				ArrayList<CreateDTO> optionArr = optionDAO.getAnswerOptionContent(surveyID, questionID[i], type[i]);
				
				/* System.out.print("optionArr 개수 : ");
				System.out.println(optionArr.size()); */
				
				int radioOptionLen = optionArr.size();
				
				ArrayList<String> radioOptionList = new ArrayList<>();
				ArrayList<Integer> radioOptionCountList = new ArrayList<>();
				int answerUserCount = 0;
				int checkedCount = 0;
				
				AnswerDAO answerArr = new AnswerDAO();
				for(int j = 0 ; j < radioOptionLen ; j++){
					radioOptionList.add('"' + optionArr.get(j).getOptionContent() + '"');
					// System.out.println(optionArr.get(j).getOptionContent());
					
					int radioAnswerNum = answerArr.getRadioAnswer(surveyID, questionID[i], type[i], optionArr.get(j).getOptionContent());
					
					System.out.print("radioAnswerNum : ");
					System.out.println(radioAnswerNum);
					
					if(radioAnswerNum > 0){
						answerUserCount += radioAnswerNum;
						checkedCount++;
					}
					
					radioOptionCountList.add(radioAnswerNum);
				}
				/* System.out.print("answerCount : ");
				System.out.println(radioAnswerNum); */
				
				
				
				/* System.out.print("getRadioAnswer 개수 : ");
				System.out.println(radioAnswerArr.size());
				
				int radioAnswerLen = radioAnswerArr.size();
				
				String[] radioAnswer = new String[radioAnswerLen];
				
				for(int j = 0 ; j < radioAnswerLen ; j++){
					radioAnswer[j] = radioAnswerArr.get(j).getAnswer();
				} */
				
	%>
				<div class="questionDiv">
					<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
					<div class="answerLenDiv">응답 <%=answerUserCount %>개</div>
					<canvas id="radioChart<%=questionID[i] %>" width="400" height="186" style="margin-top: -20px;"></canvas>
					<div class="radioResultInfo">
	<%
						for(int j = 0 ; j < radioOptionCountList.size() ; j++){
	%>
							● <%=radioOptionList.get(j) %> &nbsp;&nbsp; <span class="countText">응답 <%=radioOptionCountList.get(j) %>개</span><br>
	<%
						}
	%>
					
					</div>
					<script type="text/javascript">
						var ctx = document.getElementById("radioChart<%=questionID[i] %>").getContext('2d');
						
						Chart.Chart.pluginService.register({
						    beforeDraw: function(chart) {
						    	var width = chart.chart.width,
							    height = chart.chart.height,
							    ctx = chart.chart.ctx;
						    	// console.log(width);
							 
							    ctx.restore();
							    // var fontSize = 2;
							    ctx.font = "95% DoHyeon"
							    ctx.fillStyle = "darkorange";
							    ctx.textBaseline = "middle";
							 
							    var text = chart.config.centerText.text,
							    textX = Math.round((width - ctx.measureText(text).width) / 2),
							    textY = height / 1.85;
							 
							    ctx.fillText(text, textX, textY);
							    ctx.save();
						    },
						});
						
						var optionList = <%=radioOptionList%>;
						var colorList = ['#A8C8F9', '#DFDFDF', '#FFCCCC', '#B8F3B8', '#FFAC33', '#FFA0A0', '#C177FB', '#FFDDA6', '#61AE76', '#969191'];
						var dataList = <%=radioOptionCountList%>
						
						var myChart = new Chart(ctx, {
						  type: 'doughnut',
						    data: {
						      labels: optionList,
						      datasets: [{
						            data: dataList,
						            backgroundColor: colorList,
						            borderWidth: 0.5 ,
						            borderColor: '#ddd',
						        }]
						  },
						  options: {
						        title: {
						            display: true,
						            text: 'Radio Type 응답',
						            position: 'top',
						            fontFamily: "DoHyeon",
						            fontSize: 25,
						            fontColor: '#111',
						            padding: 20
						        },
						        legend: {
						            display: true,
						            position: 'bottom',
						            labels: {
						            	fontSize: 20,
						            	fontFamily: "DoHyeon",
						            	fontWeight: 800,
						                boxWidth: 20,
						                fontColor: '#111',
						                padding: 15
						            }
						        },
						        
						    },
						    centerText: {
						        display: true,
						        text: "선택 <%=checkedCount %>개"
						    }
						});
					</script>
				</div>	
	<%			
			} else if(type[i].equals("checkboxType")){
				System.out.println("============ checkboxType ============");
				// get optionContent list
				CreateDAO optionDAO = new CreateDAO();
				ArrayList<CreateDTO> optionArr = optionDAO.getAnswerOptionContent(surveyID, questionID[i], type[i]);
				
				int checkboxOptionLen = optionArr.size();
				
				ArrayList<String> checkboxOptionList = new ArrayList<>();
				ArrayList<String> checkedList = new ArrayList<>();
				ArrayList<Integer> checkboxOptionCountList = new ArrayList<>();
				// int answerUserCount = 0;
				
				AnswerDAO answerArr = new AnswerDAO();
				for(int j = 0 ; j < checkboxOptionLen ; j++){
					checkboxOptionList.add('"' + optionArr.get(j).getOptionContent() + '"');
					// System.out.println(optionArr.get(j).getOptionContent());
				}
				
				AnswerDAO checkOptionDAO = new AnswerDAO();
				ArrayList<AnswerDTO> checkAnswers = checkOptionDAO.getCheckboxAnswer(surveyID, questionID[i], type[i]);
				
				/* System.out.print("answerID : ");
				System.out.println(questionID[i]);
				System.out.print("checkAnswers len : ");
				System.out.println(checkAnswers.size()); */
				
				int checkAnswersLen = checkAnswers.size();
				
				for(int j = 0 ; j < checkAnswers.size() ; j++){
					String[] splitAnswer = checkAnswers.get(j).getAnswer().split(", ");
					for(int k = 0 ; k < splitAnswer.length ; k++){
						// System.out.println(splitAnswer[k]);
						
						/*
						// 중복 제외하고 optionContent 리스트에 넣기 
						if(!checkedList.contains(splitAnswer[k])){ 
							checkedList.add(splitAnswer[k]);
							
						}
						System.out.print("checkedList : ");
						System.out.println(checkedList);
						*/
						
						checkedList.add('"' + splitAnswer[k] + '"');
					}
				}
				/* System.out.print("checkedList : ");
				System.out.println(checkedList);
				
				System.out.print("checkboxOptionList : ");
				System.out.println(checkboxOptionList); */
				
				for(int j = 0 ; j < checkboxOptionList.size() ; j++){
					int optionCount = 0;
					for(int k = 0 ; k < checkedList.size() ; k++){
						if(checkboxOptionList.get(j).equals(checkedList.get(k))){
							optionCount++;
						}
					}
					/* System.out.print("optionCount : ");
					System.out.println(optionCount); */
					
					checkboxOptionCountList.add(optionCount);
				}
				/* System.out.print("checkboxOptionCountList : ");
				System.out.println(checkboxOptionCountList); */
				
	%>
				<div class="questionDiv">
					<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
					<div class="answerLenDiv">응답 <%=checkAnswersLen %>개</div>
					<canvas id="radioChart<%=questionID[i] %>" width="400" height="186" style="margin-top: -20px;"></canvas>
					<div class="radioResultInfo">
	<%
						for(int j = 0 ; j < checkboxOptionCountList.size() ; j++){
	%>
							● <%=checkboxOptionList.get(j) %> &nbsp;&nbsp; <span class="countText">응답 <%=checkboxOptionCountList.get(j) %>개</span><br>
							
	<%
						}
	%>
					
					</div>
					<script type="text/javascript">
						var ctx = document.getElementById("radioChart<%=questionID[i] %>").getContext('2d');
						
						Chart.Chart.pluginService.register({
						    beforeDraw: function(chart) {
						    	var width = chart.chart.width,
							    height = chart.chart.height,
							    ctx = chart.chart.ctx;
						    	// console.log(width);
							 
							    ctx.restore();
							    // var fontSize = 2;
							    ctx.font = "95% DoHyeon"
							    ctx.fillStyle = "darkorange";
							    ctx.textBaseline = "middle";
							 
							    var text = chart.config.centerText.text,
							    textX = Math.round((width - ctx.measureText(text).width) / 2),
							    textY = height / 1.85;
							 
							    ctx.fillText(text, textX, textY);
							    ctx.save();
						    },
						});
						
						var optionList = <%=checkboxOptionList%>;
						var colorList = ['#A8C8F9', '#DFDFDF', '#FFCCCC', '#B8F3B8', '#FFAC33', '#FFA0A0', '#C177FB', '#FFDDA6', '#61AE76', '#969191'];
						var dataList = <%=checkboxOptionCountList%>
						
						var myChart = new Chart(ctx, {
						  type: 'polarArea',
						    data: {
						      labels: optionList,
						      datasets: [{
						            data: dataList,
						            backgroundColor: colorList,
						            borderWidth: 0.5 ,
						            borderColor: '#ddd',
						        }]
						  },
						  options: {
						        title: {
						            display: true,
						            text: 'Checkbox Type 응답',
						            position: 'top',
						            fontFamily: "DoHyeon",
						            fontSize: 25,
						            fontColor: '#111',
						            padding: 20
						        },
						        legend: {
						            display: true,
						            position: 'bottom',
						            labels: {
						            	fontSize: 20,
						            	fontFamily: "DoHyeon",
						            	fontWeight: 800,
						                boxWidth: 20,
						                fontColor: '#111',
						                padding: 15
						            }
						        },
						        
						    },
						    centerText: {
						        display: false,
						        text: ""
						    }
						});
					</script>
				</div>	
		<%			
				}
			}
		%>	
		<div class="footer">
			<button type="button" class="okBtn" onclick="location.href='/SurveyForm/home.jsp'">OK</button>
		</div>
	</div>
</body>
</html>