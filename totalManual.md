# 🔑 전체적인 서비스 이용방법 

## 🎈 First Page (Before Login)
<img src="https://ifh.cc/g/pZ7gVJ.jpg" width="600px;">
<ul>
<li> Login 버튼 -> 로그인 페이지로 </li>
<li> Register 버튼 -> 회원가입 페이지로 </li>
</ul>

## 🎈 Register Page
<figure class="half">
  <img src="https://ifh.cc/g/B2tjaQ.png"> 
  <img src="https://ifh.cc/g/cnKWBY.png">
figure>

<ul>
<li> 새로 가입할 아이디와 비밀번호, 이메일 주소를 입력받게 하고 Register 버튼을 누르면 회원가입을 할 수 있다 </li>
<li> 서비스에 이미 가입한 경우, 하단에 'Go To Login' 버튼을 누르면 로그인 화면으로 이동할 수 있다 </li>
</ul>
<br>

## 🎈 Login Page
<img src="https://ifh.cc/g/D8WPm9.jpg" width="600px;">
<li> 아이디, 비밀번호를 입력받게 하고 Login 버튼을 누르면 로그인을 시도하도록 한다. </li>
<br/>

<img src="https://ifh.cc/g/dL3jnN.png" width="600px;">
<li> 아이디나 비밀번호를 하나라도 입력하지 않으면 로그인 처리를 하지 않고, 사용자가 다시 한 번 확인할 수 있도록 한다.
<li> 파란 글씨의 Register 버튼을 누르면 회원가입 페이지로 이동한다.
<li> Login with Google 버튼은, 구글 계정으로 로그인이 가능하게 하는 기능이다.(구현 전)

## 🎈 Home Page (After Login)
<img src="https://ifh.cc/g/vQKzPj.png" width="600px;">
<li> 로그인에 성공하면, HomePage로 이동할 수 있게 된다.
<li> 로그인이 된 상태이므로 상단에 Logout이 뜨게 되고, <br/>
이 버튼을 누르면 로그아웃을 하여 로그인 전에 접속할 수 있는 첫 페이지로 이동하게 된다.
<li> 구글폼을 나타내는 형식을 카드 형식으로 구성하였으며, 가로로 스크롤이 되게 하였다.
<li> 하단에 있는 + Create Survey 버튼을 누르면 구글폼을 생성할 수 있는 페이지로 이동하게 된다.
<li> <b> (+) 현재 홈 페이지의 데이터들은 DB와 연동이 되어 DB에 있는 정보들을 불러오고 있다.(updated) </b> </li>
