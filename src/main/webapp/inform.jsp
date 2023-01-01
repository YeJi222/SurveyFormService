<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="css/common.css" rel="stylesheet">
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
		@font-face {
			font-family: "DoHyeon";
			src: url("fonts/DoHyeon-Regular.ttf");
		}
		body{
			background-color: #FFF3F3;
			font-family: "DoHyeon";
		}
		*{
			margin: 0;
			padding: 0;
		}
		#informBox{
			margin: auto;
			margin-top: 120px;
			width: 900px;
			height: 900px;
			background-color: #FFBDBD;
			overflow: scroll;
		}
		.closeBtn{
			font-size: 30px;
			margin: 20px;
			position: relative;
			left: 840px;
			top: 15px;
			text-decoration: none;
			color: black;
		}
		.informTitle{
			font-size: 25px;
			text-align: center;
			margin-top: 50px;
			margin-bottom: 30px;
		}
		.informContent{
			font-size: 20px;
			text-align: center;
			margin-top: 10px;
			margin-bottom: 50px;
		}
		
		.btn{
			background-color: white;
			box-shadow: 4px 4px 10px lightgrey;
			border-radius: 40px;
			width: 370px;
			height: 75px;
			border: none;
			margin: 20px;
			padding-bottom: 10px;
			padding-right: 5px;
		}
		.Logo{
			margin-top: 12px;
			margin-right: 10px;
		}
		.btnText{
			display: inline;
			font-size: 30px;
			font-family: "DoHyeon";
			position: relative;
			bottom: 9px;
		}
		
		.btnArea{
			position: fixed;
			bottom: 250px;
			text-align: center;
			width: 100%;
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
	%>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function popup(){
			window.open('popup_home.jsp', '팝업 테스트', 'width=400, height=300, top=10, left=10');
		} 
		
		var user_id = "<%=userID%>";
		// alert(user_id);
		
		if(user_id == "null"){
			popup();
			location.href = "index.jsp";
		} 
		
		function saveAs(url, fileName) {
			  const link = document.createElement('a');
			  link.href = url;
			  link.download = fileName;
			  document.body.appendChild(link);
			  link.click();
			  document.body.removeChild(link);
		}
		
		function screenshot(){
			var informBox = document.getElementById("informBox");
			
			html2canvas(informBox, {
			    allowTaint: true,
			    useCORS: true,
			    width: informBox.offsetWidth,
			    height: informBox.offsetHeight,
			    scale: 1
			  }).then(function (canvas) {
			    const imageURL = canvas.toDataURL('image/jpeg');
			    console.log(imageURL);
			    
			    saveAs(imageURL, 'SurveyFormService.jpg');
			  }).catch(function (err) {
			    console.log(err);
			  });
		}
		
		async function getImageURL() {
			var informBox = document.getElementById("informBox");
			var imageURL = null;
			
			let promise = html2canvas(informBox, {
			    allowTaint: true,
			    useCORS: true,
			    width: informBox.offsetWidth,
			    height: informBox.offsetHeight,
			    scale: 1
			  }).then(function (canvas) {
			    imageURL = canvas.toDataURL('image/jpeg');
			    // console.log("In getUmageURL() : " + imageURL);
			   	
			    // console.log(imageURL);
			  }).catch(function (err) {
			    console.log(err);
			  });
			
			let result = await promise;
			// console.log("In getImageURL() : " + imageURL);
			return imageURL;
		}
		
		function sendMail(){
			// window.open("./actionJSP/sendMailAction.jsp", "", "width=370, height=360, resizable=no, scrollbars=no, status=no");
			console.log("send mail");
			var promise = getImageURL();
			var getData = () => {
				promise.then((imageURL) => {
					// console.log(imageURL);
					
					// document.getElementById("test").src = imageURL;
					
					$.ajax({
						url : "actionJSP/sendMailAction.jsp",
						type : "post",
						data : {"surveyID" : <%=surveyID%>, "imageURL" : imageURL},
						dataType : "text",
						success : function(result){
							console.log("Success to send mail");	
							// console.log(result);
							// window.location.reload();
						},
						error: function(error){
							console.log("Fail to send mail");
						}
					})
				})
			}
			getData();
		}
	</script>
	<div class="header">
		<a href="home.jsp" class="serviceName">
			Survey Form Service
		</a>
		<img class="profileImg" src="images/profile.png">
		<div class="logInOut">
			Logout
		</div>
		
		<%
			QuestionDAO commonDTO = new QuestionDAO();
			String commonTitle = commonDTO.getCommonText(surveyID, "commonTitle");
			String commonContent = commonDTO.getCommonText(surveyID, "commonContent");
		%>
		
		<div id="informBox">
			<a class="closeBtn" href="/SurveyForm/home.jsp">
				X
			</a>
			<div class="informTitle"><%=commonTitle %></div>
			
			<div class="informContent"><%=commonContent %></div>
			
			<!-- <h1 style="text-align: center;">
				면접 일정은 2022.12.22 오후 2시 입니다. <br>
				아래의 줌 링크로 들어오시면 됩니다 :) <br>
				<br>
				줌 링크 : https://us05web.zoom.us/j/~~ <br>
				<br>
				<br>
				면접 때 뵙겠습니다~ <br>
				[문의] 21900806@handong.ac.kr
			</h1> -->
		</div>
		<div class="btnArea">
				<button class="btn" onclick="screenshot()">
					<img class="Logo" src="images/download.png" width="45px;">
					<p class="btnText">Download This Page<p>
				</button>
				
				<button class="btn" onclick="sendMail()">
					<img class="Logo" src="images/sendLogo.png" width="45px;">
					<p class="btnText">Send to Email<p>
				</button>
			</div>
	</div>
</body>
</html>