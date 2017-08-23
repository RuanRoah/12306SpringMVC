package com.my12306.po.user;

public class UserInfo {
	private String userid;
	private String tel;
	private String name;
	private String sex;
	private String id;
	private int age;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public UserInfo(String userid, String tel, String name, String sex, String id, int age) {
		super();
		this.userid = userid;
		this.tel = tel;
		this.name = name;
		this.id = id;
		this.sex = sex;
		this.age = age;
	}
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "UserInfo [userid=" + userid + ", tel=" + tel + ", name=" + name + ", sex=" + sex + ", id=" + id
				+ ", age=" + age + "]";
	}
	
	
	
}
