package com.shop.service.backstage;

import java.util.List;

import com.shop.entity.XxMemberAttribute;
import com.shop.entity.XxMemberAttributeOption;


public interface MemberRegisterService {
	
	public List<XxMemberAttribute> getAll();
	
	public XxMemberAttribute getById(long id);
	
	public void updateEdit(XxMemberAttribute xma);
	
	public void intsert(XxMemberAttribute xma);
	
	public int getIndex();
	
	public void inserttt(XxMemberAttributeOption xmao);
	
	public void delmr(Long[] a);
	
	public void delmrOptions(Long[] a);
	
	public void delm(Integer i);

}
