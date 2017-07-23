package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxRefunds;

public interface Order4ReturnMoneyService {

	List<Map<String, Object>> getXxRefunds(Map<String, Object> map);

	int selectRefundsCount();

	XxRefunds getXxRefundsById(int id);

}
