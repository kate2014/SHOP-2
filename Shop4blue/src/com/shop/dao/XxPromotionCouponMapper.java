package com.shop.dao;

import com.shop.entity.XxPromotionCouponExample;
import com.shop.entity.XxPromotionCouponKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxPromotionCouponMapper {
    int countByExample(XxPromotionCouponExample example);

    int deleteByExample(XxPromotionCouponExample example);

    int deleteByPrimaryKey(XxPromotionCouponKey key);

    int insert(XxPromotionCouponKey record);

    int insertSelective(XxPromotionCouponKey record);

    List<XxPromotionCouponKey> selectByExample(XxPromotionCouponExample example);

    int updateByExampleSelective(@Param("record") XxPromotionCouponKey record, @Param("example") XxPromotionCouponExample example);

    int updateByExample(@Param("record") XxPromotionCouponKey record, @Param("example") XxPromotionCouponExample example);
}