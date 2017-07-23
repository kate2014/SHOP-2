package com.shop.service.backstage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxConsultationMapper;
import com.shop.entity.XxConsultation;
import com.shop.entity.XxProduct;

/**
 * 咨询管理Service
 * @author Administrator
 *
 */
@Service
public class ConsultServiceImpl implements ConsultService {

	@Autowired
	XxConsultationMapper xcm;
	//����id��ѯһ����ѯ
	@Override
	public Map<String, Object> selById(Long id) {
		Map<String, Object>  x=xcm.selectById(id);
		//System.out.println(x);
		return x;
	}

	@Override
	public List<Map<String,Object>> selConsult(int index, int num) {
		List<Map<String,Object>> list=xcm.selectConsult((index-1)*num,num);
		return list;
	}

	//ͨ��id��ѯproduct
	@Override
	public String getProductById(int proId) {
		String proName=xcm.selProNameById(proId);
		return proName;
	}

	@Override
	public List<Map<String, Object>> selReplybyId(Long id) {
		List<Map<String,Object>> list=xcm.selReplyById(id);
		return list;
	}

	@Override
	public void delById(Long id) {
		xcm.deleteByPrimaryKey(id);
	}

	@Override
	public void updateIsShow(Long long1, Boolean isShow) {
		xcm.updateIsShowById(long1,isShow);
		
	}

	@Override
	public void insertReply(XxConsultation xx) {
		xcm.insertReply(xx);
		
	}

	@Override
	public int selectNum() {
		
		return xcm.selectNum();
	}

	@Override
	public void delMessByIds(int[] ids) {
		xcm.delByIds(ids);
		
	}

	

}
