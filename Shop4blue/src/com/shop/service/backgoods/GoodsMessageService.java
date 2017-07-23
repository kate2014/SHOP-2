package com.shop.service.backgoods;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxProductNotify;

public interface GoodsMessageService {
	
	public List<XxProductNotify> getAll(Map<String,Object> map);

	public int selectcount();

	public void sendMessage(Long long1);

	public void insert(Long productId, String email, Long userid);
	
	public XxProductNotify findProductNotifyById(Long id);

}
