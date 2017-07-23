package com.shop.service.websevice;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.XxAreaMapper;
import com.shop.dao.XxMemberMapper;
import com.shop.entity.XxArea;
import com.shop.entity.XxMember;
@Service
public class PersonalAndUpdatePassServiceImpl implements PersonalAndUpdatePassService {

	@Resource
	XxMemberMapper xxMemberMapper;
	@Resource
	XxAreaMapper xxAreaMapper;
	@Override
	public XxMember getById(Long userid) {
		return xxMemberMapper.selectByPrimaryKey(userid);
	}
	@Override
	public String getTreepath(Long area) {
		XxArea x=xxAreaMapper.selcetById(area);
		return x.getTreePath();
	}
	@Override
	public void updatem(XxMember xx) {
		xxMemberMapper.updateByPrimaryKeySelective(xx);
	}

}
