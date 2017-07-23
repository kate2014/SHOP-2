package com.shop.service.websevice;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxProduct;
import com.shop.entity.XxProductCategory;
import com.shop.entity.XxProductParameterValue;

public interface ShopContentService {

	XxProductCategory bigTagName(Long id);

	List<XxProductCategory> smallTagName(Long id);

	XxProduct productContent(Long id);

	List<XxProductParameterValue> getShopParameter(Long id);

	List<Map<String, Object>> getProductsByProductGoods(Long id);

	List<Map<String, Long>> getSpecificationValuesByProductId(Long id);

	List<XxProduct> getProductsByProduct(Long id);
}
