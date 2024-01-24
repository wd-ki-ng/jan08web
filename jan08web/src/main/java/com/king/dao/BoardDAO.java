package com.king.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.king.db.DBConnection;
import com.king.dto.BoardDTO;
import com.king.dto.CommentDTO;

public class BoardDAO extends AbstractDAO {

	public List<BoardDTO> boardList(int page) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		// db정보
		// DBConnection db = DBConnection.getInstance();
		// conn 객체
		Connection con = DBConnection.getInstance().getConnection();
		// pstmt
		PreparedStatement pstmt = null;
		// rs
		ResultSet rs = null;
		// sql
		String sql = "SELECT * FROM boardview LIMIT ?,10";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (page - 1) * 10); // 페이징은 1부터 시작하니 -1을 해줘야함.
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setNo(rs.getInt(1));
				e.setTitle(rs.getString("board_title"));
				e.setWrite(rs.getString(3));
				e.setDate(rs.getString(4));
				e.setCount(rs.getInt("board_count"));
				e.setComment(rs.getInt("comment"));
				list.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return list;
	}

	public BoardDTO detail(int no) {
		BoardDTO dto = new BoardDTO();
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT b.board_no, b.board_title,"
				+ "b.board_content, m.mname AS board_write, m.mid, b.board_date, b.board_ip,"
				+ "(SELECT COUNT(*) FROM visitcount WHERE board_no = b.board_no) AS board_count "
				+ "FROM board AS b JOIN member AS m ON b.mno=m.mno " + "WHERE b.board_no=?";
		// countUp(no);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setNo(rs.getInt("board_no"));
				dto.setTitle(rs.getString("board_title"));
				dto.setContent(rs.getString("board_content"));
				dto.setWrite(rs.getString("board_write"));
				dto.setDate(rs.getString("board_date"));
				dto.setCount(rs.getInt("board_count"));
				dto.setMid(rs.getString("mid"));
				dto.setIp(rs.getString("board_ip"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return dto;
	}

	public void countUp(int no, String mid) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM visitcount WHERE board_no=? AND"
				+ " mno=(SELECT mno FROM member WHERE mid=?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int result = rs.getInt(1);
				if (result == 0)
					realCount(no, mid);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
	}

	private void realCount(int no, String mid) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO visitcount(board_no,mno) " + "VALUES(?,(SELECT mno FROM member WHERE mid=?))";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, mid);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
	}

	public int write(BoardDTO dto) {
		int result = 0;

		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO board (board_title, board_content, mno,board_ip) "
				+ "VALUES(?,?,(SELECT mno FROM member WHERE mid=?),?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getMid());
			pstmt.setString(4, dto.getIp());
			
			result = pstmt.executeUpdate();// 영향받은 행을 result에 저장합니다.
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;
	}

	public int delete(BoardDTO dto) {
		int result = 0;
		Connection conn = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE board SET board_del='0' WHERE board_no=? AND mno=(SELECT mno FROM member WHERE mid=?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}

		return result;
	}

	public int edit(BoardDTO dto) {
		int result = 0;
		Connection conn = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE FROM board SET board_title = ?, board_content= ? WHERE board_no=? AND mno=(SELECT mno FROM member WHERE mid=?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNo());
			pstmt.setString(4, dto.getMid());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(null, pstmt, conn);
		}

		return result;
	}

	public int totalCount() {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM boardview";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return result;
	}

	public List<CommentDTO> commentList(int no) {
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM commentview WHERE board_no=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setCno(rs.getInt("cno"));
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setMno(rs.getInt("mno"));
				dto.setComment(rs.getString("ccomment"));
				dto.setCdate(rs.getString("cdate"));//뷰를 추가하여 manme,mid를 가져오기
				dto.setClike(rs.getInt("clike"));
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		return list;
	}
}