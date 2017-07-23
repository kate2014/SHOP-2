package com.shop.service.websevice;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxProduct;

public interface ShopService {

	
	public List<XxProduct> selectShop(Long id);

	public List<XxProduct> selectShopBySort(Map<String,Object> map);
}
