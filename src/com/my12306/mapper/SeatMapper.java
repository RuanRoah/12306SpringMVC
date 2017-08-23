package com.my12306.mapper;

public  interface SeatMapper {
	/**
	 * 根据座位id找到座位path
	 * */
   public String getPathBySeatid(String id);

   /**
	 * 更新path
	 * @param要更新的seatid
	 * @param新path
	 * */
   public int updatePathBySeatid(String id,String path);
   /**
	 * 根据座位id找到座位号
	 * */
  public String getSeat(String id);
}
