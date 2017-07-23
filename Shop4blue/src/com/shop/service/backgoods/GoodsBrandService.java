package com.shop.service.backgoods;

import java.util.List;

import com.shop.entity.XxBrand;

public interface GoodsBrandService {

	List<XxBrand> selAllbrand(Integer page, Integer rows);

	int selectNum();

	void addBrand(XxBrand xb);

	void delByIds(int[] ids);

	XxBrand selById(long id);

	void updateById(XxBrand xb);

	List<XxBrand> selectAll();

}
