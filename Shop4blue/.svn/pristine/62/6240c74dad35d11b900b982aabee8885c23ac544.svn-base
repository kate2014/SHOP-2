package com.shop.dao;

import com.shop.entity.XxConsultation;
import com.shop.entity.XxConsultationExample;
import com.shop.entity.XxProduct;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XxConsultationMapper {
    int countByExample(XxConsultationExample example);

    int deleteByExample(XxConsultationExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxConsultation record);

    int insertSelective(XxConsultation record);

    List<XxConsultation> selectByExample(XxConsultationExample example);

    XxConsultation selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxConsultation record, @Param("example") XxConsultationExample example);

    int updateByExample(@Param("record") XxConsultation record, @Param("example") XxConsultationExample example);

    int updateByPrimaryKeySelective(XxConsultation record);

    int updateByPrimaryKey(XxConsultation record);

	List<Map<String, Object>> selectConsult(int i, int num);

	String selProNameById(int proId);

	Map<String, Object> selectById(Long id);

	List<Map<String, Object>> selReplyById(Long id);

	void updateIsShowById(Long long1, Boolean isShow);

	void insertReply(XxConsultation xx);

	int selectNum();

	void delByIds(int[] ids);

	
}