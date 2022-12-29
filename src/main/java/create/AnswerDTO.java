package create;

import java.util.Date;

public class AnswerDTO {
	private String answerUser;
	private String answer;
	private int answerCount;

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public String getAnswerUser() {
		return answerUser;
	}

	public void setAnswerUser(String answerUser) {
		this.answerUser = answerUser;
	}
	
	public int getAnswerCount() {
		return answerCount;
	}

	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}

	public AnswerDTO() {
	}
	
	public AnswerDTO(String answerUser, String answer, int answerCount) {
		super();
		this.answerUser = answerUser;
		this.answer = answer;
		this.answerCount = answerCount;
	}

	
}
