package team.rngu.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import team.rngu.shop.bean.Indent;
import team.rngu.shop.dao.CommonDao;
import team.rngu.shop.dao.IndentDao;
import team.rngu.shop.entity.Page;

public class IndentService {

	public JSONObject buyGoods(String data){
		Indent indent = new Indent();
		IndentDao indentDao = new IndentDao();
		JSONObject ret = new JSONObject();
		JSONObject sour = JSONObject.fromObject(data);
		
		indent.setGoodsId(Integer.parseInt(sour.getString("gid")));
		indent.setGoodsNum(Integer.parseInt(sour.getString("gnum")));
		indent.setBuyInfo(Integer.parseInt(sour.getString("bid")));
		double price = indentDao.queryOnePriceById(indent.getGoodsId());
		indent.setTotalPrice(price*indent.getGoodsNum());
		
		if(indentDao.addIndent(indent) ){
			ret.put("state", "success");
		}else{
			ret.put("state", "fail");
		}
		
		return ret;
	}
	
	public List<HashMap<String, Object>> getBuyerIndent(int id){
		List<HashMap<String, Object>> list = null;
		IndentDao indentDao = new IndentDao();
		list = indentDao.getIndentListById(id);
		
		return list;
	}
	
	public List<HashMap<String, Object>> getIndentList(String type, String pnum){
		List<HashMap<String, Object>> list = null;
		CommonDao commonDao = new CommonDao();
		IndentDao indentDao = new IndentDao();
		Page page = new Page();
		int t = Integer.parseInt(type);
		int p = Integer.parseInt(pnum);
		page.setPageNum(p);
		page.setTotalRow(commonDao.queryRows("indent"));
		page.setSearchLimit(type);
		page.initData();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		list = indentDao.getIndentList(t,page);
		list.add((HashMap<String, Object>) map);
		
		return list;
	}
	
	public JSONObject delIndent(String sour){
		JSONObject ret = new JSONObject();
		JSONObject data = JSONObject.fromObject(sour);
		IndentDao indentDao = new IndentDao();
		String iid = data.getString("id");
		int id = Integer.parseInt(data.getString("id"));
		
		if( indentDao.deleteOne(id) ){
			ret.put("state", "success");
		}else{
			ret.put("state", "fail");
		}
		
		return ret;
	}
}
