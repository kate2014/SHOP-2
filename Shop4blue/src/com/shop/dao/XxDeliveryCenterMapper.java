package com.shop.dao;

import com.shop.entity.XxDeliveryCenter;
import com.shop.entity.XxDeliveryCenterExample;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XxDeliveryCenterMapper {
    int countByExample(XxDeliveryCenterExample example);

    int deleteByExample(XxDeliveryCenterExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxDeliveryCenter record);

    int insertSelective(XxDeliveryCenter record);

    List<XxDeliveryCenter> selectByExample(XxDeliveryCenterExample example);

    XxDeliveryCenter selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxDeliveryCenter record, @Param("example") XxDeliveryCenterExample example);

    int updateByExample(@Param("record") XxDeliveryCenter record, @Param("example") XxDeliveryCenterExample example);

    int updateByPrimaryKeySelective(XxDeliveryCenter record);

    int updateByPrimaryKey(XxDeliveryCenter record);

	HashMap<String, Object> selectDeliveryCount();

	List<Map<String, Object>> selectDeliveryByTag(Map<String, Object> map);

	List<Map<String, Object>> selectByPrimaryId(Long id);

	String getAreaname(Long area);
}