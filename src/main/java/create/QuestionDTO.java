package create;

import java.util.Date;

public class QuestionDTO {
	private int surveyID;
	private String adminID;
	private int questionID;
	private String questionContent;
	private String type;
	private int optionID;
	private String optionContent;
	private int optionIDcount;
	private String resultContent;

	public int getSurveyID() {
		return surveyID;
	}

	public void setSurveyID(int surveyID) {
		this.surveyID = surveyID;
	}

	public String getAdminID() {
		return adminID;
	}

	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}

	public int getQuestionID() {
		return questionID;
	}

	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getOptionID() {
		return optionID;
	}

	public void setOptionID(int optionID) {
		this.optionID = optionID;
	}

	public String getOptionContent() {
		return optionContent;
	}

	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}
	
	public int getOptionIDcount() {
		return optionIDcount;
	}

	public void setOptionIDcount(int optionIDcount) {
		this.optionIDcount = optionIDcount;
	}
	
	public String getResultContent() {
		return resultContent;
	}

	public void setResultContent(String resultContent) {
		this.resultContent = resultContent;
	}

	public QuestionDTO() {
	}
	
	public QuestionDTO(int surveyID, String adminID, int questionID, String questionContent, String type, int optionID, String optionContent, String resultContent) {
		super();
		this.surveyID = surveyID;
		this.adminID = adminID;
		this.questionID = questionID;
		this.questionContent = questionContent;
		this.type = type;
		this.optionID = optionID;
		this.optionContent = optionContent;
		this.resultContent = resultContent;
	}
}
