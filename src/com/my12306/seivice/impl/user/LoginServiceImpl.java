package com.my12306.seivice.impl.user;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.jmx.export.annotation.ManagedResource;
import org.springframework.stereotype.Service;
import com.my12306.mapper.LoginMapper;
import com.my12306.mapper.RegeditMapper;
import com.my12306.po.user.User;
import com.my12306.service.user.LoginService;
import com.my12306.util.MybatisUtil;
@SuppressWarnings("unused")
public class LoginServiceImpl implements LoginService{
	static SqlSessionFactory sqlSessionFactory = null;
    static {
        sqlSessionFactory = MybatisUtil.getSqlsessionfactory();
    }	
    @SuppressWarnings("finally")
	public String getLoginResult(User user){
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	LoginMapper ld=(LoginMapper) sqlSession.getMapper(LoginMapper.class);
		int result;
		String get = "";
		User ub=new User();		
            ub=ld.getuser(user);  
            sqlSession.close();
		try{
			if(user.getUsername().equals(ub.getUsername())){
	        	if(user.getPasswd().equals(ub.getPasswd())){
	        		get="success";
	        	}else{
	        		get="密码错误";
	        }
	     }
		}catch(NullPointerException e){
			get="用户不存在";
		}finally{
			return get;
		}
	}
	@Override
	public void addUser(User user) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		RegeditMapper ld=(RegeditMapper) sqlSession.getMapper(RegeditMapper.class);
		ld.insertuser(user);
		sqlSession.commit();
	}
	@Override
	public String checkUser(User user) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = sqlSessionFactory.openSession();
		LoginMapper ld=(LoginMapper) sqlSession.getMapper(LoginMapper.class);
		
		return null;
	}
	@Override
	public String updateUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(User user) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = sqlSessionFactory.openSession();
    	LoginMapper ld=(LoginMapper) sqlSession.getMapper(LoginMapper.class);
		int result;
		String get = "";
		User ub=new User();		
            ub=ld.getuser(user);  
            sqlSession.close();
        return ub;
	}
}