<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pop-up</title>
<link href="css/popup.css" rel="stylesheet">
<style>
	.okBtn{
		background-color: tomato;
		padding: 20px;
		color: white;
		border-radius: 20px;
		font-size: 20px;
		padding-left: 50px;
		padding-right: 50px;
	}
</style>
<script>
	// Action of close the pop-up window
	function closePopup(){
		window.close();
	}
</script>
</head>
<body>
	<%
		String alertContent = null;
		if(request.getParameter("alertContent") != null){
			alertContent = request.getParameter("alertContent");
		}
		
		System.out.println(alertContent);
	%>
	<!-- <h3>이미 로그인 된 상태입니다. <br>Home 화면으로 이동합니다 :)</h3> -->
	
	<h3><%=alertContent %></h3>
	<br><br>
	<a class="okBtn" onclick="closePopup()">OK</a>
</body>
</html>