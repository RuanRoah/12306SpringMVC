package com.my12306.mapper;

import com.my12306.po.ticket.Tickets;

public interface TicketsMapper {
	
	public Tickets geTicketsById(String id);
	
	public Tickets geTicketsByUserId(String userId);
	
	public int addTickets(String userId,String humanId,String trainId,String seat,String road,String id);
	
	public int deleteTickets(String id);
	
	public int changeTrainId(String id,String trainId);
}
