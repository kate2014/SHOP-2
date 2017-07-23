package com.shop.utils;

import java.io.IOException;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.shop.entity.XxDeliveryCenter;
import com.shop.entity.XxOrder;

/**
 * 编写自定义标签
 * 转换content中的字符串中的el表达式
 * jsp只翻译一次  el表达式嵌套el表达式 无法二次翻译
 * @author ddj
 *
 */
public class String2EL extends SimpleTagSupport {
	// 添加两个属性
	private XxOrder order;
	private XxDeliveryCenter deliveryCenter;

	public void setDeliveryCenter(XxDeliveryCenter deliveryCenter) {
		this.deliveryCenter = deliveryCenter;
	}

	public void setOrder(XxOrder order) {
		this.order = order;
	}

	StringWriter sw = new StringWriter();

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		// 得到${deliveryTemplate.content}
		getJspBody().invoke(sw);
		String s = sw.toString();
		while (s.contains("$")) {
			int start = s.indexOf('$');
			out.print(s.substring(0, start));
			int end = s.indexOf("}");
			String str = s.substring(start, end+1);
			if(str.contains("deliveryCenter")){
				try {
					str=str.substring(str.indexOf('.')+1, str.indexOf('}'));
					String ss="get"+str.substring(0,1).toUpperCase()+str.substring(1);
					System.out.println(ss);
					Method method = deliveryCenter.getClass().getDeclaredMethod(ss, null);
					
					Object o = method.invoke(deliveryCenter, null);
					out.print(o);
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(str.contains("order")){
				try {
					str=str.substring(str.indexOf('.')+1, str.indexOf('}'));
					String ss="get"+str.substring(0,1).toUpperCase()+str.substring(1);
					System.out.println(ss);
					Method method = order.getClass().getDeclaredMethod(ss, null);
					Object o = method.invoke(order, null);
					out.print(o);
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			s=s.substring(end+1);
		}
		out.print(s);
		super.doTag();
	}

}
