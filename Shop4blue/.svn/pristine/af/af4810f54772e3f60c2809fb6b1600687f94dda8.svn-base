package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxPaymentMapper;
import com.shop.entity.XxPayment;
import com.shop.entity.XxPaymentExample;
@Service
public class Order4GetMoneyServiceImpl implements Order4GetMoneyService{
   
	
	@Autowired
	 private   XxPaymentMapper xpm;
	@Override
	public List<Map<String, Object>> getTakeMoney(Map<String, Object> map) {
		List<Map<String, Object>> list =   xpm.selectByCount(map);
		return list;
	}
	@Override
	public int selectPaymentCount() {
		int size = xpm.countByExample(new XxPaymentExample());
		return size;
	}
	@Override
	public XxPayment getXxPaymentById(int id) {
		XxPayment xp  = xpm.selectByPrimaryKey(Long.parseLong(id+""));
		System.out.println(xp);
		return xp;
	}
   
}
