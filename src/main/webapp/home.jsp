<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home Page</title>
	<link href="css/common.css" rel="stylesheet">
	<style>
		.profileImg{
			width: 100px;
			float: right;
			margin-left: -30px;
		}
		.createBtn{
			position: fixed;
			bottom: 0;
			right: 0;
			margin-right: 40px;
			margin-bottom: 40px;
			background-color: #A4B2FF;
			color: white;
			border: none;
			font-family: "DoHyoen";
			font-weight: bold;
			font-size: 36px;
			border-radius: 40px;
			padding: 20px 30px 20px 30px;
			box-shadow: 3px 3px 5px grey;
		}
		.serviceName{
			text-decoration: none;
			color: black;
		}
		.makeSurvey{
			margin-top: -130px;
		}
		.doSurvey{
			margin-top: 30px;
		}
		.surveyKind{
			text-align: left;
			font-size: 35px;
			margin-left: 40px;
		}
		.cardArea{
			text-align: left;
			margin: auto;
			margin-top: 20px;
			padding: 20px;
			width: 90%;
			height: 220px;
			/* background-color: tomato; */
			overflow: auto;
			white-space: nowrap;
		}
		.card{
			text-align: center;
			display: inline-block;
			margin-right: 15px;
			background-color: white;
			border: 1px solid lightgrey;
			width: 200px;
			height: 190px;
			border-radius: 20px;
			padding: 15px;
			z-index: -1;
		}
		.cardArea::-webkit-scrollbar{ /* hidden scrollbar */
		    display: none; 
		}
		.cardTitle{
			font-size: 25px;
			margin-bottom: 5px;
			overflow: scroll;
		}
		.cardTitle::-webkit-scrollbar {
			display: none;
		}
		.cardDate{
			font-size: 20px;
			color: #757575;
			margin-bottom: 5px;
		}
		.seeResult{
			font-family: "DoHyeon";
			color: white;
			font-size: 25px;
			background-color: #FF7777;
			border-radius: 22px;
			width: 180px;
			height: 50px;
			border: none;
			margin-bottom: 17px;
		
		}
		.seeInform{
			font-family: "DoHyeon";
			color: white;
			font-size: 25px;
			background-color: #FF7777;
			border-radius: 22px;
			width: 200px;
			height: 50px;
			border: none;
			margin-bottom: 17px;
			z-index: 1;
		
		}
		.hrCard{
			margin: auto;
			width: 90%;
			height: 1px;
			background-color: grey;
		}
		.emoji{
			width: 40px;
			height: 40px;
			position: relative;
			top: 12px;
			margin-right: -10px;
			
		}
		.editDelete{
			margin-top: 3px;
		}
		.editPart{
			float: left;
			font-size: 25px;
			
		}
		.deletePart{
			float: right;
			font-size: 25px;
		}
	</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
			userID = (String) session.getAttribute("userID");
		}
		
		// created form
		CreateDAO dao = new CreateDAO();
		ArrayList<CreateDTO> list = dao.getFormInfoDTO(userID);
		
		int listSize = list.size();
		String[] surveyID = new String[listSize];
		String[] formName = new String[listSize];
		Date[] regidate = new Date[listSize];
		
		System.out.println(listSize);
		// System.out.println(list.get(0).getFormName());
		
		for(int i = 0 ; i < listSize ; i++){
			surveyID[i] = list.get(i).getSurveyID();
			formName[i] = list.get(i).getFormName();
			regidate[i] = list.get(i).getRegidate();
		}
		
		// entered form
		ArrayList<CreateDTO> enteredList = dao.getEnterFormDTO(userID);
		
		int enteredListSize = enteredList.size();
		
		String[] enteredFormName = new String[enteredListSize];
		Date[] enteredFormRegidate = new Date[enteredListSize];
		
		for(int i = 0 ; i < enteredListSize ; i++){
			enteredFormName[i] = enteredList.get(i).getFormName();
			enteredFormRegidate[i] = enteredList.get(i).getRegidate();
			
			/* System.out.println("In For : ");
			System.out.println(formName[i]); */
		}
		
	%>
	<script>
		
		function popup(){
			window.open('popup_home.jsp', '팝업 테스트', 'width=400, height=300, top=10, left=10');
		} 
		
		var user_id = "<%=userID%>";
		
		if(user_id == "null"){
			popup();
			location.href = "index.jsp";
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
	<div class="middle">
		<div class="makeSurvey">
			<p class="surveyKind">생성한 설문지</p>
			<div class="cardArea">
			<%
			for(int i = 0 ; i < listSize ; i++){
			%>
				<div class="card">
					<p class="cardTitle"><%=formName[i]%></p>
					<p class="cardDate"><%=regidate[i]%></p>
					<button type="button" class="seeResult" onclick="location.href='/SurveyForm/result.jsp'">
						전체 결과보기
					</button>
					<br>
					<hr class="hrCard">
					<div class="editDelete">
						<div class="editPart" onclick="location.href='/SurveyForm/createSurvey.jsp?surveyID=<%=surveyID[i]%>'">
							<img class="emoji" src="images/pencil.png">
							Edit
						</div>
						<div class="deletePart" onclick="deleteSurvey(<%=surveyID[i]%>);">
							<img class="emoji" src="images/trash.png">
							Delete
						</div>
					</div>
				</div>	
			<%
			}
			%>
			</div>
		</div>
		<div class="doSurvey">
			<p class="surveyKind">참여한 설문지</p>
			<div class="cardArea">
			<%
			for(int i = 0 ; i < enteredListSize ; i++){
			%>
				<div class="card">
					<p class="cardTitle" onclick="location.href='/SurveyForm/enterForm.jsp?surveyID=2'"><%=enteredFormName[i]%></p>
					<p class="cardDate" onclick="location.href='/SurveyForm/enterForm.jsp?surveyID=2'"><%=enteredFormRegidate[i]%></p>
					<button class="seeInform" onclick="location.href='/SurveyForm/inform.jsp'">
						응답 완료 후, 안내글
					</button>
					<br>
					<hr class="hrCard">
					<div class="editDelete">
						<div class="editPart">
							<img class="emoji" src="images/pencil.png">
							Edit
						</div>
						<div class="deletePart">
							<img class="emoji" src="images/trash.png">
							Delete
						</div>
					</div>
				</div>	
			<%
			}
			%>
			</div>
		</div>
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			var surveyID = 0; // global variable
			
			function loadSurveyID(){ // 추가해줄 surveyID 찾기 - <body> onload
				console.log("Load surveyID");
				
				$.ajax({
					url : "actionJSP/loadSurveyIDAction.jsp",
					type : "post",
					success : function(result){
						console.log("Success to load surveyID");
						console.log(result);
						
						surveyID = result;
						console.log("onloadAction : " + surveyID);
						
						createSurveyDB(surveyID); // adminList에 insert 
					}
				})
			}
			
			function onloadAction(){ // page load 했을 때 필요한 action
				// surveyID 찾기 + adminList에 추가해주기 
				loadSurveyID();
			}
			
			function createSurveyDB(surveyID){
				console.log("surveyID parameter : " + surveyID);
				// location.href="createAjaxAction.jsp";
				
				$.ajax({
					url : "createAjaxAction.jsp",
					type : "post",
					data : {"surveyID" : surveyID},
					dataType : "text",
					success : function(result){
						console.log("Success to insert Data");	
						location.href = '/SurveyForm/createSurvey.jsp?surveyID=' + surveyID
					},
					error: function(error){
						console.log("Fail to insert Data");
					}
				})
			}
			
			function deleteSurvey(idx){
				console.log("Delete Survey");
				console.log(idx); // surveyID
				
				$.ajax({
					url : "actionJSP/deleteSurveyAction.jsp",
					type : "post",
					data : {"surveyID" : idx},
					dataType : "text",
					success : function(result){
						console.log("Success to delete Data");
						location.href='/SurveyForm/home.jsp';
					},
					error: function(error){
						console.log("Fail to delete Data");
					}
				})
			}
		</script>
	
		<button class="createBtn" onclick="onloadAction();">
			+ Create Survey
		</button>
	</div>
</body>
</html>