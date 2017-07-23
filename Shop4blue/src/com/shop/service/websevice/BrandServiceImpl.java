package com.shop.service.websevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxBrandMapper;
import com.shop.entity.XxBrand;
import com.shop.entity.XxBrandExample;

@Service
public class BrandServiceImpl implements BrandService {
	
	@Autowired
	private XxBrandMapper xxBrandMapper;
	@Override
	public XxBrand showBrand(Long id) {
		xxBrandMapper.updateById(id);
		return xxBrandMapper.selectByPrimaryKey(id);
	}
	
	
	@Override
	public List<XxBrand> showBrands(){
		XxBrandExample xxBrandExample=new XxBrandExample();
		xxBrandExample.createCriteria().andIdIsNotNull();
		return xxBrandMapper.selectByExample(xxBrandExample);
		
	}

}
