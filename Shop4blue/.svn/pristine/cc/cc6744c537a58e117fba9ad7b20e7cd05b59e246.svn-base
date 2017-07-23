package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.entity.XxDeposit;
import com.shop.entity.XxDepositExample;

public interface XxDepositMapper {
    int countByExample(XxDepositExample example);

    int deleteByExample(XxDepositExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxDeposit record);

    int insertSelective(XxDeposit record);

    List<XxDeposit> selectByExample(XxDepositExample example);

    XxDeposit selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxDeposit record, @Param("example") XxDepositExample example);

    int updateByExample(@Param("record") XxDeposit record, @Param("example") XxDepositExample example);

    int updateByPrimaryKeySelective(XxDeposit record);

    int updateByPrimaryKey(XxDeposit record);
    
    List<XxDeposit> selectById(Long id);
    
    int addById(Map<String,Object> map);
}