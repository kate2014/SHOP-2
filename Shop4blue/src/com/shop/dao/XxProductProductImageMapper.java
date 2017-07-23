package com.shop.dao;

import com.shop.entity.XxProductProductImage;
import com.shop.entity.XxProductProductImageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxProductProductImageMapper {
    int countByExample(XxProductProductImageExample example);

    int deleteByExample(XxProductProductImageExample example);

    int insert(XxProductProductImage record);

    int insertSelective(XxProductProductImage record);

    List<XxProductProductImage> selectByExample(XxProductProductImageExample example);

    int updateByExampleSelective(@Param("record") XxProductProductImage record, @Param("example") XxProductProductImageExample example);

    int updateByExample(@Param("record") XxProductProductImage record, @Param("example") XxProductProductImageExample example);

    List<XxProductProductImage> findProductImageByProductId(Long id);
}