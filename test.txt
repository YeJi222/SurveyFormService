# Project Name : Survey Form Service
![homepage_img](https://ifh.cc/g/gS3Nsx.png)

### 1. 프로젝트의 목적 및 용도
<li>JSP 연습 Mini Project</li>
<li>유사 서비스 '구글폼'과의 차별점이 있는 서비스 제작</li>

### 2. 대표 기능 (제작중)
<b>[관리자 모드]</b>
<li>Survey Form 생성</li>
<li>Form Name, Form에 대한 설명 작성 가능</li>
<li>'+ 항목 추가하기' 버튼을 누르면 질문을 추가할 수 있고, 질문의 타입을 지정 가능</li>
<li>질문 타입의 종류는 3종류 - TextBox / Radio Box / Check Box</li>
<li>Radio Box와 Check Box의 각 Option들을 추가 및 삭제 가능</li>
<li>만든 Survey Form 수정 및 삭제 가능</li>
<li>참여자가 등록한 설문 결과 페이지 확인 가능</li>

<br>

<b>[참여자 모드]</b>
<li>생성된 Survey Form 링크로 들어가 답변을 작성하고 제출</li>
<li>Survey Form 생성자가 만든 최종 안내 페이지만 따로 열람 가능</li>
<li>제출한 Survey Form 응답 수정 가능</li>
<li>Delete 버튼을 누르면, 자신의 홈 화면에서만 Survey 내역 삭제 가능</li>

### 3. 사용 언어 및 사용환경
<li>JAVA</li>
<li>HTML</li>
<li>CSS</li>
<li>JSP(Java Server Page)</li>
<b>(HTML 환경에서 JAVA 코드를 삽입하는 JSP를 통해 웹 서버에서 동적으로 웹 브라우저를 관리)</b>

### 4. 유사 서비스와의 차별점
<li>사용자가 참여한 구글폼 다시 열람 가능</li>
<li>Survey Form을 생성한 관리자는 사용자에게 보여줄 최종 페이지를 제공할 수 있다</li>
<li>관리자에게 사용자 정의 태그를 사용가능하게 하여, 사용자 응답에 따른 최종 페이지를 꾸밀 수 있게 한다</li>

### 5. 프로젝트 구조 및 사용방법
<b>[프로젝트 구조]</b> <br>
<b>(SurveyForm/src/main/java/) java 파일들 </b> <br>
/common/JDBConnect.java <br>
/create/CreateDAO.java <br>
/create/CreateDTO.java <br>
/userInfo/UserDAO.java <br>
/userInfo/UserDTO.java <br>

<br>

<b>(SurveyForm/src/main/webapp/) jsp 파일들 </b> <br>
/ConnectionTest.jsp <br>
/createAjaxAction.jsp <br>
/createSurvey.jsp <br>
/createSurveyAction.jsp <br>
/enterForm.jsp <br>
/home.jsp (로그인 후, 사용할 수 있는 홈 페이지) <br>
/index.jsp (로그인, 회원가입 페이지) <br> 
/inform.jsp <br>
/login.jsp <br>
/loginAction.jsp <br>
/logoutAction.jsp <br>
/popup_home.jsp <br>
/popup.jsp <br>
/register.jsp <br>
/registerAction.jsp <br>
/result.jsp <br>

<br>

<b>(SurveyForm/src/main/webapp/actionJSP) action이 이루어지는 jsp 파일들 </b> <br>
/contentFirstRadioAction.jsp <br>
/deleteSurveyAction.jsp <br>
/insertQuestionAction.jsp <br>
/loadSurveyIDAction.jsp <br>
/radioFirstAction.jsp <br>
/textAction.jsp <br>
/updateAjaxAction.jsp <br>
/updateQuestionAction.jsp <br>

<br>

<b>(SurveyForm/src/main/webapp/css) css 파일 </b> <br>
/common.css <br>
/popup.css <br>

<br>

<b>(SurveyForm/src/main/webapp/fonts) 사용한 폰트 파일 </b> <br>
/DoHyeon-Regular.ttf <br>

<br>

<b>(SurveyForm/src/main/webapp/images) 사용한 이미지 파일들</b> <br> 
/googleLogo.png <br>
/homeLogo.png <br>
/idImg.png <br>
/pencil.png <br>
/profile.png <br>
/pwImg.png <br>
/sendLogo.png <br>
/surveyImg.png <br>
/trash.png <br>

### 6. Note
<li>아직 완성되지 않은 프로젝트로, 개발할 프로젝트에 대한 설명이다</li>
