package team.rngu.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import team.rngu.shop.util.DBUtil;

public class CommonDao {

	public int queryRows(String table){
		int rows = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//有sql注入的风险， 正则判断
		String sql = "select count(*) from "+table;
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if( rs.next() ){
				rows = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rows;
	}
	
	public int queryRowsByLimit(String table, String where){
		int rows = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from "+table+" where "+ where;
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if( rs.next() ){
				rows = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rows;
	}
	
}
