package create;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

import common.JDBConnect;

public class QuestionDAO {
	public ArrayList<QuestionDTO> loadQuestion(int surveyID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT questionID, questionContent, type, optionID, optionContent FROM adminSurvey WHERE surveyID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setQuestionID(rs.getInt("questionID"));
				dto.setQuestionContent(rs.getString("questionContent"));
				dto.setType(rs.getString("type"));
				dto.setOptionID(rs.getInt("optionID"));
				dto.setOptionContent(rs.getString("optionContent"));
				
				dtoList.add(dto);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally { // 자원 해제
			try {
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(stmt != null) stmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(rs != null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtoList; // DTO 객체 반환 
	}
}

