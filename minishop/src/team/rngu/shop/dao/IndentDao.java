package team.rngu.shop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import team.rngu.shop.bean.Buyer;
import team.rngu.shop.bean.Goods;
import team.rngu.shop.bean.Indent;
import team.rngu.shop.entity.Page;
import team.rngu.shop.util.DBUtil;

public class IndentDao {

	public boolean addIndent(Indent indent){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "insert into indent values(default,?,?,?,?,now(),NULL,default)";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, indent.getBuyInfo());
			stmt.setInt(2, indent.getGoodsNum());
			stmt.setInt(3, indent.getGoodsId());
			stmt.setDouble(4, indent.getTotalPrice());
			
			int row = stmt.executeUpdate();
			if( row>0 ){
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public double queryOnePriceById(int id){
		double result = 0.0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select g_price from goods where g_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if( rs.next() ){
				result = rs.getDouble("g_price");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public List<HashMap<String, Object>> getIndentListById(int id){
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		Map<String, Object> map = null;
		Indent indent = null;
		Goods goods = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select i_id, i_totalprice,i_createtime,i_isout,g_introduce,g_imgs"
				+ " from indent left join goods on i_goods_id = g_id "
				+ " where i_buyer_info = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs =  stmt.executeQuery();
			
			while( rs.next() ){
				map = new HashMap<String, Object>();
				indent = new Indent();
				goods = new Goods();
				
				indent.setId(rs.getInt("i_id"));
				indent.setTotalPrice(rs.getDouble("i_totalprice"));
				indent.setCreateTime(rs.getDate("i_createtime"));
				indent.setIsout(rs.getInt("i_isout"));
				goods.setIntroduce(rs.getString("g_introduce"));
				goods.setImgs(rs.getString("g_imgs"));
				
				map.put("indent", indent);
				map.put("goods", goods);
				
				list.add((HashMap<String, Object>) map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<HashMap<String, Object>> getIndentList(int type, Page page){
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		Map<String, Object> map = null;
		Indent indent = null;
		Goods goods = null;
		Buyer buyer = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select i_id,i_goodsnum,i_createtime,g_name,b_name"
				+ " from indent left join goods on i_goods_id = g_id "
				+ " left join buyer on i_buyer_info = b_id where i_isout = ?"
				+ " limit ?,?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, type);
			stmt.setInt(2, page.getPageBegin());
			stmt.setInt(3, page.getPageSize());
			rs =  stmt.executeQuery();
			
			while( rs.next() ){
				map = new HashMap<String, Object>();
				indent = new Indent();
				goods = new Goods();
				buyer = new Buyer();
				
				indent.setId(rs.getInt("i_id"));
				indent.setGoodsNum(rs.getInt("i_goodsnum"));
				indent.setCreateTime(rs.getDate("i_createtime"));
				goods.setName(rs.getString("g_name"));
				buyer.setName(rs.getString("b_name"));
				map.put("indent", indent);
				map.put("goods", goods);
				map.put("buyer", buyer);
				
				list.add((HashMap<String, Object>) map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Map<String, Object> getIndentById(int id){
		Map<String, Object> map = new HashMap<String, Object>();
		Indent indent = new Indent();
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select b_name, g_name, i_goodsnum, i_totalprice,i_createtime "+
					" from buyer left join indent on b_id = i_buyer_info "+
					" left join goods on i_goods_id = g_id where i_id = ?;";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if( rs.next() ){
				String bname = rs.getString("b_name");
				String gname = rs.getString("g_name");
				indent.setId(id);
				indent.setGoodsNum(rs.getInt("i_goodsnum"));
				indent.setTotalPrice(rs.getDouble("i_totalprice"));
				indent.setCreateTime(rs.getDate("i_createtime"));
				
				map.put("indent", indent);
				map.put("bname", bname);
				map.put("gname", gname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	public void updateIndent(Indent indent, String bname, String gname){
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "update indent set i_goodsnum = ?, i_totalprice = ? "
				+ " where i_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, indent.getGoodsNum());
			stmt.setDouble(2, indent.getTotalPrice());
			stmt.setInt(4, indent.getId());
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean deleteOne(int id){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "delete from indent where i_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			int row = stmt.executeUpdate();
			if( row > 0 )result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void updateIndentState(int id){
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "update indent set i_isout = 1 where i_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
