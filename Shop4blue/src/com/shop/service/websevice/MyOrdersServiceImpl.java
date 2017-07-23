package com.shop.service.websevice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.XxOrderMapper;
import com.shop.entity.XxOrder;

@Service
public class MyOrdersServiceImpl implements MyOrdersService {

	@Resource
	private XxOrderMapper xxOrderMapper;
	@Override
	public List<XxOrder> getAllBymember(Long userid) {
		return xxOrderMapper.getAllByMember(userid);
	}
	
	

}
