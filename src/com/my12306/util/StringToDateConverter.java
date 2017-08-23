package com.my12306.util;

import java.util.Date;
import java.text.SimpleDateFormat;

import org.springframework.core.convert.converter.Converter;

public class StringToDateConverter implements Converter<String, Date> {

	private String datePattern;

	public void setDatePattern(String datePattern) {
		this.datePattern = datePattern;
	}

	@Override
	public Date convert(String date) {
		try
		{
			SimpleDateFormat dateFormat = new SimpleDateFormat(this.datePattern);
			return dateFormat.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("³öÏÖ´íÎó");
			return null;
		}
	}

}
