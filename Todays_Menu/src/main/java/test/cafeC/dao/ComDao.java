package test.cafeC.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import test.cafeC.dto.ComDto;
import test.util.DbcpBean;

public class ComDao {

	private static ComDao dao;
		
		private ComDao() {}
		
		public static ComDao getInstance() {
			if(dao==null) {
				dao=new ComDao();
			}
			return dao;
		}

		public boolean delete(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 sql 문
				String sql = "DELETE FROM cafe_comment"
						+ " WHERE num=?";
				pstmt = conn.prepareStatement(sql);
				//? 에 값 바인딩하기
				pstmt.setInt(1, num);
				flag = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			if (flag > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		//글 하나의 정보를 리턴하는 메소드
		public ComDto getData(int num) {
			
			ComDto dto=null;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				//select 문의 뼈대 구성하기
				String sql = "SELECT board_comment_content, member_id, reg_date"
						+ " FROM cafe_comment"
						+ " WHERE board_num=?"
						+ " ORDER BY comment_num";
				pstmt = conn.prepareStatement(sql);
				//? 에 값 바인딩 할게 있으면 하기
				pstmt.setInt(1, num);
				//sql 문 수행하고 ResultSet 객체 얻어내기
				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto=new ComDto();
					dto.setContent(rs.getString("content"));
					dto.setId(rs.getString("member_id"));
					dto.setRegdate(rs.getString("reg_date"));
					dto.setBoardnum(num);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			return dto;
		}
		
		//글 하나의 정보를 저장하는 메소드 
		public boolean insert(ComDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 sql 문
				String sql = "INSERT INTO cafe_comment"
							+ " (board_no, board_comment_content, member_id, reg_date, comment_num)"
							+ " VALUES(?, ?, ?, SYSDATE, cafe_comment_seq.NEXTVAL)";
							
				pstmt = conn.prepareStatement(sql);
				//? 에 값 바인딩하기
				pstmt.setInt(1, dto.getBoardnum());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getId());
				flag = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			if (flag > 0) {
				return true;
			} else {
				return false;
			}
		}
		
}
