package com.shop.service.websevice;

import java.util.List;

import com.shop.entity.XxOrder;

public interface MyOrdersService {

	List<XxOrder> getAllBymember(Long userid);

}
