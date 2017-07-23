package com.shop.service.backstage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxMemberRankMapper;
import com.shop.entity.XxMemberRank;
import com.shop.entity.XxMemberRankExample;

/**
 * 会员等级
 * @author Administrator
 *
 */
@Service
public class MemberRankServiceImpl implements MemberRankService {
  @Autowired 
     XxMemberRankMapper memberRankmaper;
   XxMemberRankExample example;
	@Override
	public List<XxMemberRank> find() {
		
		List<XxMemberRank> memberrank=memberRankmaper.selectByExample(new XxMemberRankExample());
		return memberrank;
	}
	@Override
	public void insert(XxMemberRank memberrank) {
		memberRankmaper.insert(memberrank);
		
	}
	@Override
	public void update(XxMemberRank memberrank) {
		memberRankmaper.updateByPrimaryKeySelective(memberrank);
		
	}
	@Override
	public void delete(XxMemberRank memberrank) {
		
		
	}
	@Override
	public XxMemberRank findidByid(Long id) {
		return memberRankmaper.selectByPrimaryKey(id);
	}
	

	

}
