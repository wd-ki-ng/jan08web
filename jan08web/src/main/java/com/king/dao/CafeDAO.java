package com.king.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.king.dto.CafeDTO;

public class CafeDAO extends AbstractDAO {

	public int cafehotice(CafeDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE cafemember SET(coffee_name=?, hot_ice=?, number=1) WHERE name=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCoffee_Name());
			pstmt.setInt(2, dto.getCoffee());
			pstmt.setString(3, dto.getName());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null,pstmt,con);
		}		
		return result;
	}
		
}
