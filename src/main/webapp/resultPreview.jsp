<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="create.AnswerDTO" %>
<%@ page import="create.AnswerDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="css/common.css" rel="stylesheet">
	<style>
		@font-face {
		    font-family: 'GangwonEduSaeeum_OTFMediumA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduSaeeum_OTFMediumA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
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
		#captureDiv{
			margin-bottom: 20px;
		}
		#informBox{
			position: relative;
			margin: auto;
			margin-top: 90px;
			width: 900px;
			min-height: 900px;
			/* height: 1000px; */
			background-color: #FFBDBD;
			overflow: scroll;
		}
		/* .contactBox{
			margin: auto;
			width: 1000px;
			background-color: #FFBDBD;
		} */
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
			font-size: 25px;
			text-align: center;
			margin-top: 10px;
			margin-bottom: 50px;
		}
		.contactTagDiv{ /* 부모가 relative, 자식이 absolute */
			text-align: center;
			font-size: 30px;
			margin: auto;
			margin-bottom: 10px;
			padding-bottom: 30px;
			width: 900px;
			background-color: #FFBDBD;
			/* min-height: 20px; */
		}
		.contactTag{ 
			position: relative;
		}
		.centerTextTagDiv{ /* 부모가 relative, 자식이 absolute */
			text-align: center;
			font-size: 30px;
			position: relative;
			/* height: 100%; */
			margin-bottom: 30px;
			top: 5;
			bottom: 10;
			width: 100%;
			font-family: "GangwonEduSaeeum_OTFMediumA";
		}
		.centerTextTag{
			color: black;
		}
		
		.titleTagDiv{ /* 부모가 relative, 자식이 absolute */
			text-align: center;
			font-size: 45px;
			position: relative;
			margin-bottom: 30px;
			top: 0;
			width: 100%;
		}
		.titleTag{
			color: black;
		}
		
		.headerTextTagDiv{ /* 부모가 relative, 자식이 absolute */
			text-align: center;
			font-size: 30px;
			position: relative;
			top: 0;
			margin-bottom: 40px;
			width: 100%;
			/* background-color: lightgreen; */
		}
		.headerTextTag{
			color: darkblue;
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
			text-align: center;
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
		
		String previewOptionList = null;
		if(request.getParameter("previewOptionList") != null){
			previewOptionList = request.getParameter("previewOptionList");
		}
		System.out.print("previewOptionList : ");
		System.out.println(previewOptionList);
		
		String[] previewOption = previewOptionList.split(",");
		int previewOptionListSize = previewOption.length;
		
		// 응답한 라디오타입 응답 결과 가져오기
		String[] answer = new String[previewOptionListSize];
		String[] answerResult = new String[previewOptionListSize];
		
		for(int i = 0 ; i < previewOptionListSize ; i++){
			answer[i] = previewOption[i];
			System.out.println(answer[i]);
			
			// surveyID, answer로 resultContent 테이블에서 resultContent 알아내기 
			QuestionDAO questionDAO = new QuestionDAO();	
			answerResult[i] = questionDAO.geResultContent(surveyID, answer[i]);
			
			System.out.println(answerResult[i]);
		}
	%>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function popup(){
			window.open('popup_home.jsp', '팝업 테스트', 'width=400, height=600, top=10, left=10');
		} 
		
		var user_id = "<%=userID%>";
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
			var informBox = document.getElementById("captureDiv");
			
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
			var informBox = document.getElementById("captureDiv");
			var imageURL = null;
			
			let promise = html2canvas(informBox, {
			    allowTaint: true,
			    useCORS: true,
			    width: informBox.offsetWidth,
			    height: informBox.offsetHeight,
			    scale: 1
			  }).then(function (canvas) {
			    imageURL = canvas.toDataURL('image/jpeg');
			  }).catch(function (err) {
			    console.log(err);
			  });
			
			let result = await promise;
			return imageURL;
		}
		
		function sendMail(){
			console.log("send mail");
			var promise = getImageURL();
			
			var alertContent = "메일이 성공적으로 전송되었습니다 :)";
			var alertContentErr = "메일 전송에 실패하였습니다. <br> 등록된 메일 주소를 다시 확인해주세요 :)";
			
			var getData = () => {
				promise.then((imageURL) => {
					$.ajax({
						url : "actionJSP/sendMailAction.jsp",
						type : "post",
						data : {"surveyID" : <%=surveyID%>, "imageURL" : imageURL},
						dataType : "text",
						success : function(result){
							console.log("Success to send mail");	
							window.open('popup.jsp?alertContent='+alertContent, '팝업', 'width=400, height=280, top=10, left=200');
							// console.log(result);
							// window.location.reload();
						},
						error: function(error){
							console.log("Fail to send mail");
							window.open('popup.jsp?alertContent='+alertContentErr, '팝업', 'width=400, height=280, top=10, left=200');
						}
					})
				})
			}
			getData();
		}
	</script>
		<%
			QuestionDAO commonDTO = new QuestionDAO();
			String commonTitle = commonDTO.getCommonText(surveyID, "commonTitle");
			String commonContent = commonDTO.getCommonText(surveyID, "commonContent");
		%>
		
		<div id="captureDiv">
			<div id="informBox">
			<a class="closeBtn" onclick="window.close();">
				X
			</a>
		<%
			String displayResultText = commonTitle + commonContent;
				for(int i = 0 ; i < previewOptionListSize ; i++){
					// 사용자 정의 태그 check 
					System.out.println();
					System.out.print("radio question ");
					System.out.println(i);
					
					if(answerResult[i] != null){
						displayResultText += answerResult[i];
					}
					System.out.print("사용자 정의 태그 : ");
					System.out.println(displayResultText);
				}	
				Pattern pattern = Pattern.compile("(<contact>)(.*.)(</contact>)");
				Pattern pattern2 = Pattern.compile("(<centerText>)(.*.)(</centerText>)");
				Pattern pattern3 = Pattern.compile("(<headerText>)(.*.)(</headerText>)");
				Pattern pattern4 = Pattern.compile("(<title>)(.*.)(</title>)");
				
				Matcher matcher = pattern.matcher(displayResultText);
				Matcher matcher2 = pattern2.matcher(displayResultText);
				Matcher matcher3 = pattern3.matcher(displayResultText);
				Matcher matcher4 = pattern4.matcher(displayResultText);
		%>
				<div class="titleTagDiv">
		<%
				while(matcher4.find()){ // <contact></contact> 태그 
					System.out.println("title 태그 포함되어 있음!");
					System.out.println(matcher4.group(2));
					String titleStr = matcher4.group(2);
		%>
					<div class="titleTag"> <%=titleStr %></div>
		<%
					if(matcher4.group(2) == null){
						break;
					}
				}
		%>
				</div> 
				<div class="headerTextTagDiv">
		<%
				while(matcher3.find()){ // <contact></contact> 태그 
					System.out.println("headerText 태그 포함되어 있음!");
					System.out.println(matcher3.group(2));
					String headerTextStr = matcher3.group(2);
		%>
	
					<div class="headerTextTag"> <%=headerTextStr %></div>
		<%
					if(matcher3.group(2) == null){
						break;
					}
				}
		%>
				</div> 
	
				<div class="centerTextTagDiv">
		<%
				while(matcher2.find()){ // <contact></contact> 태그 
					System.out.println("centerText 태그 포함되어 있음!");
					System.out.println(matcher2.group(2));
					String centerTextStr = matcher2.group(2);
		%>
	
					<div class="centerTextTag"> <%=centerTextStr %></div>
		<%
					if(matcher2.group(2) == null){
						break;
					}
				}
		%>
				</div> 
			</div>
			<div class="contactTagDiv">
		<%
				while(matcher.find()){ // <contact></contact> 태그 
					System.out.println("contact 태그 포함되어 있음!");
					System.out.println(matcher.group(2));
					String contactStr = matcher.group(2);
		%>
					<div class="contactTag"> <%=contactStr %></div>
		<%
					if(matcher.group(2) == null){
						break;
					}
				}
		%>
			</div>
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
</body>
</html>