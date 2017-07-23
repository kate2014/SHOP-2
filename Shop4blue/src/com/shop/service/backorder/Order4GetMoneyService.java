package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxPayment;

public interface Order4GetMoneyService {

	List<Map<String, Object>> getTakeMoney(Map<String, Object> map);

	int selectPaymentCount();

	XxPayment getXxPaymentById(int id);

}
