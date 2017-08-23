package com.my12306.vo;

import com.my12306.po.order.Order;

public class OrderShow {

	String id;//orderid
	String name;//乘车人姓名
	String seatid;//座位号
	double ticketPrice;//票价
	String train;//车次
	String startCity;//出发城市
	String endCity;//到达城市
	String startTime;//出发时间
	String endTime;//到达时间
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSeatid() {
		return seatid;
	}
	public void setSeatid(String seatid) {
		this.seatid = seatid;
	}
	public double getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(double ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getTrain() {
		return train;
	}
	public void setTrain(String train) {
		this.train = train;
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
	
	public String getStartCity() {
		return startCity;
	}
	public void setStartCity(String startCity) {
		this.startCity = startCity;
	}

	public String getEndCity() {
		return endCity;
	}
	public void setEndCity(String endCity) {
		this.endCity = endCity;
	}
	
	
	public OrderShow(String id, String name, String seatid, double ticketPrice, String train, String startCity,
			String endCity, String startTime, String endTime) {
		super();
		this.id = id;
		this.name = name;
		this.seatid = seatid;
		this.ticketPrice = ticketPrice;
		this.train = train;
		this.startCity = startCity;
		this.endCity = endCity;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public OrderShow(Order order){
		this.id = order.getOrderId();
		this.name = order.getPeopleName();
		this.seatid = order.getSeatId();
		this.ticketPrice = order.getCost();
		this.train = order.getTrainId();
		this.startCity = order.getSTART_CITY();
		this.endCity = order.getARRIVE_CITY();
		this.startTime = order.getSTART_DATE();
		this.endTime = order.getFINISH_DATE();
	}
	@Override
	public String toString() {
		return "OrderShow [id=" + id + ", name=" + name + ", seatid=" + seatid + ", ticketPrice=" + ticketPrice
				+ ", train=" + train + ", startCity=" + startCity + ", endCity=" + endCity + ", startTime=" + startTime
				+ ", endTime=" + endTime + "]";
	}
	
	
}
