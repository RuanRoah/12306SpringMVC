package com.my12306.service.user;

import com.my12306.po.user.User;

public interface LoginService {
	public String getLoginResult(User user);
	public User getUser(User user);
	public void addUser(User user);
	public String checkUser(User user);
	public String updateUser(User user);
}
