package com.shop.service.websevice;

import java.util.List;

import com.shop.entity.XxBrand;
import com.shop.entity.XxProductCategory;

public interface HotGoodsService {

	/**
	 * 根据点击量查询排序热门商品
	 */
	public List<XxBrand> sortHotGoods();

	/**
	 * 更新访问量
	 * @param id 访问品牌的id
	 */
	public void updateHotGood(Long id); 
	
	/**
	 * 左侧商品列表
	 * @return
	 */
	public List<XxProductCategory> selectProductCategroy();
	
	/**
	 * 上面商品列表
	 * @param id 上级商品id(找出parent为此id的商品列表)
	 * @return
	 */
	public List<XxProductCategory> selectTopList(Long id);
	
	/**
	 * 首页后方小标签
	 * @return 返回该标签的实体
	 */
	public List<XxProductCategory> selectCategory(Long id);

	
}
