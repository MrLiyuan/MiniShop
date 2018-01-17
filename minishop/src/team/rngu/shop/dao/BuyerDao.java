package team.rngu.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import team.rngu.shop.bean.Buyer;
import team.rngu.shop.bean.GoodsClass;
import team.rngu.shop.entity.Page;
import team.rngu.shop.util.DBUtil;

public class BuyerDao {

	public boolean query(Buyer buyer){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select b_id from buyer where (b_name=? or b_phone=? or b_email=?) and b_password = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, buyer.getName());
			stmt.setString(2, buyer.getPhone());
			stmt.setString(3, buyer.getEmail());
			stmt.setString(4, buyer.getPassword());
			
			rs = stmt.executeQuery();
			if( rs.next() ){
				buyer.setId(rs.getInt("b_id"));
				if( buyer.getId()>0 ) result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean save(Buyer buyer){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "insert into buyer values(default,default,?,?,?,?,NULL,NULL,NULL);";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, buyer.getName()==null?null:buyer.getName());
			stmt.setString(2, buyer.getPhone()==null?null:buyer.getPhone());
			stmt.setString(3, buyer.getEmail()==null?null:buyer.getEmail());
			stmt.setString(4, buyer.getPassword()==null?null:buyer.getPassword());
			
			int row = stmt.executeUpdate();
			if( row > 0 ){
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public Buyer queryInfo(int id){
		Buyer buyer = new Buyer();
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select b_name, b_sex, b_phone, b_email, b_icon from buyer where b_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			while( rs.next() ){
				buyer.setName(rs.getString("b_name"));
				buyer.setSex(rs.getInt("b_sex"));
				buyer.setPhone(rs.getString("b_phone"));
				buyer.setEmail(rs.getString("b_email"));
				buyer.setIcon(rs.getString("b_icon"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyer;
	}
	
	public boolean queryPassword(Buyer buyer){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from buyer where b_id = ? and b_password = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, buyer.getId());
			stmt.setString(2, buyer.getPassword());
			
			rs = stmt.executeQuery();
			
			if( rs.next() ){
				if( rs.getInt("count(*)") > 0 ) result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean updatePassword(Buyer buyer){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "update buyer set b_password = ? where b_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, buyer.getPassword());
			stmt.setInt(2, buyer.getId());
			int row = stmt.executeUpdate();
			if( row > 0 )result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Buyer> getBuyerList(Page page){
		List<Buyer> list = new ArrayList<Buyer>();
		Buyer buyer = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select b_id,b_name,b_phone,b_email from buyer limit ?,?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, page.getPageBegin());
			stmt.setInt(2, page.getPageSize());
			rs = stmt.executeQuery();
			while( rs.next() ){
				buyer = new Buyer();
				
				buyer.setId(rs.getInt("b_id"));
				buyer.setName(rs.getString("b_name"));
				buyer.setPhone(rs.getString("b_phone"));
				buyer.setEmail(rs.getString("b_email"));
				
				list.add(buyer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<GoodsClass> getGoodsClassList(){
		List<GoodsClass> list = new ArrayList<GoodsClass>();
		GoodsDao goodsDao = new GoodsDao();
		GoodsClass goodsClass = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from goodsclass";
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while( rs.next() ){
				goodsClass = new GoodsClass();
				
				goodsClass.setId(rs.getInt("id"));
				goodsClass.setName(rs.getString("name"));
				goodsClass.setImg(rs.getString("img"));
				goodsClass.setPro(rs.getString("pro"));
				goodsClass.setList(goodsDao.getGoodsByClass(goodsClass.getName()));
				
				list.add(goodsClass);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean updateInfo(Buyer buyer){
		boolean ret = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "update buyer set b_name=?, b_sex=?, b_phone=?, b_email=? "
				+ " where b_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, buyer.getName());
			stmt.setInt(2, buyer.getSex());
			stmt.setString(3, buyer.getPhone());
			stmt.setString(4, buyer.getEmail());
			stmt.setInt(5, buyer.getId());
			
			int row = stmt.executeUpdate();
			if( row > 0 ) ret = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return ret;
	}
	
	public Buyer getBuyerById(int id){
		Buyer buyer = new Buyer();
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from buyer where b_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if( rs.next() ){
				buyer.setId(id);
				buyer.setName(rs.getString("b_name"));
				buyer.setPhone(rs.getString("b_phone"));
				buyer.setEmail(rs.getString("b_email"));
				buyer.setPassword(rs.getString("b_password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return buyer;
	}
	
	public void update(Buyer buyer){
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "update buyer set b_name = ?, b_phone = ?, b_email, b_password = ?"
				+ " where b_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, buyer.getName());
			stmt.setString(2, buyer.getPhone());
			stmt.setString(3, buyer.getEmail());
			stmt.setString(4, buyer.getPassword());
			stmt.setInt(5, buyer.getId());
			stmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean deleteOne(int id){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "delete from buyer where b_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			int row = stmt.executeUpdate();
			if( row > 0 ) result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
