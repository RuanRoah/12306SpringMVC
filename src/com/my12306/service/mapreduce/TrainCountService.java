package com.my12306.service.mapreduce;
import java.sql.SQLException;
import java.util.ArrayList;

import com.my12306.vo.mapreduce.*;

public interface TrainCountService {
	public ArrayList<TrainCount> getTrainCount() throws SQLException;
}