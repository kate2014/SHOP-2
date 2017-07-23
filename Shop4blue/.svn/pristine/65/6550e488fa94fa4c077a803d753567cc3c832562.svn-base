package com.shop.dao;

import com.shop.entity.XxProductCategoryBrandExample;
import com.shop.entity.XxProductCategoryBrandKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxProductCategoryBrandMapper {
    int countByExample(XxProductCategoryBrandExample example);

    int deleteByExample(XxProductCategoryBrandExample example);

    int deleteByPrimaryKey(XxProductCategoryBrandKey key);

    int insert(XxProductCategoryBrandKey record);

    int insertSelective(XxProductCategoryBrandKey record);

    List<XxProductCategoryBrandKey> selectByExample(XxProductCategoryBrandExample example);

    int updateByExampleSelective(@Param("record") XxProductCategoryBrandKey record, @Param("example") XxProductCategoryBrandExample example);

    int updateByExample(@Param("record") XxProductCategoryBrandKey record, @Param("example") XxProductCategoryBrandExample example);
    
    List<Long> getBrands(long id);

}