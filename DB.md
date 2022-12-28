# DATABASE Name : survey_DB

CREATE DATABASE survey_DB default CHARACTER SET UTF8;

<img src="https://ifh.cc/g/7y0NyB.jpg" width="500px;">

# Table Schema
### user_info
<li>userID</li>
<li>userPW</li>

### adminList
<li>surveyID (survey 번호 - PK)</li>
<li>adminID (survey 만든 사람)</li>
<li>formName (survey 이름)</li>
<li>formDetail (survey 설명)</li>
<li>regidate (survey 생성 시간)</li>

### questionList
<li>surveyID (survey 번호 - FK)</li>
<li>questionID (문항 번호)</li>
<li>questionContent (질문 내용)</li>
<li>type (문항 타입 - text/radio/checkbox)</li>

### adminSurvey
<li>surveyID (survey 번호 - FK)</li>
<li>adminID</li>
<li>questionID (문항 번호)</li>
<li>questionContent (질문 내용)</li>
<li>type (문항 타입 - text/radio/checkbox)</li>
<li>optionID (option 당 번호)</li>
<li>optionContent (option 내용)</li>

### enterList
<li>surveyID (survey 번호 - FK)</li>
<li>enterID (survey 참여하는 사람)</li>
<li>enterdate (survey 참여 시간)</li>

### answerSurvey
<li>surveyID (survey 번호 - FK)</li>
<li>answerUser (응답자)</li>
<li>questionID (문항 번호 - FK)</li>
<li>answerID (답변 ID)</li>
<li>answer (질문 답변) </li>

