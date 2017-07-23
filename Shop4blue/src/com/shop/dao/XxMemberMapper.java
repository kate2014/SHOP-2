package com.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.entity.XxMember;
import com.shop.entity.XxMemberExample;
import com.shop.entity.XxMemberRank;

public interface XxMemberMapper {
    int countByExample(XxMemberExample example);

    int deleteByExample(XxMemberExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxMember record);

    int insertSelective(XxMember record);

    List<XxMember> selectByExample(XxMemberExample example);

    XxMember selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxMember record, @Param("example") XxMemberExample example);

    int updateByExample(@Param("record") XxMember record, @Param("example") XxMemberExample example);

    int updateByPrimaryKeySelective(XxMember record);

    int updateByPrimaryKey(XxMember record);
    /**
     * Author wzw
     * ���沿�� �Ƿ������ɵ�
     * �������Լ�д��
     * ���ݴ����Ĳ�����ѯ  ��Ա�� ��Ա�ȼ���
     */
    List<Map<String,Object>> selectMemberByTag(Map<String,Object> map);

	HashMap<String, Object> selectMemberCount();

	void updateBanlance(Map<String, Object> map);

	void updatePoint(Map<String, Object> map);

	List<Map<String,Object>> selectById(long id);

	Long selectArea(String treePath);

	List<String> seleAllName();

	XxMember seleByNameAndPass(String username, String password);

	XxMember selByuserName(String username);

	List<XxMember> selByEmail(String email);

	List<XxMemberRank> selectAllRank();
    
    
    
    
}