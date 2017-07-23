package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.entity.XxMemberAttribute;
import com.shop.entity.XxMemberAttributeExample;

public interface XxMemberAttributeMapper {
    int countByExample(XxMemberAttributeExample example);

    int deleteByExample(XxMemberAttributeExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxMemberAttribute record);

    int insertSelective(XxMemberAttribute record);

    List<XxMemberAttribute> selectByExample(XxMemberAttributeExample example);

    XxMemberAttribute selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxMemberAttribute record, @Param("example") XxMemberAttributeExample example);

    int updateByExample(@Param("record") XxMemberAttribute record, @Param("example") XxMemberAttributeExample example);

    int updateByPrimaryKeySelective(XxMemberAttribute record);

    int updateByPrimaryKey(XxMemberAttribute record);
    
    List<Map<String,Object>> getIndex();
    
    List<XxMemberAttribute>  getAll();
}