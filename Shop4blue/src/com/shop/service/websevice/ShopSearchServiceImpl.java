package com.shop.service.websevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxBrandMapper;
import com.shop.dao.XxProductMapper;
import com.shop.entity.XxBrand;
import com.shop.entity.XxProduct;

@Service
public class ShopSearchServiceImpl implements ShopSearchService {

	@Autowired
	private XxBrandMapper xxBrandMapper;
	@Autowired
	private XxProductMapper xxProductMapper;
	@Override
	public List<XxProduct> searchShop(String str) {
		return xxProductMapper.selectBySearch(str);
	}
	
	
	@Override
	public XxBrand searchBrand(String str){
		return xxBrandMapper.selectBySearch(str);
	}

}
