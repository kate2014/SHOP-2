package com.shop.dao;

import com.shop.entity.XxShipping;
import com.shop.entity.XxShippingExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XxShippingMapper {
    int countByExample(XxShippingExample example);

    int deleteByExample(XxShippingExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxShipping record);

    int insertSelective(XxShipping record);

    List<XxShipping> selectByExample(XxShippingExample example);

    XxShipping selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxShipping record, @Param("example") XxShippingExample example);

    int updateByExample(@Param("record") XxShipping record, @Param("example") XxShippingExample example);

    int updateByPrimaryKeySelective(XxShipping record);

    int updateByPrimaryKey(XxShipping record);

	List<Map<String, Object>> selectShipping(Map<String, Object> map);

	XxShipping selectAllByPrimaryKey(int id);
	
	XxShipping findShippingByOrderId(Long id);
}