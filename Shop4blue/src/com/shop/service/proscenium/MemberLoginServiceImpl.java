package com.shop.service.proscenium;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxMemberMapper;
import com.shop.entity.XxMember;

@Service
public class MemberLoginServiceImpl implements MemberLoginService {

	@Autowired
	XxMemberMapper xmm;
	@Override
	public List<String> selectAllName() {
		List<String> list=xmm.seleAllName();
		return list;
	}
	@Override
	public XxMember selByNameAndPass(String username, String password) {
		XxMember xm=xmm.seleByNameAndPass(username,password);
		return xm;
	}
	@Override
	public XxMember selByUserName(String username) {
		XxMember xm=xmm.selByuserName(username);
		return xm;
	}
	@Override
	public List<XxMember> selByEmail(String email) {
		List<XxMember> xm=xmm.selByEmail(email);
		return xm;
	}
	@Override
	public void insertMember(XxMember xm) {
		xmm.insert(xm);
		
	}
	@Override
	public void updateMemberById(XxMember record) {
		xmm.updateByPrimaryKeySelective(record);
	}

}
