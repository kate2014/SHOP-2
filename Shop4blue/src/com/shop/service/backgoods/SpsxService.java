package com.shop.service.backgoods;

import java.util.List;

import com.shop.entity.XxAttribute;
import com.shop.entity.XxAttributeOption;

public interface SpsxService {

	List<XxAttribute> getAll();
	
	int addSpsx(XxAttribute xxAttribute);
	
	int addAttributeOption(XxAttributeOption xxAttributeOption);
	
	int getCountAttribute();
	
	XxAttribute getById(Long id);
	
	int deleteById(Long id);
}
