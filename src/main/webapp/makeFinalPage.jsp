<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Make Final Page</title>
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
		
		::placeholder {
		 	color: #A0A0A0;
		 	font-family: "DoHyeon";
		}
		
		.finalQuestionDiv{
			background-color: white;
			width: 80%;
			margin: auto;
			margin-top: 10px;
			margin-bottom: 30px;
			padding: 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
		}
		.finalPageText{
			font-size: 30px;
			width: 85%;
			margin: auto;
			margin-top: 30px;
			color: black;
		}
		.radioQquestion{
			text-align: center;
			font-size: 30px;
			margin-top: 10px;
			color: black;
		}
		
		.tagUsingInfo{
			background-color: white;
			margin: auto;
			margin-top: 30px;
			margin-bottom: 20px;
			padding: 10px 20px 10px 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
			font-size: 25px;
			width: 80%;
		}
		xmp{
			/* font-family: 'Comic Sans MS'; */
			font-family: "DoHyeon";
		}
		
		.previewBtn{
			width: 100%;
			text-align: center;
			margin: auto;
			margin-top: 20px;
			margin-bottom: 10px;
			padding: 10px 20px 10px 20px;
			background-color: tomato;
			border: none;
			border-radius: 15px;
			font-size: 25px;
			color: white;
			font-family: "DoHyeon";
		}
		.previewBtnText{
			font-size: 20px;
			color: white;
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
		
		.firstSet{
			/* background-color: tomato; */
			width: 100%;
			text-align: left;
			margin-left: 10px;
		}
		.questionContent{
			/* position: relative;
			right: 245px; */
			background-color: #E3E5F3;
			width: 500px;
			font-size: 24px;
			border: none;
			border-radius: 10px;
			padding: 10px;
			font-family: "DoHyeon";
		}
		.finishOpt{
			float: right;
			margin-right: 20px;
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
		
		.questionText{
			font-size: 24px;
			width: 98%;
			height: 40px;
			font-family: "DoHyeon";
			margin-top: 20px;
			border: none;
			border-bottom: 2px solid lightgrey;
		}
		
		.questionOpt{
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
		
		.optionDiv{
			background-color: #EBECEE;
			font-size: 24px;
			border: none;
			border-radius: 10px;
			padding: 10px;
			font-family: "DoHyeon";
			margin-right: 10px;
		}
		
		.finishTextarea{
			width: 93%;
			background-color: #F4F5FF;
			margin-top: 20px;
			border: none;
			resize: none;
			height: 250px;
			border-radius: 15px;
			padding: 20px;
			font-size: 23px;
			
		}
		.resultTextarea{
			width: 93%;
			background-color: #F4F5FF;
			margin-top: 20px;
			border: none;
			resize: none;
			height: 200px;
			border-radius: 15px;
			padding: 20px;
			font-size: 23px;
			overflow: scroll;
			
		}
		textarea::placeholder{
			font-size: 23px;
		}
		
		.shareLinkDiv{
			background-color: white;
			width: 80%;
			margin: auto;
			margin-bottom: 120px;
			padding: 20px;
			border-radius: 15px;
			border: 2px solid #E3E3E3;
		}
		.linkText{
			font-size: 25px;
			margin-bottom: 10px;
		}
		#shareLinkText{
			font-size: 30px;
			color: darkgrey;
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
			text-align: center;
			width: 100%;
			position: fixed;
			bottom: 30px;
		}
	</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){ // ???????????? ????????????, userID ?????? ?????? ??????????????? 
			userID = (String) session.getAttribute("userID");
		}
		
		int surveyID = 0;
		if(request.getParameter("surveyID") != null){
			surveyID = Integer.parseInt(request.getParameter("surveyID"));
		}
		
		// radio type question ???????????? 
		QuestionDAO radioDTO = new QuestionDAO();
		ArrayList<QuestionDTO> radioQuestion = radioDTO.getRadioQuestion(surveyID);
		
		int radioQuestionSize = radioQuestion.size();
		System.out.print("radioQuestionSize : ");
		System.out.println(radioQuestionSize);
		
		int[] questionID = new int[radioQuestionSize];
		String[] question_content = new String[radioQuestionSize];
		
		for(int i = 0 ; i < radioQuestionSize ; i++){
			questionID[i] = radioQuestion.get(i).getQuestionID();
			question_content[i] = radioQuestion.get(i).getQuestionContent();
		}
		
	%>
	<script>
		function popup(){
			var alertContent = "???????????? ?????????<br>???????????? ???????????? ??? ???????????? :)";
			window.open('popup.jsp?alertContent='+alertContent, '?????? ?????????', 'width=400, height=300, top=10, left=10');
		} 
		
		// alert("<%=userID%>");
		var user_id = "<%=userID%>";
		
		if(user_id == "null"){
			popup();
			location.href = "index.jsp";
		} 
		
		function copyAction(){
			console.log("copyAction");
			
			var copyArea = document.getElementById("shareLinkText").innerText;
			const textArea = document.createElement('textarea');
			document.body.appendChild(textArea);
			textArea.value = copyArea;
			textArea.select();
			document.execCommand('copy');
			document.body.removeChild(textArea);
			
			document.getElementById("copyMessage").style.display = "inline";
		}
		
		function updateCommonText(inputData, commonType){
			// console.log(inputData.value);
			
			$.ajax({
				url : "actionJSP/updateCommonText.jsp",
				type : "post",
				data : {"surveyID" : <%=surveyID%>, "commonType" : commonType, "inputData" : inputData.value},
				dataType : "text",
				success : function(result){
					console.log("Success");	
					window.location.reload();
				},
				error: function(error){
					console.log("Fail");
				}
			})
		}
		
		function selectionFunction(val){
			var questionID = val.substring(8);
			console.log("questionID : " + questionID);
			
			$.ajax({
				url : "actionJSP/insertResultContent.jsp",
				type : "post",
				data : {"surveyID" : <%=surveyID%>, "questionID" : questionID},
				dataType : "text",
				success : function(result){
					console.log("Success");	
					window.location.reload();
				},
				error: function(error){
					console.log("Fail");
				}
			})
		}
		
		function deleteSelect(questionID){
			console.log("delete");
			
			$.ajax({
				url : "actionJSP/deleteQuestionInResult.jsp",
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
		
		function updateResultContent(inputData, questionID, optionID){
			console.log("Input Data : " + inputData.value);
			console.log(inputData.name); // name
			console.log("Option ID : " + optionID);
		
			$.ajax({
				url : "actionJSP/updateResultContent.jsp",
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
	
	<div class="tagUsingInfo">
		<div style="color: tomato;">
		???????????? html ???????????? ????????? ????????? ?????? ???????????? ????????? ??? ???????????? :) <br>
		???, ????????? ????????? ????????? ????????? ???????????? html ????????? ??????????????? ???????????????!! <br>
		</div><br>
		(EX) ?????? ???????????? ???????????? ?????? ?????? :
		<xmp><contact>[??????] 21900806@handong.ac.kr</contact></xmp><br>
		
		<xmp>[1] <title></title> : ?????? ????????? ???????????? ?????? </xmp> 
		<xmp>[2] <headerText></headerText> : ?????? ?????? ????????? ???????????? ?????? </xmp> 
		<xmp>[3] <centerText></centerText> : ?????? ????????? ???????????? ?????? </xmp> 
		<xmp>[4] <contact></contact> : ?????? ???????????? ????????? ?????? </xmp> 
		
		<button class="previewBtn" onclick="resultPreview()">
			?????? ?????? ????????? ????????????<br>
			<div class="previewBtnText">(????????? Radio Type??? ???????????? ???????????? ?????? ?????? option??? ????????? ???, '?????? ?????? ????????? ????????????' ????????? ???????????????)</div>
		</button>
	</div>
	
	<%
		QuestionDAO commonDTO = new QuestionDAO();
		String commonTitle = commonDTO.getCommonText(surveyID, "commonTitle");
		String commonContent = commonDTO.getCommonText(surveyID, "commonContent");
	%>
	
	<div class="finalPageText">
		??????????????? ????????? ??????
	</div>
	
	<div class="finalQuestionDiv">
		<div class="firstSet">
			<input type="text" onchange="updateCommonText(this, 'commonTitle')" class="questionContent" 
	<%
			if(commonTitle == null || (commonTitle != null && commonTitle.equals(""))){
	%>
				placeholder="??? ?????? ?????? ???, ????????? ??????"
	<%
			} else{
	%>
				value="<%=commonTitle %> "
	<%
			}
	%>
			>
			<div class="finishOpt">
				Finish
			</div>
			
			<textarea onchange="updateCommonText(this, 'commonContent')" class="finishTextarea" 
	<%
			if(commonContent == null || (commonContent != null && commonContent.equals(""))){
	%>
			placeholder="??? ?????? ?????? ???, ????????? ??????"
	<%
			}
	%>	
			><%if(commonContent != null && !commonContent.equals("")){ %><%=commonContent %><%} %></textarea>
		</div>
	</div>
	
	<div class="finalPageText">
		???????????? ????????? ????????? ?????? ????????? ?????? &nbsp;
		
		<!-- <button class="previewBtn" onclick="resultPreview()">?????? ?????? ????????? ????????????</button> -->
		
		<!-- <div class="tagUsingInfo">
			<div style="color: tomato;">
			???????????? html ???????????? ????????? ????????? ?????? ???????????? ????????? ??? ???????????? :) <br>
			???, ????????? ????????? ????????? ????????? ???????????? html ????????? ??????????????? ???????????????!! <br>
			</div><br>
			(EX) ?????? ???????????? ???????????? ?????? ?????? :
			<xmp><contact>[??????] 21900806@handong.ac.kr</contact></xmp><br>
			
			<xmp>[1] <title></title> : ?????? ????????? ???????????? ?????? </xmp> 
			<xmp>[2] <headerText></headerText> : ?????? ?????? ????????? ???????????? ?????? </xmp> 
			<xmp>[3] <centerText></centerText> : ?????? ????????? ???????????? ?????? </xmp> 
			<xmp>[4] <contact></contact> : ?????? ???????????? ????????? ?????? </xmp> 
		</div> -->
		
		<div class="radioQquestion">
			Radio Type ??? <%=radioQuestionSize %>??? &nbsp;
			<select onchange="selectionFunction(value)" class="questionOpt">
				<option>?????? ?????? ???</option>
				<%
					for(int i = 0 ; i < radioQuestionSize ; i++){
				%>
						<option value="question<%=questionID[i] %>"><%=questionID[i] %>??? ??????</option>
				<%
					}
				%>
			</select>
		</div>
	</div>
	
	<%
		QuestionDAO radio_dto = new QuestionDAO();	
		ArrayList<QuestionDTO> questionInResult = radio_dto.getQuestionInResult(surveyID);
		
		int questionInResultSize = questionInResult.size();
		System.out.print("questionInResultSize : ");
		System.out.println(questionInResultSize);
		
		int[] questionID_InResult = new int[questionInResultSize];
		String[] questionContent_InResult = new String[questionInResultSize];
		
		for(int i = 0 ; i < questionInResultSize ; i++){
			questionID_InResult[i] = questionInResult.get(i).getQuestionID();
			questionContent_InResult[i] = questionInResult.get(i).getQuestionContent();
		}
		
		%>
			<script>
				function resultPreview(){
					console.log("resultPreview");
					var previewOptionList = new Array();
		<%
					for(int k = 0 ; k < questionInResultSize ; k++){
		%>
						var optionList = document.getElementsByName("previewRadio<%=questionID_InResult[k]%>");
						
						for(var j = 0 ; j < optionList.length ; j++){
							console.log("optionList value : " + optionList[j].value);
							console.log("option ?????? ?????? : " + optionList[j].checked);
							
							if(optionList[j].checked == true){
								previewOptionList.push(optionList[j].value);
							}
						}
		<%
					}	
		%>			
					console.log(previewOptionList);
					window.open("/SurveyForm/resultPreview.jsp?surveyID="+<%=surveyID%>+"&previewOptionList="+previewOptionList, '?????? ?????????', 'width=700, height=800, top=10, left=10');
				}
			</script>
		<%
	
		for(int i = 0 ; i < questionInResultSize ; i++){
			ArrayList<QuestionDTO> radioOptionInfo = radio_dto.getRadioResult(surveyID, questionID_InResult[i]);
			
			int radioOptionSize = radioOptionInfo.size();
			System.out.print("radioOptionInfo size : ");
			System.out.println(radioOptionSize);
			
			int[] optionID = new int[radioOptionSize];
			String[] optionContent = new String[radioOptionSize];
			String[] resultContent = new String[radioOptionSize];
			
			for(int j = 0 ; j < radioOptionSize ; j++){
				optionID[j] = radioOptionInfo.get(j).getOptionID();
				optionContent[j] = radioOptionInfo.get(j).getOptionContent();
				resultContent[j] = radioOptionInfo.get(j).getResultContent();
			}
			
	%>
			<div class="questionDiv">
				<div>
					Q<%=questionID_InResult[i] %>. <%=questionContent_InResult[i] %>
					<img onclick="deleteSelect(<%=questionID_InResult[i]%>)" width="35px;" src="images/trashcan.png" style="float: right;">
				</div>
				<%
					for(int j = 0 ; j < radioOptionSize ; j++){
				%>
						<table width="100%">
							<tr>
								<td valign="top">
									<div style="margin-top: 30px;">
										[ Radio Option <%=optionID[j] + 1 %> ]
										<div class="optionDiv">
											<input type="radio" id="previewRadio" value="<%=optionContent[j] %>" name="previewRadio<%=questionID_InResult[i]%>"/> <%=optionContent[j] %>
										</div>
									</div>
								</td>
								<td>
									<textarea onchange="updateResultContent(this, <%=questionID_InResult[i]%>, <%=optionID[j]%>)" class="resultTextarea"
				<%
										if(resultContent[j] == null){
				%>
											placeholder="????????? ???????????????"
				<%							
										} else{
											if(resultContent[j].equals("")){
				%>
												placeholder="????????? ???????????????"
				<%
											}
										}
				%>					
									><% if(resultContent[j] != null){%><%=resultContent[j] %><%} %></textarea>
								</td>
							</tr>
						</table>
				<%		
					}
				%>
			</div>
	<%
		}
	%>
	<!-- <button class="previewBtn" onclick="resultPreview()">
		?????? ?????? ????????? ????????????<br>
		<div class="previewBtnText">(???????????? ???????????? ?????? ?????? option??? ????????? ???, '?????? ?????? ????????? ????????????' ????????? ???????????????)</div>
	</button> -->
	<br>
	<div class="shareLinkDiv">
		<div class="linkText">Survey Form Link &nbsp; 
			<img src="images/copyIcon.png" width="30px;" onclick="copyAction()" style="display: inline;">
			
			<label id="copyMessage" style="display: none; color: darkblue; font-size: 27px; float: right; margin-right: 10px;">?????? ???????????? :)</label>
		</div>
		
		<div id="shareLinkText">
			http://localhost:8080/SurveyForm/enterForm.jsp?surveyID=<%=surveyID %>
		</div>
		
	</div>
	<div class="footer">
			<button type="button" onclick="location.href='/SurveyForm/createSurvey.jsp?surveyID=<%=surveyID%>'" class="submitBtn">Previous Page</button>
		</div>
</body>
</html>