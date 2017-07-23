package com.shop.dao;

import com.shop.entity.XxTag;
import com.shop.entity.XxTagExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxTagMapper {
    int countByExample(XxTagExample example);

    int deleteByExample(XxTagExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxTag record);

    int insertSelective(XxTag record);

    List<XxTag> selectByExample(XxTagExample example);

    XxTag selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxTag record, @Param("example") XxTagExample example);

    int updateByExample(@Param("record") XxTag record, @Param("example") XxTagExample example);

    int updateByPrimaryKeySelective(XxTag record);

    int updateByPrimaryKey(XxTag record);
}