package team.rngu.shop.util;

import java.util.Date;

public class StrUtil {

	public static String getTimeStr(){
		String ret = null;
		
		try {
			Thread.sleep(1);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		ret = new Date().toString();
		ret = Long.toString(new Date().getTime());
		return ret;
	}
	
}
