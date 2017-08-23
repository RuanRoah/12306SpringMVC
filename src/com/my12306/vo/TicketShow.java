package com.my12306.vo;

import java.util.List;

public class TicketShow {

	public String train_name;//train name
	public String startTime;
	public String start;
	public String endTime;
	public String end;
	public double money;
	
	public int startsec;
	public int endsec;//下标
	
	public int tickets;//余票量
	public List<String> seatid;//余座的数组
	public String date;
	
	
	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getStart() {
		return start;
	}


	public void setStart(String start) {
		this.start = start;
	}


	public String getTrain_name() {
		return train_name;
	}


	public void setTrain_name(String train_name) {
		this.train_name = train_name;
	}


	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public String getEnd() {
		return end;
	}


	public void setEnd(String end) {
		this.end = end;
	}


	public double getMoney() {
		return money;
	}


	public void setMoney(double money) {
		this.money = money;
	}


	public int getStartsec() {
		return startsec;
	}


	public void setStartsec(int startsec) {
		this.startsec = startsec;
	}


	public int getEndsec() {
		return endsec;
	}


	public void setEndsec(int endsec) {
		this.endsec = endsec;
	}


	public int getTickets() {
		return tickets;
	}


	public void setTickets(int tickets) {
		this.tickets = tickets;
	}


	public List<String> getSeatid() {
		return seatid;
	}


	public void setSeatid(List<String> seatid) {
		this.seatid = seatid;
	}


	@Override
	public String toString() {
		return "TicketShow [train_name=" + train_name + ", startTime=" + startTime + ", start=" + start + ", endTime="
				+ endTime + ", end=" + end + ", money=" + money + ", startsec=" + startsec + ", endsec=" + endsec
				+ ", tickets=" + tickets + ", seatid=" + seatid + ", date=" + date + "]";
	}


	
}
