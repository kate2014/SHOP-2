package com.shop.service.websevice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxReceiverMapper;
import com.shop.entity.XxReceiver;

/**
 * @author ddj
 *
 */
@Service
public class MemberPreServiceImpl implements MemberPreService {
	@Autowired
	XxReceiverMapper receiverMapper;
	
	@Override
	public void updateReceiverDefaultByMemberId(Long id) {
		receiverMapper.updateReceiverDefaultByMemberId(id);
	}

	@Override
	public XxReceiver findReceiverById(Long id) {
		return receiverMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateReceiverById(XxReceiver receiver) {
		receiverMapper.updateByPrimaryKeySelective(receiver);
	}

	@Override
	public void deleteReceiver(Long id) {
		receiverMapper.deleteByPrimaryKey(id);
	}
	
}
