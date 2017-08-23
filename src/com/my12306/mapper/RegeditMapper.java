package com.my12306.mapper;

import com.my12306.po.user.User;
import com.my12306.po.user.UserInfo;

public interface RegeditMapper {
	public void insertuser(User user);
	public void insertuserinfo(UserInfo userinfo);
}
