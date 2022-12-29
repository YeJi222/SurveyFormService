package create;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

import common.JDBConnect;

public class AnswerDAO {
	public ArrayList<AnswerDTO> getTextAnswer(int surveyID, int answerID) {
		ArrayList<AnswerDTO> dtoList = new ArrayList<AnswerDTO>();
		
		String SQL = "SELECT answerUser, answer FROM answerSurvey WHERE surveyID = ? AND answerID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setInt(2, answerID);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				AnswerDTO dto = new AnswerDTO();
				dto.setAnswer(rs.getString("answer"));
				dto.setAnswerUser(rs.getString("answerUser"));
				
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
	
	public int getRadioAnswer(int surveyID, int answerID, String type, String answer) {
//		System.out.print("surveyID: ");
//		System.out.println(surveyID);
//		System.out.print("answerID: ");
//		System.out.println(answerID);
//		System.out.print("type: ");
//		System.out.println(type);
//		System.out.print("answer: ");
//		System.out.println(answer);
		
		String SQL = "SELECT count(*) FROM answerSurvey WHERE surveyID = ? AND answerID = ? AND type = ? AND answer = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setInt(2, answerID);
			stmt.setString(3, type);
			stmt.setString(4, answer);
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
		
		return -1; // insert 실패 
	}
	
	public ArrayList<AnswerDTO> getCheckboxAnswer(int surveyID, int answerID, String type) {
		ArrayList<AnswerDTO> dtoList = new ArrayList<AnswerDTO>();
		
		String SQL = "SELECT answer FROM answerSurvey WHERE surveyID = ? AND answerID = ? AND type = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setInt(2, answerID);
			stmt.setString(3, type);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				AnswerDTO dto = new AnswerDTO();
				dto.setAnswer(rs.getString("answer"));
				
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
	
	/*
	public String getCheckboxAnswer(int surveyID, int answerID, String type) {
//		System.out.print("surveyID: ");
//		System.out.println(surveyID);
//		System.out.print("answerID: ");
//		System.out.println(answerID);
//		System.out.print("type: ");
//		System.out.println(type);
		
		String SQL = "SELECT answer FROM answerSurvey WHERE surveyID = ? AND answerID = ? AND type = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setInt(2, answerID);
			stmt.setString(3, type);
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
	*/
}

