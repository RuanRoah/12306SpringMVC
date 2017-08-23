package com.my12306.mapper;
import java.util.ArrayList;

import com.my12306.po.user.UserPeople;
public interface UserPeopleMapper {
	public ArrayList<UserPeople> querypeople(UserPeople up);
	public void insertpeople(UserPeople up);
	public void deletepeople(String upp);
	public void updatepeople(UserPeople up);
	public UserPeople search(UserPeople up);
}