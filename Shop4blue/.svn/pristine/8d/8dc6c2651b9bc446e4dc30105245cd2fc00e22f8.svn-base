package com.shop.service.backgoods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxSpecificationMapper;
import com.shop.dao.XxSpecificationValueMapper;
import com.shop.entity.XxSpecification;
import com.shop.entity.XxSpecificationValue;

@Service
public class GgglServiceImpl implements GgglService {

	@Autowired
	XxSpecificationMapper xxSpecificationMapper;
	@Autowired
	XxSpecificationValueMapper xxSpecificationValueMapper;
	
	public List<XxSpecification> getAll(){
		List<XxSpecification> list=xxSpecificationMapper.selectAll();
		return list;
	}
	
	public int getCount(){
		int i=xxSpecificationMapper.getCount();
		return i;
	}

	@Override
	public int saveGg(XxSpecification xxSpecification) {
		xxSpecificationMapper.addSpecification(xxSpecification);
		return 0;
	}
	@Override
	public int saveGgValue(XxSpecificationValue xxSpecificationValue){
		xxSpecificationValueMapper.addSpecificationValue(xxSpecificationValue);
		return 0;
	}

	@Override
	public XxSpecification getOne(long id) {
		XxSpecification list=xxSpecificationMapper.editGg(id);
		return list;
	}

	@Override
	public List<XxSpecification> getAllByProducts() {
		return xxSpecificationMapper.selectXxSpecification();
	}

	@Override
	public XxSpecificationValue findSpecificationValue(Long id) {
		XxSpecificationValue xxSpecificationValue = xxSpecificationValueMapper.getEntityById(id);
		return xxSpecificationValue;
	}
	
}
