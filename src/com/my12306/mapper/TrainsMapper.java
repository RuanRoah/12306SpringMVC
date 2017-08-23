package com.my12306.mapper;

import java.util.List;

import com.my12306.po.train.Trains;


public interface TrainsMapper {
	
	/**
	 * ͨ��id��ѯ����
	 */
	public Trains getTrainsById(String id);
	
	/**
	 * ͨ�����κŲ�ѯ����
	 */
	public Trains getTrainsByTrainId(String trainId);
	
	/**
	 * ͨ��·����ѯ����
	 */
	public List<Trains> geTrainsByRoad(String road);
	
	/**
	 * ͨ�������Ͳ�ѯ����
	 */
	public List<Trains> geTrainsByStatus(String status);
}
