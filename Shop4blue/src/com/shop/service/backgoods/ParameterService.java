package com.shop.service.backgoods;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxParameter;
import com.shop.entity.XxParameterGroup;

public interface ParameterService {
	
	public List<XxParameterGroup> findParams();
	
	public int findSum();
	
	public int totalNum();
	
	public XxParameterGroup findOne(Long id);
	
	public void insertParameterGroup(XxParameterGroup parameterGroup);
	
	public void insertParameters(List<XxParameter> parameters);
	
	public void updateParameterGroup(XxParameterGroup parameterGroup);
	
	public void updateParameters(List<XxParameter> parameters);

	public List<XxParameterGroup> findByGroupId(Long id);



}
