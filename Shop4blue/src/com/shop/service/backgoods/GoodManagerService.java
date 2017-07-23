package com.shop.service.backgoods;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxAttribute;
import com.shop.entity.XxGoods;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductMemberPrice;
import com.shop.entity.XxProductParameterValue;
import com.shop.entity.XxProductParameterValueKey;
import com.shop.entity.XxPromotion;
import com.shop.entity.XxTag;
@SuppressWarnings("rawtypes")
public interface GoodManagerService {

	List<Map<String, Object>> getProduct(Map<String, Object> map);

	int selectProductCount(Map<String, Object> map);

	List<XxAttribute> ajaxGetproperty(Long id);

	List<XxTag> getTags();

	Long insertInToByEntity(XxProduct xxProduct);

	
	void addXxProductMemberPrice(Map map);

	void addXxProductProductImage(Map map);

	void addTags(Map map);

	void addparameterValueKey(Map map);

	void addSpecification(Map map);

	void addSpecificationValue(Map map);

	Long addGoods(XxGoods goods);

	XxProduct finOne(Long id);

	XxProduct getOneProduct(Long id);

	XxProduct findOneProduct(Long id);

	List<Map<String,Object>> getmemberPrice(Long id);

	List<Map<String, Object>> getTagByProductId(Long id);

	List<Map<String, Object>> getParameterValueById(Long id);

	List<Map<String, Object>> getParameterValueKeyById(Long id);

	List<Map<String, Object>> getSpecifiCationById(Long id);

	List<Map<String, Object>> getsdjklghkghajksgh(Long id);

	Long getGoodId(Long id);

	void editProduct(XxProduct xp);

	void deleteTagsByProductId(Long id);

	void deleteImagesByProductId(Long id);

	void deleteParameterByProductId(Long id);

	void deleteSpecificationByProductId(Long id);

	void deleteSpecificationValueByProductId(Long id);

	void delMemberPriceByProductId(Long id);

	List<XxPromotion> getPromotion();

}
