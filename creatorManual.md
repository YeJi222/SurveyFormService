# 🌱 생성자 모드 기능 및 사용방법
![totalManualPage](https://capsule-render.vercel.app/api?type=waving&color=auto&height=300&section=header&text=Creator-Manual&fontSize=90)

## 🎈 Create Page (After Login)
<img src="https://ifh.cc/g/Gdj5DT.png" width="600px;">
<ul>
  <li>Home Page에서 Create Survey 버튼을 누르면 나타나는 가장 초기의 Survey Form 화면이다</li>
  </li>Form Name과 Form을 설명할 수 있는 칸이 있으며, 디폴트로 각각 제목 없음과 내용 없음이라는 데이터가 들어간다</li>
  <li> 이 페이지에서도 상단에 Logout 버튼을 누르면 로그아웃이 가능하며, 로그아웃을 할 경우 맨 첫 페이지로 이동하게 된다 </li>
</ul>

<img src="https://ifh.cc/g/kJ5wbt.png" width="600px;">
<ul>
  <li>'+ 항목 추가하기' 버튼을 누르면 문항이 하나씩 생성되고, 빨간색 '-'버튼을 누르면 문항을 개별적으로 삭제할 수 있다 </li>
  </li>질문 내용을 입력할 수 있고, 오른쪽의 Select Type 버튼을 눌러 질문 유형을 text/radio/checkbox 세 가지 타입 중에서 택할 수 있다</li>
</ul>

<img src="https://ifh.cc/g/MgrBPO.jpg" width="600px;">
<ul>
  <li>text/radio/checkbox 타입의 문항들을 하나씩 추가해본 결과이다</li>
  <details>
    <summary><b>Text Type 지정</b></summary>
    <ul>
      <li> 텍스트 타입을 지정하게 되면, 텍스트를 입력할 수 있는 양식이 뜨게 된다 </li>
    </ul>
  </details>

  <details>
    <summary><b>Radio Type 지정</b></summary>
    <ul>
      <li> Radio 타입을 지정하게 되면, Radio Option 내용을 입력할 수 있는 양식이 뜨게 된다 </li>
      <li> Add Option 버튼을 클릭하여 Radio Type의 Option들을 하나씩 추가할 수 있다</li>
      <li> 추가한 Option들 옆에 있는 -버튼을 누르면 해당 option을 지울 수 있다</li>
    </ul>
  </details>

  <details>
    <summary><b>Checkbox Type 지정</b></summary>
    <ul>
      <li> Checkbox 타입을 지정하게 되면, Checkbox Option 내용을 입력할 수 있는  양식이 뜨게 된다 </li>
      <li> Add Option 버튼을 클릭하여 Checkbox Type의 Option들을 하나씩 추가할 수 있다 </li>
      <li> Radio Type과 마찬가지로 추가한 Option들 옆에 있는 -버튼으로 해당 checkbox option을 지울 수 있다. </li>
    </ul>
  </details>
</ul>  


## ( + Radio Type 문항 추가 )
<img src="https://ifh.cc/g/owFt8S.jpg" width="500px;">
<ul>
  <li>Radio Type의 문항을 하나 더 추가한 후, 총 4개의 문항을 가진 Survey Form을 생성하였다</li>
  <li>하단의 Make Final Page 버튼을 누르면, 응답자가 설문 응답에 완료한 후 보여지게 되는 결과 페이지를 직접 구성할 수 있는 페이지로 이동하게 된다 </li>
</ul>

## 🎈 Make Final Page (After Login)
<img src="https://ifh.cc/g/OPBjf7.jpg" width="500px;">
<ul>
  <li>응답자에게 보여질 결과 페이지를 구성하는 페이지이다 </li>
  <li>응답자가 Radio Type의 문항에 응답하는 선택지에 따라 결과 페이지를 달리 구성할 수 있고, 응답과 상관없이 공통적으로 보여질 내용도 입력할 수 있다 </li>
  <li>기본적인 html 태그들과 이 서비스에서 제공하는 사용자 정의 태그들을 사용하여 결과 페이지를 구성할 수 있다 </li>
  <li>단, 주의할 점은 사용자 정의 태그들 속에서 텍스트를 입력해야 하며, html 태그들도 사용자 정의 태그들 안에서만 유효하다 </li>
</ul>

### 👀 사용자 정의 태그 사용방법
- 총 4개의 사용자 정의 태그를 제공 
1. <title></title> : 상단 제목을 나타내는 태그 
2. <headerText></headerText> : 상단 헤더 부분을 나타내는 태그 
3. <centerText></centerText> : 중간 본문을 나타내는 태그 
4. <contact></contact> : 문의 연락처를 남기는 태그 

(EX) 문의 연락처를 남기고 싶다면 <contact></contact> 태그 사이에 내용을 입력
``` xml
<contact>[문의] 21900806@handong.ac.kr</contact>
```

<div align=center>
  <img src="https://ifh.cc/g/6axmjZ.png" width="50%">
  <img src="https://ifh.cc/g/mVpstt.png" width="30%">
</div>

<ul>
  <li>앞 페이지에서 생성한 라디오 타입의 문항을 선택할 수 있다 </li>
</ul>

<img src="https://ifh.cc/g/rTHdpn.jpg" width="600px;">
<ul>
  <li>'2번 문제'를 선택하면 2번 문항의 옵션별로 결과 페이지에 보여질 내용을 입력할 수 있다 </li>
  <li>사용자 정의 태그를 사용하여 내용을 입력할 수 있다</li>
</ul>

<img src="https://ifh.cc/g/1jfYwF.jpg" width="400px;">
<ul>
  <li>질문별로 미리보기 하고 싶은 option을 선택한 후, '결과 안내 페이지 미리보기' 버튼을 누르면 응답자가 보여질 예시 결과 페이지를 보여준다</li>
</ul>

### 생성한 Survey Form 링크 복사 기능
<img src="https://ifh.cc/g/BBzFnW.png" width="500px;">
: 복사 아이콘을 클릭하면 링크를 복사해준다 

## 🎈 생성된 Survey Form 확인하기 
<img src="https://ifh.cc/g/x1apGR.png" width="500px;">
<ul>
  <li>홈페이지로 돌아가면 생성한 질문지 리스트에 방금 생성한 Survey Form이 추가된 것을 확인할 수 있다 </li>
</ul>

## 🎈 Result Page (응답자 결과 통계 페이지 & 응답자별 설문 페이지)
: 응답자들이 응답한 결과의 통계를 한 눈에 파악할 수 있는 기능과, 각 응답자마다의 응답 결과를 볼 수 있는 기능 두 가지 기능을 제공한다 

<div align=center>
  <img src="https://ifh.cc/g/GjPGlY.jpg" height="400px">
  <img src="https://ifh.cc/g/tjbShL.jpg" height="400px">
</div>

<ul>
  <li>Statics 버튼을 누르면 문항별로 응답자들의 응답을 모아서 볼 수 있다 </li>
  <li>text/radio/checkbox 타입별로 보여지는 차트 종류를 달리하여, 각 타입별로 결과를 효과적으로 파악할 수 있도록 하였다 </li>
</ul>

<div align=center>
  <img src="https://ifh.cc/g/vFMXLH.jpg" height="500px">
  <img src="https://ifh.cc/g/zDkdtb.jpg" height="500px">
</div>

<ul>
  <li>Each Answer 버튼을 누르면 응답한 유저별로 응답 결과를 확인할 수 있다 </li>
  <li>응답한 User별 응답 보기 영역에서 응답한 유저들을 보여주고, 가로로 스크롤이 가능하게 하였다 </li>
  <li>조회하고 싶은 응답자를 클릭하면, 그 응답자의 답변들을 볼 수 있다</li>
</ul>

