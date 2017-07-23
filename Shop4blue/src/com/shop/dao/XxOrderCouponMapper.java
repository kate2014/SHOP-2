package com.shop.dao;

import com.shop.entity.XxOrderCoupon;
import com.shop.entity.XxOrderCouponExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxOrderCouponMapper {
    int countByExample(XxOrderCouponExample example);

    int deleteByExample(XxOrderCouponExample example);

    int insert(XxOrderCoupon record);

    int insertSelective(XxOrderCoupon record);

    List<XxOrderCoupon> selectByExample(XxOrderCouponExample example);

    int updateByExampleSelective(@Param("record") XxOrderCoupon record, @Param("example") XxOrderCouponExample example);

    int updateByExample(@Param("record") XxOrderCoupon record, @Param("example") XxOrderCouponExample example);
}