<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Enumeration" %>
<%
	request.setCharacterEncoding("UTF-8");

	/* Enumeration params = request.getParameterNames();
	while(params.hasMoreElements()) {
	  String name = (String) params.nextElement();
	  System.out.print(name + " : " + request.getParameter(name) + "     "); 
	}
	System.out.println(); */

	// int id = 0;
	int maxLen = 10;
	String userID = null; 
	String formName = null;
	String[] questionDivName = {null, null, null, null, null, null, null, null, null, null};
	Date regidate = new Date();
	String[] textContent = {null, null, null, null, null, null, null, null, null, null};
	String[] type = {null, };
	int radioTypeCount = 0; // radio type 질문 개수 
	String[] radioDivName = {null, null, null, null, null, null, null, null, null, null};
	String[] radioOption = {null, null, null, null, null, null, null, null, null, null}; 
	int i = 0; // for문 initialization 
	
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		userID = (String) session.getAttribute("userID");
	}
	if(request.getParameter("formName") != null){
		formName = request.getParameter("formName");
	}
	if(request.getParameter("questionKind") != null){
		type = request.getParameterValues("questionKind");
	}
	if(request.getParameter("questionDivName") != null){
		questionDivName = request.getParameterValues("questionDivName");
	}
	if(request.getParameter("questionTextName") != null){
		textContent = request.getParameterValues("questionTextName");
	}
	if(request.getParameter("radioTypeCount") != null){
		radioTypeCount = Integer.parseInt(request.getParameter("radioTypeCount"));
	}
	if(request.getParameter("radioDivName") != null){
		radioDivName = request.getParameterValues("radioDivName");
	}
	if(request.getParameter("radioOptionID") != null){
		radioOption = request.getParameterValues("radioOptionID");
	}
	
	if(userID == null || formName == null){
		System.out.println("입력되지 않은 사항이 있습니다.");
		
		return;
	}
	
	System.out.print("Form Name : ");
	System.out.println(formName);
	System.out.print("Question Name : ");
	System.out.println(questionDivName);
	System.out.print("Regidate : ");
	System.out.println(regidate);
	System.out.print("Text Content Name : ");
	System.out.println(textContent);
	System.out.print("Length of Radio div name : ");
	System.out.println(radioDivName.length);
	/* for(i = 0 ; i < radioDivName.length ; i++){
		System.out.println(radioDivName[i]);
	} */
	System.out.print("Length of Question Name : ");
	System.out.println(questionDivName.length); 
	
	CreateDAO createDAO = new CreateDAO();
	
	System.out.println("");
	for(i = 0 ; i < radioOption.length ; i++){
		
		int result = createDAO.insert(new CreateDTO(userID, formName, questionDivName[0], textContent[0], type[0], radioOption[i], regidate));
		if(result == -1){
			System.out.println("sql error -1");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'create.jsp';");
			script.println("</script>");
			script.close();
			
			// return;
		} else{
			session.setAttribute("userID", userID);
			System.out.println("Form 생성 완료");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'home.jsp';");
			script.println("</script>");
			script.close();
			// return;
		}
		
		// if(i == (questionDivName.length - 1)) return;
	}
	
	
%>