package com.my12306.po.user;

public class UserTotal {
	private String userid;
	private String username;
	private String passwd;
	private String sex;
	private String tel;
	private String name;
	private String id;
	private int age;
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public UserTotal() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "UserTotal [userid=" + userid + ", username=" + username + ", passwd=" + passwd + ", sex=" + sex
				+ ", tel=" + tel + ", name=" + name + ", id=" + id + "]"+ ", age=" + age + "]";
	}
	public UserTotal(String userid, String username, String passwd, String sex, String tel, String name,String id,int age) {
		super();
		this.userid = userid;
		this.username = username;
		this.passwd = passwd;
		this.sex = sex;
		this.tel = tel;
		this.name = name;
		this.id = id;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
