package com.shop.service.websevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.XxBrandMapper;
import com.shop.dao.XxProductCategoryMapper;
import com.shop.entity.XxBrand;
import com.shop.entity.XxProductCategory;
import com.shop.entity.XxProductCategoryExample;

@Transactional
@Service
public class HotGoodsServiceImpl implements HotGoodsService{

	@Autowired
	private XxBrandMapper xxBrandMapper;

	
	@Override
	public List<XxBrand> sortHotGoods() {
		return xxBrandMapper.selectByOrder();
	}
	
	@Override
	public void updateHotGood(Long id) {
		xxBrandMapper.updateById(id);
	}

	/**
	 * 左侧商品列表
	 */
	@Autowired
	private XxProductCategoryMapper xxProductCategory;
	@Override
	public List<XxProductCategory> selectProductCategroy() {
		XxProductCategoryExample xpce=new XxProductCategoryExample();
		xpce.createCriteria().andGradeEqualTo(0);	
		List<XxProductCategory> list=xxProductCategory.selectByExample(xpce);
		for(XxProductCategory xpc:list){
			List<XxProductCategory> ll=xxProductCategory.selectList(xpc.getId());
			xpc.setList(ll);//只查询四条记录
		}
		return list;
	} 
	
	@Override
	public List<XxProductCategory> selectTopList(Long id){
		XxProductCategoryExample xpce=new XxProductCategoryExample();
		xpce.createCriteria().andParentEqualTo(id);
		return xxProductCategory.selectByExample(xpce);
	}
	
	@Override
	public List<XxProductCategory> selectCategory(Long id){
		XxProductCategoryExample xpce=new XxProductCategoryExample();
		xpce.createCriteria().andIdEqualTo(id);
		return xxProductCategory.selectByExample(xpce);
	}

	
}
