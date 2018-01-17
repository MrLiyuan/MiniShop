package team.rngu.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import team.rngu.shop.bean.Goods;
import team.rngu.shop.bean.GoodsClass;
import team.rngu.shop.entity.Page;
import team.rngu.shop.util.DBUtil;

public class GoodsDao {

	public Page<Goods> queryGoods(String search, Page<Goods> page){
		Connection conn = DBUtil.getConnection();
		List<Goods> tmpList = new ArrayList<Goods>();
		Goods goods = null;
		String sql = "select * from goods where g_name like ? or g_introduce like ? limit ?,?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, search);
			stmt.setString(2, search);
			stmt.setInt(3, page.getPageBegin());
			stmt.setInt(4, page.getPageSize());
			rs = stmt.executeQuery();
			while( rs.next() ){
				goods = new Goods();
				
				goods.setId(rs.getInt("g_id"));
				goods.setName(rs.getString("g_name"));
				goods.setPrice(rs.getDouble("g_price"));
				goods.setIntroduce(rs.getString("g_introduce"));
				goods.setSurplus(rs.getInt("g_surplus"));
				goods.setSales(rs.getInt("g_sales"));
				goods.setAddress(rs.getString("g_address"));
				goods.setClas(rs.getString("g_clas"));
				goods.setImgs(rs.getString("g_imgs"));
				goods.setExplain(rs.getString("g_explain"));
				goods.setState(rs.getInt("g_state"));
				
				tmpList.add(goods);
			}
			page.setPageList(tmpList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
	
	public Goods queryOneGoods(int id){
		Goods goods = new Goods();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from goods where g_id = ?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if( rs.next() ){
				goods.setId(rs.getInt("g_id"));
				goods.setName(rs.getString("g_name"));
				goods.setPrice(rs.getDouble("g_price"));
				goods.setIntroduce(rs.getString("g_introduce"));
				goods.setSurplus(rs.getInt("g_surplus"));
				goods.setSales(rs.getInt("g_sales"));
				goods.setAddress(rs.getString("g_address"));
				goods.setClas(rs.getString("g_clas"));
				goods.setImgs(rs.getString("g_imgs"));
				goods.setExplain(rs.getString("g_explain"));
				goods.setState(rs.getInt("g_state"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return goods;
	}
	
	public List<Goods> getGoodsList(Page page){
		List<Goods> list = new ArrayList<Goods>();
		Goods goods = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select g_id,g_name,g_introduce,g_clas,g_surplus,g_state from goods limit ?,?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, page.getPageBegin());
			stmt.setInt(2, page.getPageSize());
			rs = stmt.executeQuery();
			while( rs.next() ){
				goods = new Goods();
				
				goods.setId(rs.getInt("g_id"));
				goods.setName(rs.getString("g_name"));
				goods.setIntroduce(rs.getString("g_introduce"));
				goods.setClas(rs.getString("g_clas"));
				goods.setSurplus(rs.getInt("g_surplus"));
				goods.setState(rs.getInt("g_state"));
				
				list.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Goods> getGoodsByClass(String like){
		List<Goods> list = new ArrayList<Goods>();
		Goods goods = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select g_id,g_name,g_price,g_imgs from goods where g_clas like ? limit 0,8";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+like+"%");
			rs = stmt.executeQuery();
			
			while( rs.next() ){
				goods = new Goods();
				
				goods.setId(rs.getInt("g_id"));
				goods.setName(rs.getString("g_name"));
				goods.setPrice(rs.getDouble("g_price"));
				goods.setImgs(rs.getString("g_imgs"));
				
				list.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean deleteGoods(int id){
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		String sql = "delete from goods where g_id = ?";
		
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
	
	public List<GoodsClass> getClassList(){
		List<GoodsClass> list = new ArrayList<GoodsClass>();
		GoodsClass clas = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from goodsclass";
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while( rs.next() ){
				clas = new GoodsClass();
				
				clas.setId(rs.getInt("id"));
				clas.setName(rs.getString("name"));
				clas.setPro(rs.getString("pro"));
				
				list.add(clas);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
