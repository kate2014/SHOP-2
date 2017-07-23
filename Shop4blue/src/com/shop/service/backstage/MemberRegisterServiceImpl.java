package com.shop.service.backstage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.XxMemberAttributeMapper;
import com.shop.dao.XxMemberAttributeOptionMapper;
import com.shop.dao.XxMemberMapper;
import com.shop.entity.XxMember;
import com.shop.entity.XxMemberAttribute;
import com.shop.entity.XxMemberAttributeExample;
import com.shop.entity.XxMemberAttributeOption;
import com.shop.entity.XxMemberExample;

@Service
public class MemberRegisterServiceImpl implements MemberRegisterService {

	@Resource
	private XxMemberAttributeMapper xmam;
	@Resource
	private XxMemberAttributeOptionMapper xmaom; 
	@Resource
	private XxMemberMapper xmm;
	@Override
	public List<XxMemberAttribute> getAll() {
		List<XxMemberAttribute> list=xmam.getAll();
		System.out.println(list);
		return list;
	}
	@Override
	public XxMemberAttribute getById(long id) {
		XxMemberAttribute xma=xmam.selectByPrimaryKey(id);
		return xma;
	}
	@Override
	public void updateEdit(XxMemberAttribute xma) {
		xmam.updateByPrimaryKeySelective(xma);
		
	}
	@Override
	public void intsert(XxMemberAttribute xma) {
		xmam.insertSelective(xma);
	}
	@Override
	public int getIndex() {
		List<Map<String,Object>> list=xmam.getIndex();
		int id=0;
		for(Map<String,Object> map:list){
			if(id!=Integer.parseInt(String.valueOf(map.get("property_index")))){
				break;
			}
			id++;
		}
		return id;
	}
	@Override
	public void inserttt(XxMemberAttributeOption xmao) {
		xmaom.insertSelective(xmao);
		
	}
	@Override
	public void delmr(Long a[]) {
		for(long i:a){
		xmam.deleteByPrimaryKey(i);
		}
	}
	@Override
	public void delmrOptions(Long[] a) {
		for(long i:a){
			xmaom.deleteById(i);
			}
	}
	@Override
	public void delm(Integer i) {
		System.out.println("----------------------------");
		List<XxMember> list=xmm.selectByExample(new XxMemberExample());
		for(XxMember x:list){
		    if(i==0) x.setAttributeValue0(null);
			else if(i==1) x.setAttributeValue1(null);
			else if(i==2) x.setAttributeValue2(null);
			else if(i==3) x.setAttributeValue3(null);
			else if(i==4) x.setAttributeValue4(null);
			else if(i==5) x.setAttributeValue5(null);
			else if(i==6) x.setAttributeValue6(null);
			else if(i==7) x.setAttributeValue7(null);
			else if(i==8) x.setAttributeValue8(null);
			else if(i==9) x.setAttributeValue9(null);
			xmm.updateByPrimaryKey(x);
		}
		
	}

}
