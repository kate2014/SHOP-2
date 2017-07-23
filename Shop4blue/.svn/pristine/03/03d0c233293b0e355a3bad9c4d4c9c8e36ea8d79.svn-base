package com.shop.dao;

import com.shop.entity.XxProductTagExample;
import com.shop.entity.XxProductTagKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxProductTagMapper {
    int countByExample(XxProductTagExample example);

    int deleteByExample(XxProductTagExample example);

    int deleteByPrimaryKey(XxProductTagKey key);

    int insert(XxProductTagKey record);

    int insertSelective(XxProductTagKey record);

    List<XxProductTagKey> selectByExample(XxProductTagExample example);

    int updateByExampleSelective(@Param("record") XxProductTagKey record, @Param("example") XxProductTagExample example);

    int updateByExample(@Param("record") XxProductTagKey record, @Param("example") XxProductTagExample example);
}