package com.my12306.mapper;

import java.util.List;

import com.my12306.po.train.Trains;


public interface TrainsMapper {
	
	/**
	 * 通过id查询车次
	 */
	public Trains getTrainsById(String id);
	
	/**
	 * 通过车次号查询车次
	 */
	public Trains getTrainsByTrainId(String trainId);
	
	/**
	 * 通过路径查询车次
	 */
	public List<Trains> geTrainsByRoad(String road);
	
	/**
	 * 通过车类型查询车次
	 */
	public List<Trains> geTrainsByStatus(String status);
}
