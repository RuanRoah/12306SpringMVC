package com.my12306.seivice.impl.mapreduce;
import java.sql.SQLException;
import java.util.ArrayList;
import com.my12306.service.mapreduce.TrainCountService;
import com.my12306.vo.mapreduce.TrainCount;
import com.my12306.dao.hive.*;
public class TrainCountServiceImpl implements TrainCountService{
	@Override
	public ArrayList<TrainCount> getTrainCount() throws SQLException {
		HiveTestSql test=new HiveTestSql();
		ArrayList<TrainCount> res=new ArrayList<TrainCount>();
		res = test.getcountofsex();
		return res;
	}	
}