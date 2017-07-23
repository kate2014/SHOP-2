package com.shop.dao;

import com.shop.entity.XxParameter;
import com.shop.entity.XxParameterExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxParameterMapper {
    int countByExample(XxParameterExample example);

    int deleteByExample(XxParameterExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxParameter record);

    int insertSelective(XxParameter record);

    List<XxParameter> selectByExample(XxParameterExample example);

    XxParameter selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxParameter record, @Param("example") XxParameterExample example);

    int updateByExample(@Param("record") XxParameter record, @Param("example") XxParameterExample example);

    int updateByPrimaryKeySelective(XxParameter record);

    int updateByPrimaryKey(XxParameter record);
}