package team.rngu.shop.service;

import java.util.HashMap;
import java.util.Map;

import team.rngu.shop.bean.Seller;
import team.rngu.shop.dao.SellerDao;
import team.rngu.shop.util.MD5Util;

public class SellerService {

	public boolean login(Seller seller){
		boolean result = false;
		SellerDao sellerDao = new SellerDao();
		seller.setPassword(MD5Util.getMD5(seller.getPassword()));
		if( sellerDao.query(seller) ){
			result = true;
		}
		
		return result;
	}
	
	public Map<String, String> getHomePageInfo(){
		Map<String, String> map = new HashMap<String, String>();
		SellerDao sellerDao = new SellerDao();
		map.put("buyers", Integer.toString(sellerDao.queryBuyerNum()));
		map.put("income", Double.toString(sellerDao.queryIncome()));
		map.put("goods", Integer.toString(sellerDao.queryGoodsNum()));
		map.put("totalincome", Double.toString(sellerDao.queryTotalIncome()));
		
		return map;
	}
}
