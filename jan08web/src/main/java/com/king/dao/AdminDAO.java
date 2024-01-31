package com.king.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.king.dto.BoardDTO;
import com.king.dto.CommentDTO;
import com.king.dto.MemberDTO;

public class AdminDAO extends AbstractDAO {

	public List<MemberDTO> memberList(int grade) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mno, mid, mname, mdate, mgrade FROM member WHERE mgrade=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, grade);
			rs = pstmt.executeQuery();			
			
			while(rs.next()) {
				MemberDTO e = new MemberDTO();
				e.setMno(rs.getInt("mno"));
				e.setMid(rs.getString("mid"));
				e.setMname(rs.getString("mname"));
				e.setMdate(rs.getString("mdate"));
				e.setMgrade(rs.getInt("mgrade"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		return list;
	}
	
	public List<MemberDTO> memberList() {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mno, mid, mname, mdate, mgrade FROM member";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();			
			
			while(rs.next()) {
				MemberDTO e = new MemberDTO();
				e.setMno(rs.getInt("mno"));
				e.setMid(rs.getString("mid"));
				e.setMname(rs.getString("mname"));
				e.setMdate(rs.getString("mdate"));
				e.setMgrade(rs.getInt("mgrade"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		return list;
	}

	public int gradeUpdate(int grade, int mno) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET mgrade=? WHERE mno=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, grade);
			pstmt.setInt(2, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null,pstmt,con);
		}
		return result;
	}

	public List<BoardDTO> boardList() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT board_no, board_title, m.mname, board_date,"
				+ "(SELECT board_count FROM boardview bv WHERE bv.board_no = b.board_no) AS count, (SELECT count(*) FROM comment c WHERE c.board_no=b.board_no) AS comment, "
				+ "board_ip, board_del FROM board b JOIN member m ON b.mno=m.mno";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setNo(rs.getInt("board_no"));
				e.setTitle(rs.getString("board_title"));
				e.setWrite(rs.getString("mname"));
				e.setDate(rs.getString("board_date"));
				e.setCount(rs.getInt("count"));
				e.setComment(rs.getInt("comment"));
				e.setIp(rs.getString("board_ip"));
				e.setDel(rs.getInt("board_del"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		
		return list;
	}

	public List<BoardDTO> boardList(String parameter) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT board_no, board_title, m.mname, board_date,(SELECT board_count FROM boardview bv WHERE bv.board_no = b.board_no) AS count,"
				+ " (SELECT count(*) FROM comment c WHERE c.board_no=b.board_no) AS comment, board_ip, board_del "
				+ "FROM board b JOIN member m ON b.mno=m.mno WHERE board_title LIKE CONCAT('%', ?, '%') "
				+ "OR board_content LIKE CONCAT('%', ?, '%') OR m.mname LIKE CONCAT('%', ?, '%')";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, parameter);
			pstmt.setString(2, parameter);
			pstmt.setString(3, parameter);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setNo(rs.getInt("board_no"));
				e.setTitle(rs.getString("board_title"));
				e.setWrite(rs.getString("mname"));
				e.setDate(rs.getString("board_date"));
				e.setCount(rs.getInt("count"));
				e.setComment(rs.getInt("comment"));
				e.setIp(rs.getString("board_ip"));
				e.setDel(rs.getInt("board_del"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		
		return list;
	}

	public int boardDel(BoardDTO dto) {
		int result = 0;
		
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE board SET board_del=? WHERE board_no=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getDel()+"");
			pstmt.setInt(2, dto.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null,pstmt,con);
		}
		

		return result;
	}

	public List<CommentDTO> commentList() {
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select c.cno, c.board_no, SUBSTRING(REPLACE(c.ccomment, '<br>', ' '),1, 15) as ccomment, "
				+ "if(date_format(c.cdate,'%Y-%m-%d') = date_format(current_timestamp(),'%Y-%m-%d'), "
				+ "date_format(c.cdate,'%h:%i'),date_format(c.cdate,'%Y-%m-%d')) AS cdate, "
				+ "c.clike, m.mno, m.mid, m.mname, c.cip , c.cdel "
				+ "from (comment c join member m on(c.mno = m.mno)) "
				+ "order by c.cno desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO e = new CommentDTO();
				e.setCno(rs.getInt("cno"));
				e.setBoard_no(rs.getInt("board_no"));
				e.setComment(rs.getString("ccomment"));
				e.setCdate(rs.getString("cdate"));
				e.setClike(rs.getInt("clike"));
				e.setMno(rs.getInt("mno"));
				e.setMname(rs.getString("mname"));
				e.setMid(rs.getString("mid"));
				e.setCip(rs.getString("cip"));
				e.setDel(rs.getInt("cdel"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		
		return list;
	}

	public List<Map<String, Object>> ipList() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ipno,iip,idate,iurl,idata FROM iplog GROUP BY iip ORDER BY ipno DESC";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("ipno", rs.getInt("ipno"));
				e.put("iip", rs.getString("iip"));
				e.put("idate", rs.getString("idate"));
				e.put("iurl", rs.getString("iurl"));
				e.put("idata", rs.getString("idata"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		
		return list;
		
	}

	public List<Map<String, Object>> ipAccessList5() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT iip, COUNT(*) AS count FROM iplog GROUP BY iip ORDER BY COUNT(*) DESC LIMIT 0, 5";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("iip", rs.getString("iip"));
				e.put("count", rs.getInt("count"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		
		return list;
		
	}

	public List<Map<String, Object>> ipAccessList10() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT iip, COUNT(*) AS count FROM iplog ORDER BY idate DESC LIMIT 0, 10";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("iip", rs.getString("iip"));
				e.put("count", rs.getInt("count"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		
		return list;
	}

	public List<Map<String, Object>> ipList(String ip) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ipno,iip,idate,iurl,idata FROM iplog WHERE iip=? ORDER BY ipno DESC";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ip);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("ipno", rs.getInt("ipno"));
				e.put("iip", rs.getString("iip"));
				e.put("idate", rs.getString("idate"));
				e.put("iurl", rs.getString("iurl"));
				e.put("idata", rs.getString("idata"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		
		return list;
	}
	
}
