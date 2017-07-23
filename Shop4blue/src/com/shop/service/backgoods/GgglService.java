package com.shop.service.backgoods;

import java.util.List;

import com.shop.entity.XxSpecification;
import com.shop.entity.XxSpecificationValue;

public interface GgglService {

	public List<XxSpecification> getAll();
	
	public int getCount();
	
	public int saveGg(XxSpecification xxSpecification);
	
	public int saveGgValue(XxSpecificationValue xxSpecificationValue);
	
	public XxSpecification getOne(long id);

	public List<XxSpecification> getAllByProducts();

	public XxSpecificationValue findSpecificationValue(Long valueOf);

}
