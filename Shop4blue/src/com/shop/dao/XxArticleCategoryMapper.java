package com.shop.dao;

import com.shop.entity.XxArticleCategory;
import com.shop.entity.XxArticleCategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxArticleCategoryMapper {
    int countByExample(XxArticleCategoryExample example);

    int deleteByExample(XxArticleCategoryExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxArticleCategory record);

    int insertSelective(XxArticleCategory record);

    List<XxArticleCategory> selectByExample(XxArticleCategoryExample example);

    XxArticleCategory selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxArticleCategory record, @Param("example") XxArticleCategoryExample example);

    int updateByExample(@Param("record") XxArticleCategory record, @Param("example") XxArticleCategoryExample example);

    int updateByPrimaryKeySelective(XxArticleCategory record);

    int updateByPrimaryKey(XxArticleCategory record);
}