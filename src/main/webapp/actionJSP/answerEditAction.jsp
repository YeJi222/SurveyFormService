<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="create.EnterDTO" %>
<%@ page import="create.EnterDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");

	System.out.println("================== answerEditAction ==================");

	int surveyID = 0;
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	
	String userID = null;
	String answerUser = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	
	if(userID != null){
		answerUser = userID;
	} else{
		answerUser = "익명 사용자"; 
	}
	
	System.out.print("answerUser : ");
	System.out.println(answerUser);
	
	ArrayList<String> getAnswer = new ArrayList<String>();
	// ArrayList<String> answer = new ArrayList<String>();
	Enumeration params = request.getParameterNames();
	int i = 0;
	while(params.hasMoreElements()) {
	  	String name = (String) params.nextElement();
		if(name.equals("surveyID")) continue;
		else{
			getAnswer.add(name);
			// answer.add(request.getParameter(name));
		}
	  
	  	i++;
	}
	
	// answerID, type 구하기 
	String[] answerID_arr = new String[getAnswer.size()];
	String[] type_arr = new String[getAnswer.size()];
	for(int j = 0 ; j < getAnswer.size() ; j++){
		answerID_arr[j] = getAnswer.get(j).substring(7);
		type_arr[j] = getAnswer.get(j).substring(0, 1);
		
		System.out.println(answerID_arr[j]);
		System.out.print("type : ");
		System.out.println(type_arr[j]);
	}
	
	// answer 구하기 
	String[] answerList = new String[getAnswer.size()];
	String[] tempCheckbox = new String[getAnswer.size()];
	for(int j = 0 ; j < getAnswer.size() ; j++){
		if(type_arr[j].equals("0") || type_arr[j].equals("1")){ // text, radio type
			answerList[j] = request.getParameter(type_arr[j] + "answer" + answerID_arr[j]);
		} else{ // checkbox type
			tempCheckbox = request.getParameterValues(type_arr[j] + "answer" + answerID_arr[j]);
			
			answerList[j] = "";
			for(int k = 0 ; k < tempCheckbox.length ; k++){
				System.out.println(tempCheckbox[k]);
				
				if(k == tempCheckbox.length - 1){ // 마지막 
					answerList[j] = answerList[j] + tempCheckbox[k];
				} else{
					answerList[j] = answerList[j] + tempCheckbox[k] + ", "; 
				}
				
			}
			System.out.println();
		}
		// answerList[j] = request.getParameterValues("answer" + answerID_arr[j]);
	}
	
	// answerID string to int
	int[] answerID_int = new int[getAnswer.size()];
	for(int j = 0 ; j < getAnswer.size() ; j++){
		answerID_int[j] = Integer.parseInt(answerID_arr[j]);
	}
	
	// type number to string
	String[] type = new String[getAnswer.size()];
	for(int j = 0 ; j < getAnswer.size() ; j++){
		if(type_arr[j].equals("0")){
			type[j] = "textType";
		} else if(type_arr[j].equals("1")){
			type[j] = "radioType";
		} else{
			type[j] = "checkboxType";
		}
		
	}
	
	EnterDAO enterDAO = new EnterDAO();
	// update 할 때 필요한 data : surveyID, answerUser, answerID_int[i], answerList[i]
	for(int j = 0 ; j < answerList.length ; j++){
		System.out.println(answerList[j]);
		
		int existCheck = enterDAO.existAnswer(surveyID, answerUser, answerID_int[j]);
		System.out.print("existCheck : ");
		System.out.println(existCheck);
		
		if(existCheck == 0){ // answerSurvey 테이블에 항목이 없음 - insert 해줘야 함 
			int insertResult = enterDAO.insertAnswer(surveyID, answerUser, type[j], answerID_int[j], answerList[j]);
			if(insertResult == -1){
				System.out.println("sql error -1");

				return;
			} else{
				System.out.println("success to insert answer");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = '/SurveyForm/home.jsp';");
				script.println("</script>");
				script.close();
			}
		} else{
			int result =  enterDAO.updateAnswer(surveyID, answerUser, answerID_int[j], answerList[j]);
			if(result == -1){
				System.out.println("sql error -1");

				return;
			} else{
				System.out.println("success to update answer");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = '/SurveyForm/home.jsp';");
				script.println("</script>");
				script.close();
			}
		}
	}
	
	/* 
	// 중복 데이터 있는지 확인 
	int check = enterDAO.checkDuplicateAnswer(surveyID, answerUser);
	System.out.print("check : ");
	System.out.println(check); */
	
	// check가 0이면 중복 응답 없는 것 
	
	/* if(check == 0){
		// insert할 data : surveyID, answerUser, type[i], answerID_int[i], answerList[i]
		for(int j = 0 ; j < answerList.length ; j++){
			System.out.println(answerList[j]);
			
			int result =  enterDAO.insertAnswer(surveyID, answerUser, type[j], answerID_int[j], answerList[j]);
			if(result == -1){
				System.out.println("sql error -1");

				return;
			} else{
				System.out.println("success to insert answer");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = '/SurveyForm/home.jsp';");
				script.println("</script>");
				script.close();
			}
		}
	} else{
		System.out.println("이미 응답한 설문으로, edit만 가능합니다 :)");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("window.open('/SurveyForm/popup.jsp', '팝업 테스트', 'width=400, height=300, top=10, left=10');");
		script.println("location.href = '/SurveyForm/home.jsp';");
		script.println("</script>");
		script.close();
		
	} */
%>