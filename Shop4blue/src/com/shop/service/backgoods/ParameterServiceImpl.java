package com.shop.service.backgoods;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxParameterGroupMapper;
import com.shop.dao.XxParameterMapper;
import com.shop.entity.XxParameter;
import com.shop.entity.XxParameterGroup;
import com.shop.entity.XxParameterGroupExample;

@Service
public class ParameterServiceImpl implements ParameterService {

	@Autowired
	XxParameterGroupMapper parameterGroupMapper;
	@Autowired
	XxParameterMapper parameterMapper;

	@Override
	public List<XxParameterGroup> findParams() {
		return parameterGroupMapper.findParms();
	}

	@Override
	public int findSum() {
		return parameterGroupMapper.countByExample(new XxParameterGroupExample());
	}

	@Override
	public int totalNum() {
		return parameterGroupMapper.totalNum();
	}

	@Override
	public XxParameterGroup findOne(Long id) {
		return parameterGroupMapper.findOne(id);
	}

	@Override
	public void insertParameterGroup(XxParameterGroup parameterGroup) {
		parameterGroupMapper.insert(parameterGroup);
	}

	@Override
	public void insertParameters(List<XxParameter> parameters) {
		for(XxParameter p : parameters){
			parameterMapper.insert(p);
		}
	}

	@Override
	public void updateParameterGroup(XxParameterGroup parameterGroup) {
		parameterGroupMapper.updateByPrimaryKeySelective(parameterGroup);
	}

	@Override
	public void updateParameters(List<XxParameter> parameters) {
		for(XxParameter p : parameters){
			parameterMapper.updateByPrimaryKeySelective(p);
		}
		
	}

	@Override
	public List<XxParameterGroup> findByGroupId(Long id) {
		return parameterGroupMapper.findByGroupId(id);
	}

}
