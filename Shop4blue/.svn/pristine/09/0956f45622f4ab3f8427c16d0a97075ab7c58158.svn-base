package com.shop.service.backstage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxAdminMapper;
import com.shop.entity.XxAdmin;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
    XxAdminMapper adminMapper;
	@Override
	public XxAdmin login(XxAdmin ad){
		XxAdmin admin = adminMapper.findByLogin(ad);
		return admin;
	}
	@Override
	public void updateLogindate(XxAdmin ad) {
		adminMapper.updateByPrimaryKeySelective(ad);
		
	}
	
}
