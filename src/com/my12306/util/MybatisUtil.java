package com.my12306.util;
import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class MybatisUtil {
	@SuppressWarnings("unused")
	private final static SqlSessionFactory sqlsessionFactory;
	
	static{
		String resource="mybatis-config.xml" ;	
		Reader reader=null;
		try {
			reader=Resources.getResourceAsReader(resource);
			//��д�ļ�
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlsessionFactory=new SqlSessionFactoryBuilder().build(reader);
	}

	public static SqlSessionFactory getSqlsessionfactory() {
		return sqlsessionFactory;
	}
	//ȫ�ִ��뺬���ǽ�Mapping.sql��װ��sqlsessionFactory��
	
}
