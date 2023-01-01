package create;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.sql.Types;
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
	
	public String getCommonText(int surveyID, String commonType) {
		String SQL = "SELECT resultContent FROM resultContent WHERE surveyID = ? AND optionContent = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setString(2, commonType);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				return rs.getString(1);
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
		
		return null;
	}
	
	public int getResultContent(int surveyID, int questionID) {
		String SQL = "SELECT count(*) FROM resultContent WHERE surveyID = ? AND questionID = ?";
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
	
	public ArrayList<QuestionDTO> getRadioQuestion(int surveyID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT questionID, questionContent FROM adminSurvey WHERE surveyID = ? AND type = ? AND optionID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setString(2, "radioType");
			stmt.setInt(3, 0);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setQuestionID(rs.getInt("questionID"));
				dto.setQuestionContent(rs.getString("questionContent"));
				
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
	
	public ArrayList<QuestionDTO> getQuestionInResult(int surveyID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT questionID, questionContent FROM resultContent WHERE surveyID = ? AND optionID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setInt(2, 0);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setQuestionID(rs.getInt("questionID"));
				dto.setQuestionContent(rs.getString("questionContent"));
				
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
	
	public String geResultContent(int surveyID, String optionContent) {
		String SQL = "SELECT resultContent FROM resultContent WHERE surveyID = ? AND optionContent = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setString(2, optionContent);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				return rs.getString(1);
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
		
		return null; // DTO 객체 반환 
	}
	
	public ArrayList<QuestionDTO> getRadioOption(int surveyID, int questionID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT optionID, optionContent FROM adminSurvey WHERE surveyID = ? AND questionID = ?";
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
	
	public ArrayList<QuestionDTO> getRadioQuestion(int surveyID, int questionID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT optionID, optionContent FROM adminSurvey WHERE surveyID = ? AND questionID = ?";
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
	
	public ArrayList<QuestionDTO> getRadioResult(int surveyID, int questionID) {
		ArrayList<QuestionDTO> dtoList = new ArrayList<QuestionDTO>();
		
		String SQL = "SELECT optionID, optionContent, resultContent FROM resultContent WHERE surveyID = ? AND questionID = ?";
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
				dto.setOptionID(rs.getInt("optionID"));
				dto.setOptionContent(rs.getString("optionContent"));
				dto.setResultContent(rs.getString("resultContent"));
				
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
	
	public int insertCommonResult(int surveyID, String adminID, String commonType, String resultContent) {
		String SQL = "INSERT INTO resultContent VALUES (?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			pstmt.setString(2, adminID);
			pstmt.setNull(3, Types.INTEGER);
			pstmt.setString(4, null);
			pstmt.setNull(5, Types.INTEGER);
			pstmt.setString(6, commonType);
			pstmt.setString(7, resultContent);
			
			return pstmt.executeUpdate(); // 업데이트된 개수가 반환 값 
		} catch(Exception e){
			e.printStackTrace();
		} finally { // 자원 해제
			try {
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(rs != null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return -1; // insert 실패 
	}
	
	public int insertResultContent(int surveyID, String adminID, int questionID, String questionContent, int optionID, String optionContent) {
		String SQL = "INSERT INTO resultContent VALUES (?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		System.out.print("SurveyID to insert : ");
		System.out.print(surveyID);
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			pstmt.setString(2, adminID);
			pstmt.setInt(3, questionID);
			pstmt.setString(4, questionContent);
			pstmt.setInt(5, optionID);
			pstmt.setString(6, optionContent);
			pstmt.setString(7, null);
			
			return pstmt.executeUpdate(); // 업데이트된 개수가 반환 값 
		} catch(Exception e){
			e.printStackTrace();
		} finally { // 자원 해제
			try {
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(rs != null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return -1; // insert 실패 
	}
	
	public int updateResultCommonText(int surveyID, String commonType, String inputData) {
		String SQL = "UPDATE resultContent SET resultContent = ? WHERE surveyID = ? AND optionContent = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		System.out.print("inputData : ");
		System.out.println(inputData);
		System.out.print("commonType : ");
		System.out.println(commonType);
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, inputData);
			pstmt.setInt(2, surveyID);
			pstmt.setString(3, commonType);
			
			return pstmt.executeUpdate(); // 업데이트된 개수가 반환 값 
		} catch(Exception e){
			e.printStackTrace();
		} finally { // 자원 해제
			try {
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(rs != null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return -1; // insert 실패 
	}
	
	public int updateResultContent(int surveyID, int questionID, int optionID, String inputData) {
		String SQL = "UPDATE resultContent SET resultContent = ? WHERE surveyID = ? AND questionID = ? AND optionID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, inputData);
			pstmt.setInt(2, surveyID);
			pstmt.setInt(3, questionID);
			pstmt.setInt(4, optionID);
			
			return pstmt.executeUpdate(); // 업데이트된 개수가 반환 값 
		} catch(Exception e){
			e.printStackTrace();
		} finally { // 자원 해제
			try {
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(rs != null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return -1; // insert 실패 
	}
	
	public int deleteResultContent(int surveyID, int questionID) {
		String SQL = "DELETE FROM resultContent WHERE surveyID = ? AND questionID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			pstmt.setInt(2, questionID);
			
			return pstmt.executeUpdate(); // 업데이트된 개수가 반환 값 
		} catch(Exception e){
			e.printStackTrace();
		} finally { // 자원 해제
			try {
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(rs != null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return -1; // insert 실패 
	}
}

