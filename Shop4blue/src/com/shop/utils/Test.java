package com.shop.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import com.shop.entity.XxDeliveryCenter;
import com.shop.entity.XxOrder;

public class Test {

	public static void main(String[] args) throws NoSuchMethodException, SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		XxDeliveryCenter deliveryCenter = new XxDeliveryCenter();
		deliveryCenter.setName("haha");
		XxOrder order = new XxOrder();

		String s = "<div class=item style=z-index: 24; left: 101px; top: 102px;><pre>${deliveryCenter.name}</pre><pre>${order.areaName}</pre>";
		while (s.contains("$")) {
			int start = s.indexOf('$');
			int end = s.indexOf("}");
			String str = s.substring(start, end + 1);
			System.out.print(s.substring(0,start));
			if (str.contains("deliveryCenter")) {
				try {
					str = str.substring(str.indexOf('.') + 1, str.indexOf('}'));
					String ss = "get" + str.substring(0, 1).toUpperCase() + str.substring(1);
					//System.out.print(ss);
					Method method = deliveryCenter.getClass().getDeclaredMethod(ss, null);
					Object name;
					name = method.invoke(deliveryCenter, null);
					System.out.print(name);
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException
						| NoSuchMethodException | SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (str.contains("order")) {
				try {
					str = str.substring(str.indexOf('.') + 1, str.indexOf('}'));
					String ss = "get" + str.substring(0, 1).toUpperCase() + str.substring(1);
					//System.out.println(ss);
					Method method = order.getClass().getDeclaredMethod(ss, null);
					Object o = method.invoke(order, null);
					System.out.print(o);
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException
						| NoSuchMethodException | SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			s = s.substring(end + 1);
		}
		System.out.print(s);
	}

}
