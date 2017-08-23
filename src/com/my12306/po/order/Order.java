package com.my12306.po.order;

import com.my12306.util.GetUUID;

/**
 * 订单实体类
 * */
public class Order {
	String orderId;//订单ID
	String userId;//用户ID
	String peopleName;//乘车人名字*
	String trainId;//车次*
	String seatId;//座位ID*
	int startIndex;//出发城市下标
	int endIndex;//到达城市下标
	String START_DATE;//出发日期*
	String FINISH_DATE;//到达日期*
	String START_CITY;//出发城市*
	String ARRIVAL_CITY;//到达城市*
	double cost;//票价*
	String seatN;//座位号
	int isPay;
	public Order () {
		
		//自动生成订单id
		orderId=GetUUID.getuuid();
		
	}
	public Order (Order order) {
		orderId=order.orderId;
		userId=order.userId;
		peopleName=order.peopleName;
		trainId=order.trainId;
		seatId=order.seatId;
		startIndex=order.startIndex;
		endIndex=order.endIndex;
		START_DATE=order.START_DATE;
		FINISH_DATE=order.FINISH_DATE;
		START_CITY=order.START_CITY;
		ARRIVAL_CITY=order.ARRIVAL_CITY;
		cost=order.getCost();
		seatN=order.getSeatN();
		isPay=order.isPay;
		
		
	}
	public Order( String userId, String peopleName, String trainId, String seatId, int startIndex,String startcity,
			int endIndex,String arrivalcity, String sTART_DATE, String fINISH_DATE,double cost,String seatN) {
		
		//自动生成订单id
		orderId=GetUUID.getuuid();
		this.userId = userId;
		this.peopleName = peopleName;
		this.trainId = trainId;
		this.seatId = seatId;
		this.startIndex = startIndex;
		this.endIndex = endIndex;
		START_CITY=startcity;
		ARRIVAL_CITY=arrivalcity;
		START_DATE = sTART_DATE;
		FINISH_DATE = fINISH_DATE;
		this.cost=cost;
		this.seatN=seatN;
		isPay=0;
	}
	
	
	public String getARRIVAL_CITY() {
		return ARRIVAL_CITY;
	}
	public void setARRIVAL_CITY(String aRRIVAL_CITY) {
		ARRIVAL_CITY = aRRIVAL_CITY;
	}
	public String getSeatN() {
		return seatN;
	}
	public void setSeatN(String seatN) {
		this.seatN = seatN;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public String getSTART_CITY() {
		return START_CITY;
	}
	public void setSTART_CITY(String sTART_CITY) {
		START_CITY = sTART_CITY;
	}
	public String getARRIVE_CITY() {
		return ARRIVAL_CITY;
	}
	public void setARRIVE_CITY(String aRRIVE_CITY) {
		ARRIVAL_CITY = aRRIVE_CITY;
	}
	public String getSTART_DATE() {
		return START_DATE;
	}

	public void setSTART_DATE(String sTART_DATE) {
		START_DATE = sTART_DATE;
	}

	public String getFINISH_DATE() {
		return FINISH_DATE;
	}

	public void setFINISH_DATE(String fINISH_DATE) {
		FINISH_DATE = fINISH_DATE;
	}

	public int getIsPay() {
		return isPay;
	}

	public void setIsPay(int isPay) {
		this.isPay = isPay;
	}

	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPeopleName() {
		return peopleName;
	}
	public void setPeopleName(String peopleName) {
		this.peopleName = peopleName;
	}
	public String getTrainId() {
		return trainId;
	}
	public void setTrainId(String trainId) {
		this.trainId = trainId;
	}
	public String getSeatId() {
		return seatId;
	}
	public void setSeatId(String seatId) {
		this.seatId = seatId;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", peopleName=" + peopleName + ", trainId="
				+ trainId + ", seatId=" + seatId + ", startIndex=" + startIndex + ", endIndex=" + endIndex
				+ ", START_DATE=" + START_DATE + ", FINISH_DATE=" + FINISH_DATE + ", START_CITY=" + START_CITY
				+ ", ARRIVAL_CITY=" + ARRIVAL_CITY + ", cost=" + cost + ", seatN=" + seatN + ", isPay=" + isPay + "]";
	}
}
