package com.shop.service.backorder;

import java.util.List;

import com.shop.entity.XxDeliveryCorp;
import com.shop.entity.XxOrder;
import com.shop.entity.XxOrderItem;
import com.shop.entity.XxPaymentMethod;
import com.shop.entity.XxShippingMethod;

public interface OrderManageEditService {

	List<XxPaymentMethod> getPmethod();
	
	/**
	 * 根据主键查支付方式
	 * @param id
	 * @return
	 */
	XxPaymentMethod findPaymentMethodById(Long id);

	List<XxShippingMethod> getSmethod();
	
	XxShippingMethod findShippingMethodById(Long id);
	
	List<XxDeliveryCorp> getDeliveryCorp();

	void updateedit(XxOrder order);

	void updateedit1(List<XxOrderItem> orderItems);

	XxOrderItem getOrderItem(String productSn, Long id);

	int getcount(Long id);

	void delById(Long id);

}
