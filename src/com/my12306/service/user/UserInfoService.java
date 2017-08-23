package com.my12306.service.user;

import com.my12306.po.user.UserInfo;

public interface UserInfoService {
	public void check(UserInfo userinfo);
	public UserInfo search(String userid);
	public void update(UserInfo userinfo);
	public void insertnew(UserInfo userinfo);
	public void updatenew(UserInfo userinfo);
}
