package com.shop.dao;

import com.shop.entity.XxAdmin;
import com.shop.entity.XxAdminExample;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxAdminMapper {
    int countByExample(XxAdminExample example);

    int deleteByExample(XxAdminExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxAdmin record);

    int insertSelective(XxAdmin record);

    List<XxAdmin> selectByExample(XxAdminExample example);

    XxAdmin selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxAdmin record, @Param("example") XxAdminExample example);

    int updateByExample(@Param("record") XxAdmin record, @Param("example") XxAdminExample example);

    int updateByPrimaryKeySelective(XxAdmin record);

    int updateByPrimaryKey(XxAdmin record);

	XxAdmin findByLogin(XxAdmin record);

	Date selectLoginDate(XxAdmin admin);
}