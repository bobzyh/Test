package com.st.stmall.pojo;

import java.util.Date;

public class Customer {
	
	private Integer cid;
	private String cname;
	private String password;
	private String cphone;
	private String crealname;
	private String ccard;
	private String caddr;
	private double cmoney;
	private Integer cstatus;
	private Date cregdate;
	private Integer errcount;
	private Date errtime;
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCphone() {
		return cphone;
	}
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	public String getCrealname() {
		return crealname;
	}
	public void setCrealname(String crealname) {
		this.crealname = crealname;
	}
	public String getCcard() {
		return ccard;
	}
	public void setCcard(String ccard) {
		this.ccard = ccard;
	}
	public String getCaddr() {
		return caddr;
	}
	public void setCaddr(String caddr) {
		this.caddr = caddr;
	}
	public double getCmoney() {
		return cmoney;
	}
	public void setCmoney(double cmoney) {
		this.cmoney = cmoney;
	}
	public Integer getCstatus() {
		return cstatus;
	}
	public void setCstatus(Integer cstatus) {
		this.cstatus = cstatus;
	}
	public Date getCregdate() {
		return cregdate;
	}
	public void setCregdate(Date cregdate) {
		this.cregdate = cregdate;
	}
	public Integer getErrcount() {
		return errcount;
	}
	public void setErrcount(Integer errcount) {
		this.errcount = errcount;
	}
	public Date getErrtime() {
		return errtime;
	}
	public void setErrtime(Date errtime) {
		this.errtime = errtime;
	}
}
