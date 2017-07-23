package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxShippingMapper;
import com.shop.entity.XxRefunds;
import com.shop.entity.XxShipping;
import com.shop.entity.XxShippingExample;

@Service
public class Order4ShippingServiceImpl implements Order4ShippingService {
   @Autowired
   private XxShippingMapper xsm;
	
	
	@Override
	public List<Map<String, Object>> getShipping(Map<String, Object> map) {
		List<Map<String,Object>> list = xsm.selectShipping(map);
		return list;
	}


	@Override
	public int selectShippingCount() {
		int size = xsm.countByExample(new XxShippingExample());
		return size;
	}


	@Override
	public XxShipping getXxShippingById(int id) {
		XxShipping xr = xsm.selectAllByPrimaryKey(id);
		return xr;
	}
    
}
