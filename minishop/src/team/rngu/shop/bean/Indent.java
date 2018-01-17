package team.rngu.shop.bean;

import java.util.Date;

public class Indent {

	private int id;
	private int buyInfo;
	private int goodsNum;
	private int goodsId;
	private double totalPrice;
	private Date createTime;
	private Date payTime;
	private Date outTime;
	private int isout;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBuyInfo() {
		return buyInfo;
	}
	public void setBuyInfo(int buyInfo) {
		this.buyInfo = buyInfo;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	public Date getOutTime() {
		return outTime;
	}
	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}
	public int getIsout() {
		return isout;
	}
	public void setIsout(int isout) {
		this.isout = isout;
	}
}
