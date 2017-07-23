package com.shop.dao;

import com.shop.entity.XxCouponCode;
import com.shop.entity.XxCouponCodeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxCouponCodeMapper {
    int countByExample(XxCouponCodeExample example);

    int deleteByExample(XxCouponCodeExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxCouponCode record);

    int insertSelective(XxCouponCode record);

    List<XxCouponCode> selectByExample(XxCouponCodeExample example);

    XxCouponCode selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxCouponCode record, @Param("example") XxCouponCodeExample example);

    int updateByExample(@Param("record") XxCouponCode record, @Param("example") XxCouponCodeExample example);

    int updateByPrimaryKeySelective(XxCouponCode record);

    int updateByPrimaryKey(XxCouponCode record);
}