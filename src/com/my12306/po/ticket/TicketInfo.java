package com.my12306.po.ticket;

import java.util.Date;

public class TicketInfo {
	String id;
	String trainId;
	int trainStatus;
	int seatNum;
	Date startTime;
	Date finishTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTrainId() {
		return trainId;
	}
	public void setTrainId(String trainId) {
		this.trainId = trainId;
	}
	public int getTrainStatus() {
		return trainStatus;
	}
	public void setTrainStatus(int trainStatus) {
		this.trainStatus = trainStatus;
	}
	public int getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
}