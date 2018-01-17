package team.rngu.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import team.rngu.shop.bean.Buyer;
import team.rngu.shop.bean.GoodsClass;
import team.rngu.shop.dao.BuyerDao;
import team.rngu.shop.dao.CommonDao;
import team.rngu.shop.dao.IndentDao;
import team.rngu.shop.entity.Page;
import team.rngu.shop.util.MD5Util;

public class BuyerService {

	public boolean login(Buyer buyer){
		boolean result = false;
		BuyerDao buyerDao = new BuyerDao();
		buyer.setPassword(MD5Util.getMD5(buyer.getPassword()));
		if( buyerDao.query(buyer) ){
			result = true;
		}
		
		return result;
	}
	
	public boolean register(Buyer buyer){
		boolean result = false;
		BuyerDao buyerDao = new BuyerDao();
		buyer.setPassword(MD5Util.getMD5(buyer.getPassword()));
		
		if( buyerDao.save(buyer) ){
			result = true;
		}
		
		return result;
	}
	
	public Buyer searchBuyerInfo(int id){
		BuyerDao buyerDao = new BuyerDao();
		Buyer buyer = buyerDao.queryInfo(id);
		buyer.setId(id);
		return buyer;
	}
	
	public boolean queryPassword(Buyer buyer){
		boolean result = false;
		BuyerDao buyerDao = new BuyerDao();
		buyer.setPassword(MD5Util.getMD5(buyer.getPassword()));
		if( buyerDao.queryPassword(buyer) ){
			result = true;
		}
		return result;
	}
	
	public boolean changePassword(Buyer buyer){
		boolean result = false;
		BuyerDao buyerDao = new BuyerDao();
		buyer.setPassword(MD5Util.getMD5(buyer.getPassword()));
		if( buyerDao.updatePassword(buyer) ){
			result = true;
		}
		return result;
	}
	
	public Map<String, Object> getUserList(String pnum){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Buyer> list = null;
		Page page = new Page();
		BuyerDao buyerDao = new BuyerDao();
		CommonDao commonDao = new CommonDao();
		
		int p = Integer.parseInt(pnum);
		page.setPageNum(p);
		page.setTotalRow(commonDao.queryRows("buyer"));
		page.initData();
		
		list = buyerDao.getBuyerList(page);
		
		map.put("list", list);
		map.put("page", page);
		
		return map;
	}
	
	public List<GoodsClass> getHomeInfo(){
		List<GoodsClass> list = null;		
		BuyerDao buyerDao = new BuyerDao();
		list = buyerDao.getGoodsClassList();
		
		return list;
	}
	
	public boolean changeInfo(Buyer buyer){
		boolean result = false;
		BuyerDao buyerDao = new BuyerDao();
		
		if( buyerDao.updateInfo(buyer) ){
			result = true;
		}
		
		return result;
	}
	
	public JSONObject delBuyer(String sour){
		JSONObject ret = new JSONObject();
		JSONObject data = JSONObject.fromObject(sour);
		BuyerDao buyerDao = new BuyerDao();
		int id = Integer.parseInt(data.getString("id"));
		
		if( buyerDao.deleteOne(id) ){
			ret.put("state", "success");
		}else{
			ret.put("state", "fail");
		}
		
		return ret;
	}
}
