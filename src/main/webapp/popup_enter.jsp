<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pop-up</title>
<link href="css/popup.css" rel="stylesheet">
<style>
	a{ /* Ok Button's style */
	    text-decoration: none;
	    color: white;
	    font-size: 25px;
	    background-color: rgb(247, 138, 138);
	    border-radius: 30px;
	    font-weight: bold;
	    padding: 20px;
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
	<h3>이미 응답한 Survey Form 입니다 <br><br>Home으로 가는 버튼을 누르세요 :)</h3>
	<br><br>
	<a onclick="closePopup()">OK</a>
</body>
</html>