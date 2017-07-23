package com.shop.dao;

import com.shop.entity.XxProductParameterValue;
import com.shop.entity.XxProductParameterValueExample;
import com.shop.entity.XxProductParameterValueKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxProductParameterValueMapper {
    int countByExample(XxProductParameterValueExample example);

    int deleteByExample(XxProductParameterValueExample example);

    int deleteByPrimaryKey(XxProductParameterValueKey key);

    int insert(XxProductParameterValue record);

    int insertSelective(XxProductParameterValue record);

    List<XxProductParameterValue> selectByExample(XxProductParameterValueExample example);

    XxProductParameterValue selectByPrimaryKey(XxProductParameterValueKey key);

    int updateByExampleSelective(@Param("record") XxProductParameterValue record, @Param("example") XxProductParameterValueExample example);

    int updateByExample(@Param("record") XxProductParameterValue record, @Param("example") XxProductParameterValueExample example);

    int updateByPrimaryKeySelective(XxProductParameterValue record);

    int updateByPrimaryKey(XxProductParameterValue record);
    
    List<XxProductParameterValue> selectParameterAndValue(Long id);
}