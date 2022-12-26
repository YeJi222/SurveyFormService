package create;

import java.util.Date;

public class EnterDTO {
	private int surveyID;
	private String enterID = null;
	private String formName = null;
	private Date enterdate;

	public int getSurveyID() {
		return surveyID;
	}

	public void setSurveyID(int surveyID) {
		this.surveyID = surveyID;
	}

	public String getEnterID() {
		return enterID;
	}

	public void setEnterID(String enterID) {
		this.enterID = enterID;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public Date getEnterdate() {
		return enterdate;
	}

	public void setEnterdate(Date enterdate) {
		this.enterdate = enterdate;
	}
	
	public EnterDTO() {
	}
	
	public EnterDTO(int surveyID, String enterID, String formName, Date enterdate) {
		super();
		this.surveyID = surveyID;
		this.enterID = enterID;
		this.formName = formName;
		this.enterdate = enterdate;
	}
}
