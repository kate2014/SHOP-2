package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxDeliveryTemplate;

public interface Order4ExpressModelService {

	List<Map<String, Object>> getExpressModel(Map<String, Object> map);

	int selectExpressModelCount();

	void addExpress(XxDeliveryTemplate xdt);

	XxDeliveryTemplate selectDeliveryTemplatebyId(Long id);

	void updateExpressModel(XxDeliveryTemplate xdt);

}
