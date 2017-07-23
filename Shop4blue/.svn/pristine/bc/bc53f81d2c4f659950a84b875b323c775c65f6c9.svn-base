package com.shop.service.websevice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.XxProductNotifyMapper;
import com.shop.entity.XxProductNotify;

@Service
public class WebGoodsMessageServiceImpl implements WebGoodsMessageService {

	@Resource
	private XxProductNotifyMapper xxProductNotifyMapper;
	
	public List<XxProductNotify> WebSelectAll(Long userid) {
		List<XxProductNotify> list=xxProductNotifyMapper.webSelectAll(userid);
		return list;
	}

	
}
