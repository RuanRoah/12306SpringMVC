package com.my12306.mapper;


import com.my12306.po.user.User;

public interface LoginMapper {
	public User getuser(User user);
	public User queryUser(User user);
	public void insertUser(User user);
}