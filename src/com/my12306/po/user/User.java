package com.my12306.po.user;

public class User {
	public String username;
	public String passwd;
	public String userid;
	public User(String username, String passwd, String userid) {
		super();
		this.username = username;
		this.passwd = passwd;
		this.userid = userid;
	}
	public User(){
		super();
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", passwd=" + passwd + ", userid=" + userid + "]";
	}
	
}
