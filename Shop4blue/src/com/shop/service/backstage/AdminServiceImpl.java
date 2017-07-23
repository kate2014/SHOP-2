package com.shop.service.backstage;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxAdminMapper;
import com.shop.entity.XxAdmin;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	XxAdminMapper adminMapper;

	@Override
	public void updatePassword(XxAdmin admin) {
		adminMapper.updateByPrimaryKeySelective(admin);
	}

	@Override
	public Date selectLoginDate(XxAdmin admin) {
		Date date = adminMapper.selectLoginDate(admin);
		return date;
	}

}
