package com.my12306.mapper;



import com.my12306.po.ticket.TicketInfo;

public interface TicketInfoMapper {
	
	public TicketInfo geTicketInfoById(String id);
	
	public TicketInfo geTicketInfoByTrainId(String trainId);
	
	public int changeSeatNum(String id,int seatNum);
	
	public TicketInfo geTicketInfoByStartTime(String startTime);
	
}