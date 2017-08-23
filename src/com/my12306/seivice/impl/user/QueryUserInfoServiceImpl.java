package com.my12306.seivice.impl.user;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.my12306.mapper.InfoMapper;
import com.my12306.mapper.LoginMapper;
import com.my12306.po.user.User;
import com.my12306.po.user.UserInfo;
import com.my12306.service.user.QueryUserInfoService;
import com.my12306.util.MybatisUtil;

public class QueryUserInfoServiceImpl implements QueryUserInfoService {
	static SqlSessionFactory ssf = null;
    static {
        ssf = MybatisUtil.getSqlsessionfactory();
    }
	
	@SuppressWarnings("finally")
	@Override
	public String query(User user) {
		SqlSession ss=ssf.openSession();
		String res="";
		InfoMapper ld=(InfoMapper) ss.getMapper(InfoMapper.class);		
		
		UserInfo ui=ld.query(user);
		if(ui==null)
			return "null";
		else
			return "sure";
		
		// TODO Auto-generated method stub
		
	}

}
