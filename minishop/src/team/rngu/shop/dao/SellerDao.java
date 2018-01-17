package team.rngu.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import team.rngu.shop.bean.Seller;
import team.rngu.shop.util.DBUtil;

public class SellerDao {

	public boolean query(Seller seller){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from seller where (s_name=? or s_phone=?) and s_password = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seller.getName());
			stmt.setString(2, seller.getPhone());
			stmt.setString(3, seller.getPassword());
			
			rs = stmt.executeQuery();
			if( rs.next() ){
				if( rs.getInt("count(*)") > 0 ) result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int queryBuyerNum(){
		int result = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select count(b_id) from buyer";
		try {
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if( rs.next() ){
				result = rs.getInt("count(b_id)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public double queryIncome(){
		double result = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select sum(i_totalprice) from indent where datediff(i_createtime,CURDATE())=0;";
		try {
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if( rs.next() ){
				result = rs.getDouble("sum(i_totalprice)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int queryGoodsNum(){
		int result = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select count(g_id) from goods";
		try {
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if( rs.next() ){
				result = rs.getInt("count(g_id)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public double queryTotalIncome(){
		double result = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select sum(i_totalprice) from indent";
		try {
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if( rs.next() ){
				result = rs.getDouble("sum(i_totalprice)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean addSeller(Seller seller){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "insert into seller values(default,?,?,?)";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seller.getName());
			stmt.setString(2, seller.getPhone());
			stmt.setString(3, seller.getPassword());
			
			int row = stmt.executeUpdate();
			if( row > 0 ) result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
