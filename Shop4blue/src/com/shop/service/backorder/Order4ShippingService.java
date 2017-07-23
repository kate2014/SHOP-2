package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxShipping;

public interface Order4ShippingService {

	List<Map<String, Object>> getShipping(Map<String, Object> map);

	int selectShippingCount();

	XxShipping getXxShippingById(int id);
  
}
