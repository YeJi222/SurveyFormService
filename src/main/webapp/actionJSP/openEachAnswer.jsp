<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="create.CreateDTO" %>
<%@ page import="create.CreateDAO" %>
<%@ page import="create.EnterDTO" %>
<%@ page import="create.EnterDAO" %>
<%@ page import="create.QuestionDTO" %>
<%@ page import="create.QuestionDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
	int surveyID = 0;
	String answerUser = null;
	String userID = null;
	
	if(request.getParameter("surveyID") != null){
		surveyID = Integer.parseInt(request.getParameter("surveyID"));
	}
	if(request.getParameter("answerUser") != null){
		answerUser = request.getParameter("answerUser");
	}
	if(session.getAttribute("userID") != null){ // 로그인한 상태여서, userID 세션 값이 존재한다면 
		userID = (String) session.getAttribute("userID");
	}
	
	if(userID == null){
		System.out.println("로그아웃 상태입니다.");
		
		return;
	}
	
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
	
		for(int i = 0 ; i < questionNum ; i++){
			// get answerValue - edit 할 때 기존의 답변을 불러오기 위해 
			EnterDAO answerDAO = new EnterDAO();
			System.out.println("================= getAnswerValue =================");
			
			String answerValue = null;
			System.out.println("익명 사용자가 아닙니다 ");
			answerValue = answerDAO.getAnswerValue(surveyID, answerUser, questionID[i]);
			
			// type - 0 : text / 1 : radio / 2 : checkbox
			if(type[i].equals("textType")){
				
	%>
				<div class="questionDiv">
					<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
					<div class="textAns" style="text-align: left;">
						<label class="questionText"><%=answerValue %></label>
					</div>
				</div>	
	<%	
			} else if(type[i].equals("radioType")){
				// get optionID count
				QuestionDAO daoOptionIDCount = new QuestionDAO();
				int optionID_count = daoOptionIDCount.getOptionIDCount(surveyID, questionID[i]);
				
				CreateDAO maxOptionID = new CreateDAO();
				int max_OptionID = maxOptionID.getMaxOptionID(surveyID, questionID[i]);	
	%>
				<div class="questionDiv">
					<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
					<div class="textAns" style="text-align: left;">
	<%
					int j = 0;
					while(j < max_OptionID + 1){
						// get optionContent type
						CreateDAO dao6 = new CreateDAO();
						String dbOptionContent = dao6.getOptionContent(surveyID, questionID[i], j);
						
						if(dbOptionContent == null){
							optionID_count++;
							j++;
						} else{
							
	%>
							<input type="radio" name="1answer<%=questionID[i]%>" value="<%=dbOptionContent %>" 
	<%
							if(dbOptionContent.equals(answerValue)){
	%>	
								checked
	<% 
							}
	%>					
							>
							<label for="radio"><%=dbOptionContent %></label><br>
	<%
							j++;
						}
					}
	%>
					</div>
				</div>
	<%				
			} else if(type[i].equals("checkboxType")){
				System.out.print("answerValue : ");
				System.out.println(answerValue);
				
				if(answerValue == null){
					answerValue = "";
				}
				
				String[] checkList = answerValue.split(", ");
				System.out.println("%%% checkList %%%");
				for(int k = 0 ; k < checkList.length ; k++){
					System.out.println(checkList[k]);
				}
				
				// get optionID count
				QuestionDAO daoOptionIDCount = new QuestionDAO();
				int optionID_count = daoOptionIDCount.getOptionIDCount(surveyID, questionID[i]);
				
				CreateDAO maxOptionID = new CreateDAO();
				int max_OptionID = maxOptionID.getMaxOptionID(surveyID, questionID[i]);	
	%>
				<div class="questionDiv">
					<p style="text-align: left;"> Q<%=i+1 %>. <%=questionContent[i] %> </p>
					<div class="textAns" style="text-align: left;">
	<%
					/* System.out.print("optionID_count : ");
					System.out.println(optionID_count);
					System.out.print("max_OptionID : ");
					System.out.println(max_OptionID); */
					
					int j = 0;
					while(j < max_OptionID + 1){
						// get optionContent type
						CreateDAO dao6 = new CreateDAO();
						String dbOptionContent = dao6.getOptionContent(surveyID, questionID[i], j);
						
						if(dbOptionContent == null){
							optionID_count++;
							j++;
						} else{
	%>
							<input type="checkbox" id="checkboxID<%=j %>" name="2answer<%=questionID[i]%>" value="<%=dbOptionContent %>" 
	<%
							for(int k = 0 ; k < checkList.length ; k++){
								// System.out.println(checkList[k]);
								if(dbOptionContent.equals(checkList[k])){
	%>
									checked
	<%
								}
							}
	%>
							
							>
							<label for="checkbox"><%=dbOptionContent %></label><br>
	<%
							j++;
						}
					}
	%>
					</div>
				</div>
	<%				
			}
			
		}

%>