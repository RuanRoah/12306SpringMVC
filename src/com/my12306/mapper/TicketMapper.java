package com.my12306.mapper;

import java.util.List;

import com.my12306.po.ticket.Seat;
import com.my12306.po.train.TrainInfo;
import com.my12306.po.train.Trains;

public interface TicketMapper {

/*	public List<Train> queryTrainsbyDate(String date);
	
	public List<Seat> querySeatsbyDateAndTRA_NUM(String tra_NUM, String date);

	public List<Seat> querySeatsbyIntID(int[] seats);

	public void updateSeatPathbySeatid(int xiugaiSeat_id, String wanchengdemo);*/

	//new queryTicket
	public List<TrainInfo> queryTrainInfosbyDate(String date);

	public Trains queryTrainsbyTrain_ID(String train_ID);

	public List<Seat> querySeatsbyTrain_id(String trainid,String seat);
}
