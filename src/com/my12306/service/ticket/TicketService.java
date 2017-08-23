package com.my12306.service.ticket;

import java.util.Date;
import java.util.List;

import com.my12306.po.ticket.Seat;
import com.my12306.po.ticket.TicketInfo;
import com.my12306.po.ticket.Tickets;
import com.my12306.po.train.TrainInfo;
import com.my12306.po.train.Trains;

public interface TicketService {
	//�ſ���
public boolean refundTicket(String id);
	
	/**
	 *ͨ��Ʊ����ʾ��Ʊ��Ϣ 
	 */
	public Tickets geTicketsById(String id);
	
	/**
	 *ͨ���û�����ʾ��Ʊ��Ϣ 
	 */
	public Tickets geTicketsByUserId(String userId);
	
	/**
	 *�½���Ʊ��Ϣ 
	 */
	public int addTickets(String userId,String humanId,String trainId,String seat,String road,String id);
	
	/**
	 *ɾ��Ʊ
	 */
	public int deleteTickets(String id);
	
	/**
	 *�޸ĳ���
	 */
	public int changeTrainId(String id,String trainId);
	
	/**
	 *ͨ��Ʊ��������ʾ��Ʊ������Ϣ 
	 */
	public TicketInfo geTicketInfoById(String id);
	
	/**
	 *ͨ��κ���ʾ��Ʊ�������? 
	 */
	public TicketInfo geTicketInfoByTrainId(String trainId);
	
	/**
	 *�޸���ϯ
	 */
	public int changeSeatNum(String id,int seatNum);
	
	/**
	 *ͨ�����ʱ����ʾ��Ʊ�������? 
	 */
	public TicketInfo geTicketInfoByStartTime(String startTime);

	
	
	//new queryTicket
	public List<TrainInfo> queryTrainInfo(String date);

	public Trains queryTrains(String train_ID);

	public List<Seat> querySeats(String trainid,String seat);
	
	
	
	
	
	
	

	

}
