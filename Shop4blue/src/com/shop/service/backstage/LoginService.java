package com.shop.service.backstage;

import com.shop.entity.XxAdmin;

public interface LoginService {
	
	public XxAdmin login(XxAdmin ad);
	
	public void updateLogindate(XxAdmin ad);

}
