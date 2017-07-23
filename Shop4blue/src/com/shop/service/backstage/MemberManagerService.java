package com.shop.service.backstage;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxMember;
import com.shop.entity.XxMemberRank;

public interface MemberManagerService {
        public List<Map<String,Object>> getMember(Map<String,Object> map);

		public void saveMember(XxMember xm);
		public int selectMemberCount();

		public void delByIds(Long[] a);

		public List<Map<String,Object>> selectMemberById(long parseLong);

		public void updateMember(XxMember xm);

		public void updateOneConlum(Long changebalance1, Long long1);
		
		public void updatePoint(Long changePoint1, Long id);

		public XxMember selectMembermById(long parseLong);

		public Long selectAreaByTreePath(String treePath);

		public List<XxMemberRank> selectAllLevel();
}
