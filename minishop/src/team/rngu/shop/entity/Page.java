package team.rngu.shop.entity;

import java.util.List;

public class Page<T> {

	private int pageNum = 1;
	private int pageSize = 8;
	private int pageBegin = 0;
	private int totalRow = 0;
	private int totalPage = 0;
	private List<T> pageList;
	
	private String searchLimit;
	
	public Page() {
	}
	
	public void initData(){
		totalPage = totalRow / pageSize;
		if( totalRow % pageSize!=0 ){
			totalPage++;
		}
		
		if( pageNum < 1 ) pageNum = 1;
		if( pageNum > totalPage ) pageNum = totalPage;
		
		pageBegin = ( pageNum-1 ) * pageSize;
		if( pageBegin < 0 )pageBegin = 0;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getPageList() {
		return pageList;
	}

	public void setPageList(List<T> pageList) {
		this.pageList = pageList;
	}

	public String getSearchLimit() {
		return searchLimit;
	}

	public void setSearchLimit(String searchLimit) {
		this.searchLimit = searchLimit;
	}
}
