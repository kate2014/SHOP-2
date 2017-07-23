package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxRefundsMapper;
import com.shop.entity.XxRefunds;
import com.shop.entity.XxRefundsExample;
@Service
public class Order4ReturnMoneyServiceImpl implements Order4ReturnMoneyService{
   @Autowired
   private XxRefundsMapper xrm;
	
	
	
	@Override
	public List<Map<String, Object>> getXxRefunds(Map<String, Object> map) {
		 List<Map<String, Object>> list  = xrm.selectXxRefunds(map);
		return list;
	}
	@Override
	public int selectRefundsCount() {
		int size = xrm.countByExample(new XxRefundsExample());
		return size;
	}
	@Override
	public XxRefunds getXxRefundsById(int id) {
               XxRefunds xr = xrm.selectByPrimaryKey(Long.parseLong(id+""));
		return xr;
	}
       
}
