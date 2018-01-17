package team.rngu.shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import team.rngu.shop.bean.Goods;
import team.rngu.shop.bean.GoodsClass;
import team.rngu.shop.dao.CommonDao;
import team.rngu.shop.dao.GoodsDao;
import team.rngu.shop.entity.Page;

public class GoodsService {

	public Page<Goods> showGoodsList(String search, int pnum){
		Page<Goods> page = new Page<Goods>();
		CommonDao commonDao = new CommonDao();
		GoodsDao goodsDao = new GoodsDao();
		StringBuffer sb = new StringBuffer();
		sb.append("%");
		sb.append(search);
		sb.append("%");
		String where = "g_name like '"+sb.toString()+"' or g_introduce like '"+sb.toString()+"'";
		page.setPageNum(pnum);
		page.setTotalRow(commonDao.queryRowsByLimit("goods", where));
		page.setSearchLimit(search);
		page.initData();
		page = goodsDao.queryGoods(sb.toString(),page);
		
		return page;
	}
	
	public Goods showGoods(int id){
		Goods rs = new Goods();
		GoodsDao goodsDao = new GoodsDao();
		rs = goodsDao.queryOneGoods(id);
		return rs;
	}
	
	public Map<String, Object> getGoodsList(String pnum){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Goods> list = null;
		Page page = new Page();
		GoodsDao goodsDao = new GoodsDao();
		CommonDao commonDao = new CommonDao();
		
		int p = Integer.parseInt(pnum);
		page.setPageNum(p);
		page.setTotalRow(commonDao.queryRows("goods"));
		page.initData();
		list = goodsDao.getGoodsList(page);
		
		map.put("list", list);
		map.put("page", page);
		
		return map;
	}
	
	public JSONObject delGoods(String sour){
		JSONObject ret = new JSONObject();
		JSONObject data = JSONObject.fromObject(sour);
		GoodsDao goodsDao = new GoodsDao();
		String iid = data.getString("id");
		int id = Integer.parseInt(data.getString("id"));
		
		if( goodsDao.deleteGoods(id) ){
			ret.put("state", "success");
		}else{
			ret.put("state", "fail");
		}
		
		return ret;
	}
	
	public List<GoodsClass> getGoodsClassList(){
		List<GoodsClass> list = null;
		GoodsDao goodsDao = new GoodsDao();
		list = goodsDao.getClassList();
		
		
		return list;
	}
}
