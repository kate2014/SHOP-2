package com.shop.service.proscenium;

import java.util.List;

import com.shop.entity.XxMember;

public interface MemberLoginService {

	List<String> selectAllName();

	XxMember selByNameAndPass(String username, String password);

	XxMember selByUserName(String username);

	List<XxMember> selByEmail(String email);

	void insertMember(XxMember xm);
	
	void updateMemberById(XxMember record);

}
