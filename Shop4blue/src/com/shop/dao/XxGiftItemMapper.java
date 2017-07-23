package com.shop.dao;

import com.shop.entity.XxGiftItem;
import com.shop.entity.XxGiftItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxGiftItemMapper {
    int countByExample(XxGiftItemExample example);

    int deleteByExample(XxGiftItemExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxGiftItem record);

    int insertSelective(XxGiftItem record);

    List<XxGiftItem> selectByExample(XxGiftItemExample example);

    XxGiftItem selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxGiftItem record, @Param("example") XxGiftItemExample example);

    int updateByExample(@Param("record") XxGiftItem record, @Param("example") XxGiftItemExample example);

    int updateByPrimaryKeySelective(XxGiftItem record);

    int updateByPrimaryKey(XxGiftItem record);
}