package com.shop.service.websevice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.XxProductMapper;
import com.shop.entity.XxProduct;

@Transactional
@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private XxProductMapper xxProductMapper;
	
	/**
	 * 查询商品 显示
	 */
	@Override
	public List<XxProduct> selectShop(Long id) {
		List<XxProduct> list=xxProductMapper.selectShopByList(id);
		return list;
	}

	@Override
	public List<XxProduct> selectShopBySort(Map<String,Object> map) {
		
		return xxProductMapper.selectShopByType(map);
	}

	

	
}
