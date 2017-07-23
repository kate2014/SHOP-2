package com.shop.service.websevice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxMessageMapper;
import com.shop.entity.XxMember;
import com.shop.entity.XxMessage;
import com.shop.entity.XxMessageExample;
@Service
public class SendMessageServiceImpl implements SendMessageService{
	@Autowired XxMessageMapper message;

	@Override
	public void getMessage(XxMessage xxmessage) {
		message.insert(xxmessage);
	}

	@Override
	public List<XxMessage> selectById(Map map) {

		List<XxMessage> list=message.selectById(map);
		return list;
	}

	@Override
	public Long getReceiver(String content) {
		Long receiver=message.selectRecriver(content);
		return receiver;
	}

	@Override
	public List<XxMessage> find() {
        List<XxMessage> xxmessage=message.selectByExample(new XxMessageExample());
		return xxmessage;
	}

	@Override
	public Long getReceicer(String content) {
		Long Receiverid=message.getreceiverid(content);
		return Receiverid;
	}

	@Override
	public List<XxMessage> getreceiver(Long id) {
		List<XxMessage> xxmessage=message.selectreceiver(id);
		return xxmessage;
	}

	@Override
	public XxMessage findbyid(Long id) {
		XxMessage xxmessage=message.selectByPrimaryKey(id);
		return xxmessage;
	}

	@Override
	public String findusername(Long id) {
		String username=message.findusername(id);
		return username;
	}

	@Override
	public List<XxMessage> finddraft(Long id) {
		List<XxMessage> list=message.finddraft(id);
		return list;
	}

	@Override
	public void update(XxMessage messag) {
		message.updateByPrimaryKeyWithBLOBs(messag);
		
	}

	@Override
	public XxMessage findByForwardId(Long id) {
		XxMessage xxmessage=message.findbyforward(id);
		return xxmessage;
	}



}
