package com.shop.service.websevice;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxMember;
import com.shop.entity.XxMessage;

public interface SendMessageService {

	void getMessage(XxMessage xxmessage);


	List<XxMessage> selectById(Map map);


	Long getReceiver(String content);


	List<XxMessage> find();


	Long getReceicer(String content);


	List<XxMessage> getreceiver(Long id);


	XxMessage findbyid(Long id);


	String findusername(Long id);


	List<XxMessage> finddraft(Long id);


	void update(XxMessage message);
	
	XxMessage findByForwardId(Long id);

}
