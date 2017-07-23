package com.shop.service.backstage;

import java.util.List;

import com.shop.entity.XxArea;

public interface AreaService {
	/**
	 * 三级联动
	 * 返回顶级地区
	 * @return 顶级地区集合
	 */
	public List<XxArea> findRoots();
	
	/**
	 * 根据id查地区
	 * @param id
	 * @return
	 */
	public XxArea find(Long id);

}
