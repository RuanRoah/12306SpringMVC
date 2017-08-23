package com.my12306.vo.mapreduce;

public class TrainCount {
	private String train_id;
	private int count;
	public TrainCount(String train_id, int count) {
		super();
		this.train_id = train_id;
		this.count = count;
	}
	public TrainCount() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTrain_id() {
		return train_id;
	}
	public void setTrain_id(String train_id) {
		this.train_id = train_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "TrainCount [train_id=" + train_id + ", count=" + count + "]";
	}
	
}
