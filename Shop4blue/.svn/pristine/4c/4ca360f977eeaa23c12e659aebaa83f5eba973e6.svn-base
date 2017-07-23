package com.shop.service.websevice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxDepositMapper;
import com.shop.entity.XxDeposit;

@Service
public class DepositServiceImpl implements DepositService {

	@Autowired
	XxDepositMapper xxDepositMapper;
	
	@Override
	public List<XxDeposit> getById(Long id) {
		List<XxDeposit> list=xxDepositMapper.selectById(id);
		return list;
	}

	@Override
	public int addById(Map<String, Object> map) {
		xxDepositMapper.addById(map);
		return 0;
	}

}
