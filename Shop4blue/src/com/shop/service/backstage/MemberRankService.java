package com.shop.service.backstage;

import java.util.List;

import com.shop.entity.XxAdmin;
import com.shop.entity.XxMemberRank;

public interface MemberRankService {

	public List<XxMemberRank>  find();
	public void insert(XxMemberRank memberrank);
	public void update(XxMemberRank memberrank);
	public void delete(XxMemberRank memberrank);
	public XxMemberRank findidByid(Long id);
	
}
