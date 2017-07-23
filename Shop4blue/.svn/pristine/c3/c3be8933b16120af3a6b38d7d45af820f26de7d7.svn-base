package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.entity.XxProductNotify;
import com.shop.entity.XxProductNotifyExample;

public interface XxProductNotifyMapper {
    int countByExample(XxProductNotifyExample example);

    int deleteByExample(XxProductNotifyExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxProductNotify record);

    int insertSelective(XxProductNotify record);

    List<XxProductNotify> selectByExample(XxProductNotifyExample example);

    XxProductNotify selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxProductNotify record, @Param("example") XxProductNotifyExample example);

    int updateByExample(@Param("record") XxProductNotify record, @Param("example") XxProductNotifyExample example);

    int updateByPrimaryKeySelective(XxProductNotify record);

    int updateByPrimaryKey(XxProductNotify record);
    
    List<XxProductNotify> getAll(Map<String,Object> map);
    
    List<XxProductNotify>  webSelectAll(Long userid);
    
    int getCount(Long userid);
}