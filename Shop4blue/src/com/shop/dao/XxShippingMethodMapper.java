package com.shop.dao;

import com.shop.entity.XxShippingMethod;
import com.shop.entity.XxShippingMethodExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxShippingMethodMapper {
    int countByExample(XxShippingMethodExample example);

    int deleteByExample(XxShippingMethodExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxShippingMethod record);

    int insertSelective(XxShippingMethod record);

    List<XxShippingMethod> selectByExampleWithBLOBs(XxShippingMethodExample example);

    List<XxShippingMethod> selectByExample(XxShippingMethodExample example);

    XxShippingMethod selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxShippingMethod record, @Param("example") XxShippingMethodExample example);

    int updateByExampleWithBLOBs(@Param("record") XxShippingMethod record, @Param("example") XxShippingMethodExample example);

    int updateByExample(@Param("record") XxShippingMethod record, @Param("example") XxShippingMethodExample example);

    int updateByPrimaryKeySelective(XxShippingMethod record);

    int updateByPrimaryKeyWithBLOBs(XxShippingMethod record);

    int updateByPrimaryKey(XxShippingMethod record);
}