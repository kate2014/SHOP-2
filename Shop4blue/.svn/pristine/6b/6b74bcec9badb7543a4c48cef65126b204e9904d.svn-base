package com.shop.service.websevice;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.XxMemberFavoriteProductMapper;
import com.shop.dao.XxProductNotifyMapper;

@Service
public class CountServiceImpl implements CountService {

	@Resource
	private XxProductNotifyMapper xxProductNotifyMapper;
	@Resource
	private XxMemberFavoriteProductMapper xxMemberFavoriteProductMapper;
	@Override
	public int getGoodsMessageCount(Long userid) {
		int count=xxProductNotifyMapper.getCount(userid);
		return count;
	}
	@Override
	public int getGoodsCollectCount(Long userid) {
		int count=xxMemberFavoriteProductMapper.getCount(userid);
		return count;
	}

}
