package com.shop.dao;

import com.shop.entity.XxGoods;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductCategory;
import com.shop.entity.XxProductExample;
import com.shop.entity.XxTag;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XxProductMapper {
	int countByExample(XxProductExample example);

	int deleteByExample(XxProductExample example);

	int deleteByPrimaryKey(Long id);

	int insert(XxProduct record);

	int insertSelective(XxProduct record);

	List<XxProduct> selectByExampleWithBLOBs(XxProductExample example);

	List<XxProduct> selectByExample(XxProductExample example);

	XxProduct selectByPrimaryKey(Long id);

	int updateByExampleSelective(@Param("record") XxProduct record, @Param("example") XxProductExample example);

	int updateByExampleWithBLOBs(@Param("record") XxProduct record, @Param("example") XxProductExample example);

	int updateByExample(@Param("record") XxProduct record, @Param("example") XxProductExample example);

	int updateByPrimaryKeySelective(XxProduct record);

	int updateByPrimaryKeyWithBLOBs(XxProduct record);

	int updateByPrimaryKey(XxProduct record);

	List<Map<String, Object>> getProduct(Map<String, Object> map);

	List<XxProduct> selectShopByList(Long id);

	List<XxProduct> selectShopByType(Map map);

	List<XxTag> getTags();
	
	XxProduct getProductBySn(String productSn);
	
	Long insertInToByEntity(XxProduct xxProduct);

	void insertInToMemberPrice(Map map);

	void insertInToProductImage(Map map);

	void addTag(Map map);

	void addParameterValueKey(Map map);

	void addSpecification(Map map);

	void addSpecificationValue(Map map);

	Long addGoods(XxGoods goods);

	XxProduct findOne(Long id);

	XxProduct findONeProduct(Long id);
	
	XxProductCategory selectById(Long id);

	List<XxProduct> selectBySearch(@Param("str")String str);

	List<Map<String, Object>> getMemberPrice(Long id);

	List<Map<String, Object>> getTagsByProductId(Long id);

	List<Map<String,Object>> getParameterValueById(Long id);

	List<Map<String,Object>> getParameterValueKeyById(Long id);

	List<Map<String, Object>> getSpecifiCationById(Long id);

	List<Map<String, Object>> getSpec(Long id);

	Long getGoodIdByProductId(Long id);

	void editProduct(XxProduct xp);

	void deleteTagsByProductId(Long id);

	void deleteImagesByProductId(Long id);

	void deleteParameterByProductId(Long id);

	void deleteSpecificationByProductId(Long id);

	void deleteSpecificationValueByProductId(Long id);

	void deleteMemberPriceByProductId(Long id);
	
	List<Map<String, Object>> selectProductsByProductGoods(Long id);

	List<Map<String, Long>> selectSpecifaicationValuesByProductId(Long id);

	List<XxProduct> getProductsByProduct(Long id);
	
	int getCount(Map<String, Object> map);
	
}