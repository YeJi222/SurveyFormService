package create;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

import common.JDBConnect;

public class EnterDAO {
	public ArrayList<EnterDTO> getEnterFormDTO(String userID) {
		System.out.println(userID);
		ArrayList<EnterDTO> dtoList = new ArrayList<EnterDTO>();
		
		String SQL = "SELECT surveyID, formName, enterdate FROM enterList WHERE enterID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, userID);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				EnterDTO dto = new EnterDTO();
				dto.setSurveyID(rs.getInt("surveyID"));
				dto.setFormName(rs.getString("formName"));
				dto.setEnterdate(rs.getDate("enterdate"));
				
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
	
	public String getFormName(int surveyID) {
		String SQL = "SELECT formName FROM enterList WHERE surveyID = ?";
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
	
	public String getAnswerValue(int surveyID, String answerUser, int answerID) {
		String SQL = "SELECT answer FROM answerSurvey WHERE surveyID = ? AND answerUser = ? AND answerID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setString(2, answerUser);
			stmt.setInt(3, answerID);
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
	
	public int insertAdminList(int surveyID, String enterID, String formName) {
		String SQL = "INSERT INTO enterList VALUES (?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String regidate = dateFormat.format(date);
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			pstmt.setString(2, enterID);
			pstmt.setString(3, formName); // formName
			pstmt.setString(4, regidate);
			
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
	
	public int findDuplicateSurvey(int surveyID, String enterID) {
		System.out.println("============ findDuplicateSurvey ============");
		System.out.print("surveyID : ");
		System.out.println(surveyID);
		System.out.print("enterID : ");
		System.out.println(enterID);
		
		String SQL = "SELECT count(*) FROM enterList WHERE surveyID = ? AND enterID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setString(2, enterID);
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
		
		return -1;
	}
	
	public int insertAnswer(int surveyID, String answerUser, String type, int answerID, String answer) {
		String SQL = "INSERT INTO answerSurvey VALUES (?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			pstmt.setString(2, answerUser);
			pstmt.setString(3, type); // formName
			pstmt.setInt(4, answerID);
			pstmt.setString(5, answer);
			
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
	
	public int existAnswer(int surveyID, String answerUser, int answerID) {
		System.out.println("============ findDuplicateSurvey ============");
		System.out.print("surveyID : ");
		System.out.println(surveyID);
		System.out.print("answerUser : ");
		System.out.println(answerUser);
		System.out.print("answerID : ");
		System.out.println(answerID);
		
		String SQL = "SELECT count(*) FROM answerSurvey WHERE surveyID = ? AND answerUser = ? AND answerID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setString(2, answerUser);
			stmt.setInt(3, answerID);
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
		
		return -1;
	}
	
	public int updateAnswer(int surveyID, String answerUser, int answerID, String answer) {
		String SQL = "UPDATE answerSurvey SET answer = ? WHERE surveyID = ? AND answerUser = ? AND answerID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, answer);
			pstmt.setInt(2, surveyID);
			pstmt.setString(3, answerUser);
			pstmt.setInt(4, answerID);
			
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
	
	public int checkDuplicateAnswer(int surveyID, String answerUser) {
		System.out.println("============ findDuplicateAnswer ============");
		System.out.print("surveyID : ");
		System.out.println(surveyID);
		System.out.print("answerUser : ");
		System.out.println(answerUser);
		
		String SQL = "SELECT count(*) FROM answerSurvey WHERE surveyID = ? AND answerUser = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setString(2, answerUser);
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
		
		return -1;
	}
	
	// delete survey 
	public int deleteEnterList(String surveyID, String enterID) {
		String SQL = "DELETE FROM enterList WHERE enterID = ? AND surveyID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
//		System.out.print("SurveyID to delete : ");
//		System.out.println(surveyID);
//		System.out.print("enterID to delete : ");
//		System.out.println(enterID);
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, enterID);
			pstmt.setString(2, surveyID);
			
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

