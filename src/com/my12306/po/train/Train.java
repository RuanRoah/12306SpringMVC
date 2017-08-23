package com.my12306.po.train;

import java.util.List;

import com.my12306.po.ticket.PathInfo;

public class Train {

	public String TRA_NUM;
	public String TYPE;
	public String START_DATE;
	public int SEAT_NUM;
	public String PATH;
	public List<PathInfo> pathInfos;
		
}
