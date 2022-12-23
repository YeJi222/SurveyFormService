<%@ page import="common.JDBConnect"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>JDBC</title></head>
<body>
    <h2>JDBC 테스트 1</h2>
    <%
    JDBConnect jdbc1 = new JDBConnect(); 
    jdbc1.close(); 
    %>
</body>
</html>