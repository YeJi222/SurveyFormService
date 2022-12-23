package create;

import java.util.Date;

public class CreateDTO {
	private String surveyID;
	private String userID = null;
	private String formName = null;
	private String formDetail = null;
	private String questionName = null;
	private String textContent = null;
	private String type = null;
	private String radioOption = null;
	private Date regidate;
	
	private int questionNum = 0; // question 개수 
	public int getQuestionNum() {
		return questionNum;
	}
	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}
	
	public String getSurveyID() {
		return surveyID;
	}
	public void setSurveyID(String surveyID) {
		this.surveyID = surveyID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getFormDetail() {
		return formDetail;
	}
	public void setFormDetail(String formDetail) {
		this.formDetail = formDetail;
	}
	public String getQuestionName() {
		return questionName;
	}
	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}
	public String getTextContent() {
		return textContent;
	}
	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRadioOption() {
		return radioOption;
	}
	public void setRadioOption(String radioOption) {
		this.radioOption = radioOption;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	
	public CreateDTO() {
	}
	
	public CreateDTO(String userID, String formName, String formDetail, String questionName, String textContent, String type, String radioOption, Date regidate) {
		super();
		this.userID = userID;
		this.formName = formName;
		this.formDetail = formDetail;
		this.questionName = questionName;
		this.textContent = textContent;
		this.type = type;
		this.radioOption = radioOption;
		this.regidate = regidate;
	}
}
