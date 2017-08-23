package com.my12306.controller.map;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my12306.seivice.impl.mapreduce.TrainCountServiceImpl;
import com.my12306.service.mapreduce.TrainCountService;
import com.my12306.vo.mapreduce.TrainCount;

import net.sf.json.JSONArray;

@Controller
public class MapController {
	TrainCountService ts=new TrainCountServiceImpl();
	@RequestMapping(value="settongji.do")
	@ResponseBody
	public String totongji() throws SQLException{
		ArrayList<TrainCount> tc=new ArrayList<TrainCount>();
		tc=ts.getTrainCount();
		
		JSONArray jsonArray = JSONArray.fromObject(tc);
		return jsonArray.toString();
	}
	/*@RequestMapping(value="")
	public String totongji_1(){
		return "null";
	}
	@RequestMapping(value="")
	public String totongji_2(){
		return "null";
	}*/
}
