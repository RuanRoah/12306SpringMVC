package com.my12306.seivice.impl.user;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.my12306.mapper.UserPeopleMapper;
import com.my12306.po.user.UserPeople;
import com.my12306.service.user.UserPeopleService;
import com.my12306.util.MybatisUtil;

public class UserPeopleServiceImpl implements UserPeopleService{
	static SqlSessionFactory ssf = null;
    static {
        ssf = MybatisUtil.getSqlsessionfactory();
    }
	@Override
	public ArrayList<UserPeople> querypeople(UserPeople u) {
		// TODO Auto-generated method stub
		SqlSession ss=ssf.openSession();
		UserPeopleMapper ud=(UserPeopleMapper)ss.getMapper(UserPeopleMapper.class);
		ArrayList<UserPeople> up=ud.querypeople(u);	
		
		return up;
	}

	@Override
	public void insertpeople(UserPeople u) {
		// TODO Auto-generated method stub
		SqlSession ss=ssf.openSession();
		UserPeopleMapper ld=(UserPeopleMapper)ss.getMapper(UserPeopleMapper.class);
		ld.insertpeople(u);
		ss.commit();
		ss.close();	
	}
	public void deletepeople(String upp) {
		// TODO Auto-generated method stub
		SqlSession ss=ssf.openSession();
		UserPeopleMapper up=(UserPeopleMapper)ss.getMapper(UserPeopleMapper.class);
		up.deletepeople(upp);
		ss.commit();
		ss.close();
	}

	@Override
	public UserPeople search(UserPeople u) {
		SqlSession ss=ssf.openSession();
		UserPeopleMapper ud=(UserPeopleMapper)ss.getMapper(UserPeopleMapper.class);
		UserPeople up=ud.search(u);	
		return up;
	}
	

	@Override
	public void updatepeople(UserPeople u) {
		SqlSession ss=ssf.openSession();
		System.out.println("update");
		UserPeopleMapper ud=(UserPeopleMapper)ss.getMapper(UserPeopleMapper.class);
		ud.updatepeople(u);
		ss.commit();
	}

}
