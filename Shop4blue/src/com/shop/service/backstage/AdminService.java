package com.shop.service.backstage;

import java.util.Date;

import com.shop.entity.XxAdmin;

public interface AdminService {
	
	public void updatePassword(XxAdmin admin);
	
	public Date selectLoginDate(XxAdmin admin);

}
