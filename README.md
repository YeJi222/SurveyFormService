# Project Name : Survey Form Service 

![serviceName](https://capsule-render.vercel.app/api?type=waving&color=auto&height=300&section=header&text=SurveyFormService&fontSize=90)

<img src="https://img.shields.io/badge/JAVA-1572B6?style=for-the-badge&logo=JAVA&logoColor=white"> <img src="https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"> <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white"> <img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=CSS&logoColor=white"> <img src="https://img.shields.io/badge/Chart.js-FF6384?style=for-the-badge&logo=Chart.js&logoColor=white"> <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white">

## 1. 프로젝트의 소개 및 목적
🌱 설문조사 폼을 만들 수 있고, 만든 설문에 응답이 가능하며 응답한 결과를 볼 수 있는 기존의 유사 서비스의 기본적인 기능에 추가적인 프로그래밍적 기능이 들어간 Survey Form Service 입니다
> <li>JSP 연습 Mini Project </li>
> <li>유사 서비스 'Google Form' 또는 'MicroSoft Survey Form'과의 차별점이 있는 서비스 제작</li>

## 2. 유사 서비스와의 차별점
> <li>생성한 설문지 뿐만 아니라 참여한 설문지 리스트도 확인 가능</li>
> <li>사용자가 응답한 폼 다시 열람 가능</li>
> <li>응답 페이지를 떠나면 수정이 불가했던 유사 서비스와 달리 언제든지 응답 수정 가능</li>
> <li>Radio Type의 질문에서 사용자가 응답한 답변에 따라, 최종 결과 페이지를 다르게 보여줄 수 있다 </li>
> <li>Survey Form을 만든 생성자는 사용자에게 보여줄 최종 페이지를 사용자의 응답에 따라 다르게 제공할 수 있다</li>
> <li>폼 생성자에게 사용자 정의 태그를 사용가능하게 하여, 사용자 응답에 따른 최종 페이지를 꾸밀 수 있게 한다</li>

## 3. 서비스 대표 기능 소개 및 자세한 사용방법 페이지 첨부 
### [📝 전체적인 서비스 이용방법](https://github.com/YeJi222/SurveyFormService/blob/main/totalManual.md)
🎈 로그인을 하면 설문지를 생성(생성자 모드)할 수도 있고, 생성한 설문지에 응답(참여자 모드)할 수도 있습니다. <br>
🎈 생성한 설문지와 참여한 설문지 리스트를 각각 확인가능합니다. <br>

### [📝 생성자 모드 기능 및 사용방법](https://github.com/YeJi222/SurveyFormService/blob/main/creatorManual.md)
* Survey Form 생성
* Form Name, Form에 대한 설명 작성 가능
* '+ 항목 추가하기' 버튼을 누르면 질문을 추가할 수 있고, 질문의 타입을 지정 가능
* 질문 타입의 종류는 3종류 - TextBox / Radio Box / Check Box
* Radio Box와 Check Box의 각 Option들을 추가 및 삭제 가능
* 추가한 문항을 개별적으로 삭제 가능
* 응답자가 Radio Type의 질문에 응답한 결과에 따라 사용자에게 보여줄 최종 페이지를 생성자가 구성할 수 있다
* 최종 페이지 구성하는 부분에서 참여자의 응답에 관계없이 공통적으로 보여질 내용 부분과 참여자가 응답하는 라디오 타입의 질문 응답에 따라 보여질 페이지를 따로 구성할 수 있다
* 사용자 정의 태그 4가지를 제공하고, 그 태그 안에서 기본적인 html 태그도 사용가능하게 한다
* 만든 Survey Form 수정 및 삭제 가능
* 참여자가 응답한 설문 전체 결과 페이지 확인 가능
* 응답한 사람들의 전체 통계 페이지와, 응답한 사람들의 페이지를 따로 볼 수 페이지를 모두 제공

### [📝 응답자 모드 기능 및 사용방법](https://github.com/YeJi222/SurveyFormService/blob/main/respondentManual.md)
* 생성된 Survey Form 링크로 들어가 답변을 작성하고 제출
* 이미 응답한 설문이면 제출 버튼이 아닌 edit 버튼이 뜨게 하고, 기존에 응답했던 정보들을 불러와 보여준다
* 제출한 Survey Form 응답 수정 가능
* Delete 버튼을 누르면, 자신의 홈 화면에서만 Survey 내역 삭제 가능
* Survey Form 생성자가 만든 최종 안내 페이지 따로 열람 가능
* 최종 안내 페이지 다운로드 가능
* 최종 안내 페이지 메일로 전송 가능

## 4. 사용 언어 및 사용환경
* JAVA
* HTML
* JavaScript
* jQuery
* CSS
* MySQL
* JSP(Java Server Page) <b> : HTML 환경에서 JAVA 코드를 삽입하는 JSP를 통해 웹 서버에서 동적으로 웹 브라우저를 관리</b> 

## 5. 프로젝트 구조
<b>[프로젝트 구조]</b> <br>
<b>(SurveyForm/src/main/java/)</b> : java 파일들 - DTO, DAO  <br>
<b>(SurveyForm/src/main/webapp/WEB-INF/lib/)</b> : jar 파일들 <br>
<b>(SurveyForm/src/main/webapp/)</b> : jsp 파일들  <br>
<b>(SurveyForm/src/main/webapp/actionJSP)</b> : action이 이루어지는 jsp 파일들  <br>
<b>(SurveyForm/src/main/webapp/css)</b> : css 파일  <br>
<b>(SurveyForm/src/main/webapp/fonts)</b> : 사용한 폰트 파일  <br>
<b>(SurveyForm/src/main/webapp/images)</b> : 사용한 이미지 파일들 <br> 

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

## 6. Database
* Mysql 연동 
* [Database 구성 보러가기 👀](https://github.com/YeJi222/SurveyFormService/blob/main/DB.md)

## 7. Install
<b>🍄 Clone this 'Survey Form Service' Repository</b>
```xml
git clone https://github.com/YeJi222/SurveyFormService.git
```

<b>🍄 jar 파일 다운로드</b>
* mysql-connector-j-8.0.31.jar
* mail-1.4.7.jar
* activation.jar

## 8. Note
<b>[프로젝트 추후 더 개발할 부분]</b>
* 다양한 예외 처리
* 구글 로그인
* 익명 응답도 가능하게 하였는데, 서비스적으로 더 고려해보기
