package com.shop.dao;

import com.shop.entity.XxPromotionBrandExample;
import com.shop.entity.XxPromotionBrandKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxPromotionBrandMapper {
    int countByExample(XxPromotionBrandExample example);

    int deleteByExample(XxPromotionBrandExample example);

    int deleteByPrimaryKey(XxPromotionBrandKey key);

    int insert(XxPromotionBrandKey record);

    int insertSelective(XxPromotionBrandKey record);

    List<XxPromotionBrandKey> selectByExample(XxPromotionBrandExample example);

    int updateByExampleSelective(@Param("record") XxPromotionBrandKey record, @Param("example") XxPromotionBrandExample example);

    int updateByExample(@Param("record") XxPromotionBrandKey record, @Param("example") XxPromotionBrandExample example);
}