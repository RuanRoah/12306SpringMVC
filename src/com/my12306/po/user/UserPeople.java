package com.my12306.po.user;

public class UserPeople {
	private String userid;
	private String al_name;
	private String al_id;
	private String al_tel;
	private String id;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAl_name() {
		return al_name;
	}
	public void setAl_name(String al_name) {
		this.al_name = al_name;
	}
	public String getAl_id() {
		return al_id;
	}
	public void setAl_id(String al_id) {
		this.al_id = al_id;
	}
	public String getAl_tel() {
		return al_tel;
	}
	public void setAl_tel(String al_tel) {
		this.al_tel = al_tel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "UserPeople [userid=" + userid + ", al_name=" + al_name + ", al_id=" + al_id + ", al_tel=" + al_tel
				+ ", id=" + id + "]";
	}
	public UserPeople(String userid, String al_name, String al_id, String al_tel, String id) {
		super();
		this.userid = userid;
		this.al_name = al_name;
		this.al_id = al_id;
		this.al_tel = al_tel;
		this.id = id;
	}
	public UserPeople() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
