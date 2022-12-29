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
	public ArrayList<QuestionDTO> loadQuestionInfo(int surveyID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT questionID, questionContent, type FROM questionList WHERE surveyID = ?";
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
	
	public ArrayList<QuestionDTO> getOptionID(int surveyID, int questionID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT optionID FROM adminSurvey WHERE surveyID = ? AND questionID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setInt(2, questionID);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setOptionID(rs.getInt(1));
				
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
	
	public ArrayList<QuestionDTO> optionIDCount(int surveyID, int questionID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT count(optionID) FROM adminSurvey WHERE surveyID = ? AND questionID = ?";
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
				dto.setOptionIDcount(rs.getInt(1));
				
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
	
	public int questionCount(int surveyID) {
		String SQL = "SELECT count(questionID) FROM questionList WHERE surveyID = ?";
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
				
				return rs.getInt(1);
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
		
		return -1; // error 
	}
	
	public int getOptionIDCount(int surveyID, int questionID) {
		String SQL = "SELECT count(optionID) FROM adminSurvey WHERE surveyID = ? AND questionID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setInt(2, questionID);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				return rs.getInt(1);
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
		
		return -1; // error 
	}
	
	public ArrayList<QuestionDTO> getQuestionID(int surveyID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT questionID FROM questionList WHERE surveyID = ?";
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
				dto.setOptionIDcount(rs.getInt(1));
				
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
		
		return dtoList;
	}
	
	// answerSurvey Table
	public int getAnswerCount(int surveyID) {
		String SQL = "SELECT count(DISTINCT answerUser) FROM answerSurvey WHERE surveyID = ?";
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
				
				return rs.getInt(1);
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
		
		return -1; // error 
	}
}

