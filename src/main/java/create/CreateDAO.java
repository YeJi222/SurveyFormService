package create;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

import common.JDBConnect;

public class CreateDAO {
	// To load surveyID
	public int loadSurveyID(String adminID) {
		String SQL = "SELECT MAX(surveyID) FROM adminList WHERE adminID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, adminID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				CreateDTO dto = new CreateDTO();
				dto.setSurveyID(rs.getString(1));
				System.out.print("max surveyID : ");
				System.out.println(rs.getInt(1));
				
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
	
	// To load surveyID
	public int getMaxOptionID(int surveyID, int questionID) {
		String SQL = "SELECT MAX(optionID) FROM adminSurvey WHERE surveyID = ? AND questionID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			pstmt.setInt(2, questionID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				CreateDTO dto = new CreateDTO();
				dto.setSurveyID(rs.getString(1));
				System.out.print("max optionID : ");
				System.out.println(rs.getInt(1));
				
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
	
	public int getMaxQuestionID(int surveyID) {
		String SQL = "SELECT MAX(questionID) FROM adminSurvey WHERE surveyID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				CreateDTO dto = new CreateDTO();
				dto.setSurveyID(rs.getString(1));
				System.out.print("max optionID : ");
				System.out.println(rs.getInt(1));
				
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
	
	// adminList Table 
	public int insertAdminList(int surveyID, String adminID) {
		String SQL = "INSERT INTO adminList VALUES (?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String regidate = dateFormat.format(date);
		
		System.out.print("SurveyID to insert : ");
		System.out.print(surveyID);
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			pstmt.setString(2, adminID);
			pstmt.setString(3, "제목 없음"); // formName
			pstmt.setString(4, "내용 없음"); // formDetail
			pstmt.setString(5, regidate);
			
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
	
	// delete survey 
	public int deleteAdminList(String surveyID, String adminID) {
		String SQL = "DELETE FROM adminList WHERE adminID = ? AND surveyID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		System.out.print("SurveyID to delete : ");
		System.out.println(surveyID);
		System.out.print("adminID to delete : ");
		System.out.println(adminID);
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, adminID);
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

	public int updateAdminList(String inputName, String inputData, String adminID, int surveyID) {
		String SQL = "UPDATE adminList SET " + inputName + " = ? WHERE adminID = ? AND surveyID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, inputData);
			pstmt.setString(2, adminID);
			pstmt.setInt(3, surveyID);
			
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
	
	public int updateAdminSurvey(int surveyID, int questionID, String inputData) {
		String SQL = "UPDATE adminSurvey SET questionContent = ? WHERE surveyID = ? AND questionID = ?";
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
	
	public int updateQuestionList_content(int surveyID, int questionID, String inputData) {
		String SQL = "UPDATE questionList SET questionContent = ? WHERE surveyID = ? AND questionID = ?";
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
	
	public int updateTextType(int surveyID, int questionID, String type, int optionID, String optionContent) {
		String SQL = "UPDATE adminSurvey SET type = ?, optionContent = ? WHERE surveyID = ? AND questionID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, type);
			pstmt.setString(2, optionContent);
			pstmt.setInt(3, surveyID);
			pstmt.setInt(4, questionID);
			
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
	
	public int updateTextType_questionList(int surveyID, int questionID, String type) {
		String SQL = "UPDATE questionList SET type = ? WHERE surveyID = ? AND questionID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, type);
			pstmt.setInt(2, surveyID);
			pstmt.setInt(3, questionID);
			
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
	
	public int updateRadioType(int surveyID, int questionID, String type) {
		String SQL = "UPDATE adminSurvey SET type = ? WHERE surveyID = ? AND questionID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, type);
			pstmt.setInt(2, surveyID);
			pstmt.setInt(3, questionID);
			
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
	
	public int updateRadioType_questionList(int surveyID, int questionID, String type) {
		String SQL = "UPDATE questionList SET type = ? WHERE surveyID = ? AND questionID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, type);
			pstmt.setInt(2, surveyID);
			pstmt.setInt(3, questionID);
			
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
	
	public int updateOptionContent(int surveyID, int questionID, int optionID, String inputData) {
		String SQL = "UPDATE adminSurvey SET optionContent = ? WHERE surveyID = ? AND questionID = ? AND optionID = ?";
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
	
	public int insertQuestionList(int surveyID, int questionID) {
		String SQL = "INSERT INTO questionList VALUES (?, ?, ?, ?)";
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
			pstmt.setInt(2, questionID);
			pstmt.setString(3, "");
			pstmt.setString(4, "");
			
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
	
	public int insertAdminSurvey(int surveyID, String adminID, int questionID) {
		String SQL = "INSERT INTO adminSurvey VALUES (?, ?, ?, ?, ?, ?, ?)";
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
			pstmt.setString(4, "");
			pstmt.setString(5, "");
			pstmt.setInt(6, 0);
			pstmt.setString(7, "");
			
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
	
	public int insertOptionType(int surveyID, String adminID, int questionID, String type, int optionID) {
		String SQL = "INSERT INTO adminSurvey VALUES (?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			pstmt.setString(2, adminID);
			pstmt.setInt(3, questionID);
			pstmt.setString(4, "");
			pstmt.setString(5, type);
			pstmt.setInt(6, optionID);
			pstmt.setString(7, "");
			
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
	
	// insert 해주는 함수 
	public int insert(CreateDTO survey) { 
		String SQL = "INSERT INTO create_form VALUES (?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String regidate = dateFormat.format(date);

		System.out.print("Text Content: ");
		System.out.println(survey.getTextContent());
		System.out.print("regidate: ");
		System.out.println(regidate);
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			// pstmt.setInt(1, survey.getId());
			pstmt.setString(1, survey.getUserID());
			pstmt.setString(2, survey.getFormName());
			pstmt.setString(3, survey.getType());
			pstmt.setString(4, survey.getQuestionName());
			pstmt.setString(5, survey.getTextContent());
			pstmt.setString(6, survey.getRadioOption());
			pstmt.setString(7, regidate);
			
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
	
	public ArrayList<CreateDTO> getFormInfoDTO(String userID) {
		System.out.println(userID);
		ArrayList<CreateDTO> dtoList = new ArrayList<CreateDTO>();
		String SQL = "SELECT surveyID, formName, regidate FROM adminList WHERE adminID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, userID);
			rs = stmt.executeQuery();
			
			// System.out.print("Form Name : ");
			
			while(rs.next()) {
				
				CreateDTO dto = new CreateDTO();
				dto.setSurveyID(rs.getString("surveyID"));
				dto.setFormName(rs.getString("formName"));
				dto.setRegidate(rs.getDate("regidate"));
				
//				System.out.print("From DB : ");
//				System.out.println(rs.getString("formName"));
//				System.out.print("From DTO : ");
//				System.out.println(dto.getFormName());
				dtoList.add(dto);
				
//				System.out.print("Form Name : ");
//				System.out.println(dtoList.get(0).getFormName());
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
	
	public ArrayList<CreateDTO> getSurveyInfoDTO(int surveyID) {
		System.out.print("In DAO surveyID : ");
		System.out.println(surveyID);
		ArrayList<CreateDTO> dtoList = new ArrayList<CreateDTO>();
		String SQL = "SELECT surveyID, formName, formDetail FROM adminList WHERE surveyID = ?";
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
				
				CreateDTO dto = new CreateDTO();
				dto.setSurveyID(rs.getString("surveyID"));
				dto.setFormName(rs.getString("formName"));
				dto.setFormDetail(rs.getString("formDetail"));
				
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
	
	public int getQuestionNum(int surveyID) {
		System.out.println(surveyID);
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
				
				CreateDTO dto = new CreateDTO();
				dto.setQuestionNum(rs.getInt("count(questionID)"));
				
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
	
	public String getSelectType(int surveyID, int questionID) {
		System.out.println(surveyID);
		System.out.println(questionID);
		String SQL = "SELECT type FROM adminSurvey WHERE surveyID = ? AND questionID = ?";
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
		
		return "AddOptionRow";
	}
	
	public String getOptionContent(int surveyID, int questionID, int optionID) {
		System.out.println("%%%%%%%%%%% In getOptionContent %%%%%%%%%%%");
		System.out.print("surveyID : ");
		System.out.println(surveyID);
		System.out.print("questionID : ");
		System.out.println(questionID);
		System.out.print("optionID : ");
		System.out.println(optionID);
		
		String SQL = "SELECT optionContent FROM adminSurvey WHERE surveyID = ? AND questionID = ? AND optionID = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, surveyID);
			stmt.setInt(2, questionID);
			stmt.setInt(3, optionID);
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
	
	public String getQuestionContent(int surveyID, int questionID) {
		System.out.println(surveyID);
		String SQL = "SELECT questionContent FROM adminSurvey WHERE surveyID = ? AND questionID = ?";
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
	
	public int deleteQuestionList(int surveyID, int questionID) {
		String SQL = "DELETE FROM questionList WHERE surveyID = ? AND questionID = ?";
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
	
	public int deleteAdminSurvey(int surveyID, int questionID) {
		String SQL = "DELETE FROM adminSurvey WHERE surveyID = ? AND questionID = ?";
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
	
	public int deleteAdminSurvey_option(int surveyID, int questionID, int optionID) {
		System.out.print("Survey ID : ");
		System.out.println(surveyID);
		System.out.print("questionID : ");
		System.out.println(questionID);
		System.out.print("optionID : ");
		System.out.println(optionID);
		
		String SQL = "DELETE FROM adminSurvey WHERE surveyID = ? AND questionID = ? AND optionID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, surveyID);
			pstmt.setInt(2, questionID);
			pstmt.setInt(3, optionID);
			
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
	
	/*
	// 특정 회원의 이메일 자체를 반환해주는 함수 
	public String getUserEmail(String userID) {
		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JDBConnect jdbc = new JDBConnect();
		
		try {
			conn = jdbc.con;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 존재하는 사용자의 ID인 경우 
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
		
		return null; // database 오류 
	}
	*/
	
	/*
	// 사용자의 이메일이 현재 인증이 되었는지 확인해주는 함수 
	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 존재하는 사용자의 ID인 경우 
				return rs.getBoolean(1);
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
		
		return false; // database 오류 
	}
	
	// 사용자의 이메일 인증을 수행해주는 함수 
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			
			return true;
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
		
		return false; // database 오류 
	}
	*/
}

