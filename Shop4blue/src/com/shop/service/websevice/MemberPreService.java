package com.shop.service.websevice;

import com.shop.entity.XxReceiver;

public interface MemberPreService {
	/**
	 * 收获地址清空默认
	 * @param id
	 */
	public void updateReceiverDefaultByMemberId(Long id);	

	/**
	 * 根据主键查收获地址
	 * @param id
	 * @return
	 */
	public XxReceiver findReceiverById(Long id);
	
	/**
	 * 根据主键更新收获地址
	 */
	public void updateReceiverById(XxReceiver receiver);
	
	/**
	 * 根据主键删除收获地址
	 * @param id
	 */
	public void deleteReceiver(Long id);
}
