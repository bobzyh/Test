package com.st.stmall.pojo;

public class Details {
	private Integer did;
	private String onum;
	private Integer gid;
	private Integer gcount;
	private Double gprice;
	
	private Goods goods;
	
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public String getOnum() {
		return onum;
	}
	public void setOnum(String onum) {
		this.onum = onum;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public Integer getGcount() {
		return gcount;
	}
	public void setGcount(Integer gcount) {
		this.gcount = gcount;
	}
	public Double getGprice() {
		return gprice;
	}
	public void setGprice(Double gprice) {
		this.gprice = gprice;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}
