# Project Folder Structure

📦src  
 ┣ 📂main  
 ┃ ┣ 📂java  
 ┃ ┃ ┣ 📂common  
 ┃ ┃ ┃ ┗ 📜JDBConnect.java  
 ┃ ┃ ┣ 📂create  
 ┃ ┃ ┃ ┣ 📜AnswerDAO.java  
 ┃ ┃ ┃ ┣ 📜AnswerDTO.java  
 ┃ ┃ ┃ ┣ 📜CreateDAO.java  
 ┃ ┃ ┃ ┣ 📜CreateDTO.java  
 ┃ ┃ ┃ ┣ 📜EnterDAO.java  
 ┃ ┃ ┃ ┣ 📜EnterDTO.java  
 ┃ ┃ ┃ ┣ 📜QuestionDAO.java  
 ┃ ┃ ┃ ┗ 📜QuestionDTO.java  
 ┃ ┃ ┣ 📂mail  
 ┃ ┃ ┃ ┣ 📜MailAuth.java  
 ┃ ┃ ┃ ┗ 📜MailSend.java  
 ┃ ┃ ┗ 📂userInfo  
 ┃ ┃ ┃ ┣ 📜UserDAO.java  
 ┃ ┃ ┃ ┗ 📜UserDTO.java   
 ┃ ┣ 📂webapp  
 ┃ ┃ ┣ 📂META-INF  
 ┃ ┃ ┃ ┗ 📜MANIFEST.MF  
 ┃ ┃ ┣ 📂WEB-INF  
 ┃ ┃ ┃ ┗ 📂lib  
 ┃ ┃ ┃ ┃ ┣ 📜activation.jar   
 ┃ ┃ ┃ ┃ ┣ 📜mail-1.4.7.jar  
 ┃ ┃ ┃ ┃ ┗ 📜mysql-connector-j-8.0.31.jar  
 ┃ ┃ ┣ 📂actionJSP   
 ┃ ┃ ┃ ┣ 📜RadioOptionContentUpdateAction.jsp  
 ┃ ┃ ┃ ┣ 📜addOptionAction.jsp  
 ┃ ┃ ┃ ┣ 📜answerEditAction.jsp  
 ┃ ┃ ┃ ┣ 📜answerSaveAction.jsp  
 ┃ ┃ ┃ ┣ 📜createSurveyAction.jsp  
 ┃ ┃ ┃ ┣ 📜defaultOptionAction.jsp  
 ┃ ┃ ┃ ┣ 📜deleteEnterSurveyAction.jsp  
 ┃ ┃ ┃ ┣ 📜deleteOptionAction.jsp  
 ┃ ┃ ┃ ┣ 📜deleteQuestionAction.jsp  
 ┃ ┃ ┃ ┣ 📜deleteQuestionInResult.jsp  
 ┃ ┃ ┃ ┣ 📜deleteSurveyAction.jsp  
 ┃ ┃ ┃ ┣ 📜insertEnterForm.jsp  
 ┃ ┃ ┃ ┣ 📜insertQuestionAction.jsp  
 ┃ ┃ ┃ ┣ 📜insertResultContent.jsp   
 ┃ ┃ ┃ ┣ 📜loadSurveyIDAction.jsp  
 ┃ ┃ ┃ ┣ 📜loginAction.jsp  
 ┃ ┃ ┃ ┣ 📜openEachAnswer.jsp  
 ┃ ┃ ┃ ┣ 📜registerAction.jsp  
 ┃ ┃ ┃ ┣ 📜sendMailAction.jsp  
 ┃ ┃ ┃ ┣ 📜textAction.jsp  
 ┃ ┃ ┃ ┣ 📜updateAjaxAction.jsp  
 ┃ ┃ ┃ ┣ 📜updateCommonText.jsp  
 ┃ ┃ ┃ ┣ 📜updateQuestionAction.jsp  
 ┃ ┃ ┃ ┗ 📜updateResultContent.jsp  
 ┃ ┃ ┣ 📂css  
 ┃ ┃ ┃ ┣ 📜common.css  
 ┃ ┃ ┃ ┗ 📜popup.css  
 ┃ ┃ ┣ 📂fonts  
 ┃ ┃ ┃ ┣ 📜DoHyeon-Regular.ttf  
 ┃ ┃ ┃ ┗ 📜iLove.ttf  
 ┃ ┃ ┣ 📂images  
 ┃ ┃ ┃ ┣ 📜copyIcon.png  
 ┃ ┃ ┃ ┣ 📜download.png   
 ┃ ┃ ┃ ┣ 📜email.png  
 ┃ ┃ ┃ ┣ 📜googleLogo.png  
 ┃ ┃ ┃ ┣ 📜homeLogo.png  
 ┃ ┃ ┃ ┣ 📜idImg.png  
 ┃ ┃ ┃ ┣ 📜pencil.png  
 ┃ ┃ ┃ ┣ 📜profile.png  
 ┃ ┃ ┃ ┣ 📜pwImg.png  
 ┃ ┃ ┃ ┣ 📜sendLogo.png  
 ┃ ┃ ┃ ┣ 📜surveyImg.png  
 ┃ ┃ ┃ ┣ 📜trash.png   
 ┃ ┃ ┃ ┗ 📜trashcan.png  
 ┃ ┃ ┣ 📂js  
 ┃ ┃ ┣ 📜.DS_Store  
 ┃ ┃ ┣ 📜ConnectionTest.jsp  
 ┃ ┃ ┣ 📜createAjaxAction.jsp  
 ┃ ┃ ┣ 📜createSurvey.jsp  
 ┃ ┃ ┣ 📜eachResult.jsp  
 ┃ ┃ ┣ 📜enterForm.jsp    
 ┃ ┃ ┣ 📜home.jsp  
 ┃ ┃ ┣ 📜index.jsp  
 ┃ ┃ ┣ 📜inform.jsp  
 ┃ ┃ ┣ 📜login.jsp  
 ┃ ┃ ┣ 📜logoutAction.jsp  
 ┃ ┃ ┣ 📜makeFinalPage.jsp  
 ┃ ┃ ┣ 📜popup.jsp  
 ┃ ┃ ┣ 📜register.jsp  
 ┃ ┃ ┣ 📜result.jsp  
 ┃ ┃ ┗ 📜resultPreview.jsp  
 ┃ ┗ 📜.DS_Store  
 ┗ 📜.DS_Store 
