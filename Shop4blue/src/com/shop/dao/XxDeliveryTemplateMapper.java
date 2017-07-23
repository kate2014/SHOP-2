package com.shop.dao;

import com.shop.entity.XxDeliveryTemplate;
import com.shop.entity.XxDeliveryTemplateExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XxDeliveryTemplateMapper {
    int countByExample(XxDeliveryTemplateExample example);

    int deleteByExample(XxDeliveryTemplateExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxDeliveryTemplate record);

    int insertSelective(XxDeliveryTemplate record);

    List<XxDeliveryTemplate> selectByExampleWithBLOBs(XxDeliveryTemplateExample example);

    List<XxDeliveryTemplate> selectByExample(XxDeliveryTemplateExample example);

    XxDeliveryTemplate selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxDeliveryTemplate record, @Param("example") XxDeliveryTemplateExample example);

    int updateByExampleWithBLOBs(@Param("record") XxDeliveryTemplate record, @Param("example") XxDeliveryTemplateExample example);

    int updateByExample(@Param("record") XxDeliveryTemplate record, @Param("example") XxDeliveryTemplateExample example);

    int updateByPrimaryKeySelective(XxDeliveryTemplate record);

    int updateByPrimaryKeyWithBLOBs(XxDeliveryTemplate record);

    int updateByPrimaryKey(XxDeliveryTemplate record);

	List<Map<String, Object>> selctExpressModel(Map<String, Object> map);
}