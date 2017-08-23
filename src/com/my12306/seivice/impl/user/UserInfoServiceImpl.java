package com.my12306.seivice.impl.user;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.my12306.mapper.InfoMapper;
import com.my12306.mapper.UserPeopleMapper;
import com.my12306.po.user.User;
import com.my12306.po.user.UserInfo;
import com.my12306.po.user.UserPeople;
import com.my12306.service.user.UserInfoService;
import com.my12306.util.GetUUID;
import com.my12306.util.MybatisUtil;

public class UserInfoServiceImpl implements UserInfoService{
	static SqlSessionFactory ssf = null;
    static {
        ssf = MybatisUtil.getSqlsessionfactory();
    }
	@Override
	public void check(UserInfo userinfo) {
		// TODO Auto-generated method stub
		SqlSession ss=ssf.openSession();
		InfoMapper ld=(InfoMapper)ss.getMapper(InfoMapper.class);
		User user=new User();
		user.setUserid(userinfo.getUserid());
		UserInfo ui =ld.query(user);
		if(ui==null){
			ld.insertuserinfo(userinfo);
		}else{
			ld.updateinfo(userinfo);
		}
		ss.commit();
	}
	@Override
	public UserInfo search(String userinfo) {
		// TODO Auto-generated method stub
		SqlSession ss=ssf.openSession();
		InfoMapper ld=(InfoMapper)ss.getMapper(InfoMapper.class);
		
		UserInfo user=ld.queryinfo(userinfo);
		ss.commit();
		return user;
	}
	@Override
	public void update(UserInfo userinfo) {
		System.out.println(userinfo.toString());
		// TODO Auto-generated method stub
		SqlSession ss=ssf.openSession();
		InfoMapper ld=(InfoMapper)ss.getMapper(InfoMapper.class);
		ld.updateinfo(userinfo);
		ss.commit();
	}
	@Override
	public void insertnew(UserInfo userinfo) {
		// TODO Auto-generated method stub
		SqlSession ss=ssf.openSession();
		UserPeopleMapper um=(UserPeopleMapper)ss.getMapper(UserPeopleMapper.class);
		UserPeople up=new UserPeople(userinfo.getUserid(), userinfo.getName(), userinfo.getId(), userinfo.getTel(), GetUUID.getuuid());
		um.insertpeople(up);
		System.out.println("test");
		ss.commit();
	}
	@Override
	public void updatenew(UserInfo userinfo) {
		// TODO Auto-generated method stub
		System.out.println("输出："+userinfo.toString());
		SqlSession ss=ssf.openSession();
		InfoMapper ld=(InfoMapper)ss.getMapper(InfoMapper.class);
		ld.updatenew(userinfo);
		System.out.println("demo1");
		ss.commit();
	}
}