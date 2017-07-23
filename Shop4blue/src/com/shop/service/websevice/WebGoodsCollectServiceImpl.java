package com.shop.service.websevice;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.XxMemberFavoriteProductMapper;
import com.shop.dao.XxProductMapper;
import com.shop.entity.XxMemberFavoriteProductKey;
import com.shop.entity.XxProduct;

@Service
public class WebGoodsCollectServiceImpl implements WebGoodsCollectService {
	@Resource
	private XxMemberFavoriteProductMapper xxMemberFavoriteProductMapper;
	@Resource
	private XxProductMapper xxProductMapper;

	@Override
	public Long[] getId(Long userid) {
		Long[] id=xxMemberFavoriteProductMapper.getAll(userid);
		return id;
	}

	@Override
	public List<XxProduct> getProduct(Long[] id) {
		List<XxProduct> list=new ArrayList<>();
		for(Long l:id){
			XxProduct xx=xxProductMapper.selectByPrimaryKey(l);
			list.add(xx);		
		}
		return list;
	}

	@Override
	public void del(XxMemberFavoriteProductKey xx) {
		xxMemberFavoriteProductMapper.deleteByPrimaryKey(xx);
		
	}

	@Override
	public void add(Long id, Long userid) {
		XxMemberFavoriteProductKey xx=new XxMemberFavoriteProductKey();
		xx.setFavoriteMembers(userid);
		xx.setFavoriteProducts(id);
		xxMemberFavoriteProductMapper.insertSelective(xx);
	}

}
