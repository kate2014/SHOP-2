package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.entity.XxAttribute;
import com.shop.entity.XxAttributeExample;

public interface XxAttributeMapper {
    int countByExample(XxAttributeExample example);

    int deleteByExample(XxAttributeExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxAttribute record);

    int insertSelective(XxAttribute record);

    List<XxAttribute> selectByExample(XxAttributeExample example);

    XxAttribute selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxAttribute record, @Param("example") XxAttributeExample example);

    int updateByExample(@Param("record") XxAttribute record, @Param("example") XxAttributeExample example);

    int updateByPrimaryKeySelective(XxAttribute record);

    int updateByPrimaryKey(XxAttribute record);
    
    List<XxAttribute> selectAll();
    
    int insertAttribute(XxAttribute xxAttribute);
    
    int getAll();
    
    XxAttribute selectOne(Long id);
    
    int deleteById(Long id);

	List<XxAttribute> selectById(Long id);

}