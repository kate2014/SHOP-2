package com.shop.dao;

import com.shop.entity.XxArticleTagExample;
import com.shop.entity.XxArticleTagKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxArticleTagMapper {
    int countByExample(XxArticleTagExample example);

    int deleteByExample(XxArticleTagExample example);

    int deleteByPrimaryKey(XxArticleTagKey key);

    int insert(XxArticleTagKey record);

    int insertSelective(XxArticleTagKey record);

    List<XxArticleTagKey> selectByExample(XxArticleTagExample example);

    int updateByExampleSelective(@Param("record") XxArticleTagKey record, @Param("example") XxArticleTagExample example);

    int updateByExample(@Param("record") XxArticleTagKey record, @Param("example") XxArticleTagExample example);
}