package com.shop.dao;

import com.shop.entity.XxOrder;
import com.shop.entity.XxOrderExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XxOrderMapper {
    int countByExample(XxOrderExample example);

    int deleteByExample(XxOrderExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxOrder record);

    int insertSelective(XxOrder record);

    List<XxOrder> selectByExample(XxOrderExample example);

    XxOrder selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxOrder record, @Param("example") XxOrderExample example);

    int updateByExample(@Param("record") XxOrder record, @Param("example") XxOrderExample example);

    int updateByPrimaryKeySelective(XxOrder record);

    int updateByPrimaryKey(XxOrder record);
    
    List<XxOrder> findAll(Map<String,Object> map);
    
    int getTotalNum(Map<String,Object> map);
    
    XxOrder findById(Long id);
    
    List<XxOrder> getAllByMember(Long member);
    
    /**
     * 根据编号查订单
     * @param sn
     * @return
     */
    XxOrder findOrderBySn(String sn);
}