package com.shop.dao;

import com.shop.entity.XxMessage;
import com.shop.entity.XxMessageExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XxMessageMapper {
    int countByExample(XxMessageExample example);

    int deleteByExample(XxMessageExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxMessage record);

    int insertSelective(XxMessage record);

    List<XxMessage> selectByExampleWithBLOBs(XxMessageExample example);

    List<XxMessage> selectByExample(XxMessageExample example);

    XxMessage selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxMessage record, @Param("example") XxMessageExample example);

    int updateByExampleWithBLOBs(@Param("record") XxMessage record, @Param("example") XxMessageExample example);

    int updateByExample(@Param("record") XxMessage record, @Param("example") XxMessageExample example);

    int updateByPrimaryKeySelective(XxMessage record);

    int updateByPrimaryKeyWithBLOBs(XxMessage record);

    int updateByPrimaryKey(XxMessage record);

	List<XxMessage> selectByIp(String ip);


	List<XxMessage> selectById(Map map);

	Long selectRecriver(String content);

	Long getreceiverid(String content);

	List<XxMessage> selectreceiver(Long id);

	String findusername(Long id);

	List<XxMessage> finddraft(Long id);

	XxMessage findbyforward(Long id);
}