package com.shop.dao;

import com.shop.entity.XxPayment;
import com.shop.entity.XxPaymentExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XxPaymentMapper {
    int countByExample(XxPaymentExample example);

    int deleteByExample(XxPaymentExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxPayment record);

    int insertSelective(XxPayment record);

    List<XxPayment> selectByExample(XxPaymentExample example);

    XxPayment selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxPayment record, @Param("example") XxPaymentExample example);

    int updateByExample(@Param("record") XxPayment record, @Param("example") XxPaymentExample example);

    int updateByPrimaryKeySelective(XxPayment record);

    int updateByPrimaryKey(XxPayment record);

	List<Map<String, Object>> selectByCount(Map<String, Object> map);
	
	List<XxPayment> findPaymentByOrderId(Long id);
}