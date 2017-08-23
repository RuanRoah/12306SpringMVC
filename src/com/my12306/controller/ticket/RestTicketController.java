package com.my12306.controller.ticket;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.core.appender.rolling.SizeBasedTriggeringPolicy;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.apache.tools.ant.util.SymbolicLinkUtils;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mchange.v2.encounter.StrongEqualityEncounterCounter;
import com.my12306.po.ticket.Seat;
import com.my12306.po.train.TrainInfo;
import com.my12306.po.train.Trains;
import com.my12306.po.user.User;
import com.my12306.po.user.UserPeople;
import com.my12306.seivice.impl.ticket.TicketServiceImpl;
import com.my12306.seivice.impl.user.UserPeopleServiceImpl;
import com.my12306.service.ticket.TicketService;
import com.my12306.service.user.UserPeopleService;
import com.my12306.vo.TicketShow;

import net.sf.json.JSONArray;



@Controller
public class RestTicketController {
	@RequestMapping("newticket.do")
	@ResponseBody
	public String queryTicket(@RequestParam("start") String start, @RequestParam("end") String end,
			@RequestParam("dates") String date,HttpServletRequest request,@RequestParam("people") String people,HttpSession session) {
		// start 出发点 end 终点 date 日期
		System.out.println(start+end+date);
		TicketService ticketService = new TicketServiceImpl();
		// 最终展现的vo
		ArrayList<TicketShow> ticketShows = new ArrayList<TicketShow>();	
		//1  首先根据时间查询出此日期所有的火车名 装入train_info中
		List<TrainInfo> trainInfos=ticketService.queryTrainInfo(date);
		System.out.println("traininfos大小"+trainInfos.size());
	
		//2  前端输入的起点 终点在ROAD中的火车集合
		List<Trains> queryTrains=new ArrayList<Trains>();
		
		// 再根据其train_id获得另一个表中的火车详细信息,并判断出发到达是否在其road中
		for (int i = 0; i < trainInfos.size(); i++) {
			System.out.println(trainInfos.get(i).TRAINID);
			Trains trains=ticketService.queryTrains(trainInfos.get(i).TRAINID);
			System.out.println(trains.ROAD);
			
			//出发和目的地下标
			Integer startsec=null;
		    Integer endsec=null;
			
			String[] sections=trains.ROAD.split("/");
			String[] cometime=trains.COME_TIME.split("/");
			for (int j = 0; j < sections.length; j++) {
				if(start.equals(sections[j])){
					startsec=j;
				}
				if(end.equals(sections[j])){
					endsec=j;
				}	
			}
			
			if (startsec==null||endsec==null) {
				System.out.println("该车次不行");
			}else if(startsec<endsec){
				System.out.println("该车次可以"+trains.TRAINID);
				System.out.println("startsec"+startsec+"endsec"+endsec);
				
				//判断出ROAD合适的火车 将城市下标放入当前对象 trains中
				trains.startsec=startsec;
				trains.endsec=endsec;
				trains.startTime=cometime[startsec];
				trains.endTime=cometime[endsec];
				
				//算钱
				double calmoney=0;
				String[] moneys=trains.MONEY.split("/");
				for (int monsec = startsec; monsec < endsec; monsec++) {
					calmoney=calmoney+Double.parseDouble((moneys[monsec]));
				}

				trains.calmoney=calmoney*trains.RATIO;

				queryTrains.add(trains);
			}	
		}
		
		System.out.println("now queryTRAINS"+queryTrains.size());
		
		//找该车空位 并将相关信息放入VO ticketshow中
		for (int i = 0; i < queryTrains.size(); i++) {
				TicketShow ticketShow=new TicketShow();
				
				ticketShow.train_name=queryTrains.get(i).TRAINID;
				ticketShow.startTime=queryTrains.get(i).startTime;
				ticketShow.endTime=queryTrains.get(i).endTime;
				ticketShow.start=start;
				ticketShow.end=end;
				ticketShow.startsec=queryTrains.get(i).startsec;
				ticketShow.endsec=queryTrains.get(i).endsec;
				ticketShow.money=queryTrains.get(i).calmoney;
				ticketShow.date=date;
				List<Seat> queryseats=ticketService.querySeats(queryTrains.get(i).TRAINID,"二等座");
				System.out.println(queryseats.size());
				//用于存储空座id的string list
				List<String> seatID=new ArrayList<String>();
				
				//tickets
				int tickets=0;
				for (int k = 0; k < queryseats.size(); k++) {
					//将每个座位的路段拆分 拆分后放入字符串数组 进行空位判断
					String[] sections=queryseats.get(k).PATH.split("/");
					
					//用于判断的值
					int judge=0;
					
					for (int stasec=ticketShow.startsec; stasec < ticketShow.endsec; stasec++) {
			
						if (sections[stasec].equals("0")) {
							judge=judge+1;	
						}
						else{
							break;
						}
					}
					if (judge==(ticketShow.endsec-ticketShow.startsec)) {
						tickets=tickets+1;
						System.out.println("这个座位可以"+queryseats.get(k).SEAT_NUM);
						String seat_id=queryseats.get(k).ID;
						seatID.add(seat_id);
					}					
				}				
				ticketShow.tickets=tickets;
				ticketShow.seatid=seatID;
				if (tickets > 0) {
					ticketShows.add(ticketShow);
				}
				
		}	
		for (int j = 0; j < ticketShows.size(); j++) {
			System.out.println(ticketShows.get(j).toString());
		}		
		session.setAttribute("ticketShows", ticketShows);		
		/*选择乘车人信息*/
		
		session.setAttribute("people", people);
		session.setAttribute("start", start);
		session.setAttribute("end", end);
		return "result";
	}
}