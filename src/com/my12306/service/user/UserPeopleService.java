package com.my12306.service.user;
import java.util.ArrayList;

import com.my12306.po.user.User;
import com.my12306.po.user.UserPeople;;
public interface UserPeopleService {
	public void insertpeople(UserPeople u);
	public void deletepeople(String id);
	public void updatepeople(UserPeople u);
	public ArrayList<UserPeople> querypeople(UserPeople u);
	public UserPeople search(UserPeople u);
	
}
