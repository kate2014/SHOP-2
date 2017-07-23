package com.shop.dao;

import com.shop.entity.XxPaymentMethod;
import com.shop.entity.XxPaymentMethodExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxPaymentMethodMapper {
    int countByExample(XxPaymentMethodExample example);

    int deleteByExample(XxPaymentMethodExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxPaymentMethod record);

    int insertSelective(XxPaymentMethod record);

    List<XxPaymentMethod> selectByExampleWithBLOBs(XxPaymentMethodExample example);

    List<XxPaymentMethod> selectByExample(XxPaymentMethodExample example);

    XxPaymentMethod selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxPaymentMethod record, @Param("example") XxPaymentMethodExample example);

    int updateByExampleWithBLOBs(@Param("record") XxPaymentMethod record, @Param("example") XxPaymentMethodExample example);

    int updateByExample(@Param("record") XxPaymentMethod record, @Param("example") XxPaymentMethodExample example);

    int updateByPrimaryKeySelective(XxPaymentMethod record);

    int updateByPrimaryKeyWithBLOBs(XxPaymentMethod record);

    int updateByPrimaryKey(XxPaymentMethod record);
}