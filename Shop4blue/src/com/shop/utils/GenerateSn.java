package com.shop.utils;

import java.util.Calendar;
import java.util.Date;

public class GenerateSn {
	
	public static String generate(){
		Date d = new Date();
		return d.getYear()+""+d.getMonth()+""+d.getDay()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
	}
}
