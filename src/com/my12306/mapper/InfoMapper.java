package com.my12306.mapper;

import com.my12306.po.user.User;
import com.my12306.po.user.UserInfo;

public interface InfoMapper {
	public UserInfo query(User user);
	public UserInfo queryinfo(String userinfo);
	public void insertuserinfo(UserInfo userinfo);
	public void updateinfo(UserInfo userinfo);
	public void updatenew(UserInfo userinfo);
}
