package com.my12306.seivice.impl.ticket;




import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;


import com.my12306.mapper.TicketInfoMapper;
import com.my12306.mapper.TicketMapper;
import com.my12306.mapper.TicketsMapper;
import com.my12306.po.ticket.Seat;
import com.my12306.po.ticket.TicketInfo;
import com.my12306.po.ticket.Tickets;
import com.my12306.po.train.TrainInfo;
import com.my12306.po.train.Trains;
import com.my12306.service.ticket.TicketService;
import com.my12306.util.MybatisUtil;


public class TicketServiceImpl implements TicketService{
	@Resource
	TicketsMapper ticketsMapper;
	TicketInfoMapper ticketInfoMapper;
	SqlSession sqlSession = sqlSessionFactory.openSession();  
	
	static SqlSessionFactory sqlSessionFactory = null;
    static {
        sqlSessionFactory = MybatisUtil.getSqlsessionfactory();
        
    }
	
   
    //�ſ���
    @Override
	public boolean refundTicket(String id) {
		
		return false;
	}

	@Override
	public Tickets geTicketsById(String id) {
		System.out.println(ticketsMapper);
		Tickets result = ticketsMapper.geTicketsById(id);
		if (result != null) {
			return result;
		}
		return null;
	}

	@Override
	public Tickets geTicketsByUserId(String userId) {
		Tickets result = ticketsMapper.geTicketsByUserId(userId);
		if (result != null) {
			return result;
		}
		return null;
	}

	@Override
	public int addTickets(String userId, String humanId, String trainId, String seat, String road, String id) {
		return ticketsMapper.addTickets(userId, humanId, trainId, seat, road, id);
	}

	@Override
	public int deleteTickets(String id) {
		return ticketsMapper.deleteTickets(id);
	}

	@Override
	public int changeTrainId(String id,String trainId) {
		return ticketsMapper.changeTrainId(id,trainId);
	}

	@Override
	public TicketInfo geTicketInfoById(String id) {
		TicketInfo result = ticketInfoMapper.geTicketInfoById(id);
		if (result != null) {
			return result;
		}
		return null;
	}

	@Override
	public TicketInfo geTicketInfoByTrainId(String trainId) {
		TicketInfo result = ticketInfoMapper.geTicketInfoByTrainId(trainId);
		if (result != null) {
			return result;
		}
		return null;
	}

	@Override
	public int changeSeatNum(String id,int seatNum) {
		return ticketInfoMapper.changeSeatNum(id,seatNum);
	}

	@Override
	public TicketInfo geTicketInfoByStartTime(String startTime) {
		TicketInfo result = ticketInfoMapper.geTicketInfoByStartTime(startTime);
		if (result != null) {
			return result;
		}
		return null;
	}

	
	
	//new quertTicket
	@Override
	public List<TrainInfo> queryTrainInfo(String date) {
		// TODO Auto-generated method stub
		
		TicketMapper ticketMapper=sqlSession.getMapper(TicketMapper.class);
		
		List<TrainInfo> getTrains=ticketMapper.queryTrainInfosbyDate(date);
		
		return getTrains;
	}

	@Override
	public Trains queryTrains(String train_ID) {
		// TODO Auto-generated method stub
		
		TicketMapper ticketMapper=sqlSession.getMapper(TicketMapper.class);
		
		Trains getTrain=ticketMapper.queryTrainsbyTrain_ID(train_ID);
		
		return getTrain;
	}

	@Override
	public List<Seat> querySeats(String trainid,String seat) {
		// TODO Auto-generated method stub
		TicketMapper ticketMapper=sqlSession.getMapper(TicketMapper.class);
		
		List<Seat> getSeats=ticketMapper.querySeatsbyTrain_id(trainid,seat);
		return getSeats;
	}
	
	

}
