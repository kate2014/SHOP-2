package com.shop.service.backgoods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxAttributeMapper;
import com.shop.dao.XxAttributeOptionMapper;
import com.shop.entity.XxAttribute;
import com.shop.entity.XxAttributeExample;
import com.shop.entity.XxAttributeOption;

@Service
public class SpsxServiceImpl implements SpsxService {

	@Autowired
	XxAttributeMapper xxAttributeMapper;
	@Autowired
	XxAttributeOptionMapper xxAttributeOptionMapper;
	@Override
	public List<XxAttribute> getAll() {
		List<XxAttribute> list=xxAttributeMapper.selectAll();
		return list;
	}
	@Override
	public int addSpsx(XxAttribute xxAttribute) {
		xxAttributeMapper.insertAttribute(xxAttribute);
		return 0;
	}
	@Override
	public int addAttributeOption(XxAttributeOption xxAttributeOption) {
		xxAttributeOptionMapper.insert(xxAttributeOption);
		return 0;
	}
	@Override
	public int getCountAttribute() {
		int i=xxAttributeMapper.getAll();
		return i;
	}
	@Override
	public XxAttribute getById(Long id) {
		XxAttribute xxAttribute = xxAttributeMapper.selectOne(id);
		return xxAttribute;
	}
	@Override
	public int deleteById(Long id) {
		xxAttributeOptionMapper.deleteByAttribute(id);
		xxAttributeMapper.deleteById(id);
		return 0;
	}

}
