package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxReturnsMapper;
import com.shop.entity.XxReturns;
import com.shop.entity.XxReturnsExample;

@Service
public class Order4ReturnsServiceImpl implements Order4ReturnsService{

	@Autowired
	private XxReturnsMapper  xrm;

	@Override
	public List<Map<String, Object>> getReturns(Map<String, Object> map) {
		List<Map<String,Object>> list = xrm.selectReturns(map);
		return list;
	}

	@Override
	public int selectReturnsCount() {
            int size =xrm.countByExample(new XxReturnsExample());
		return size;
	}

	@Override
	public XxReturns getXxReturnsById(int id) {
		XxReturns xr  = xrm.selectXxReturnsById(id);
		return xr;
	}
	
}
