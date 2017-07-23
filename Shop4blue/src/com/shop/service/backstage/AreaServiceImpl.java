package com.shop.service.backstage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxAreaMapper;
import com.shop.entity.XxArea;

@Service
public class AreaServiceImpl implements AreaService {
	@Autowired
	XxAreaMapper areaMapper;

	@Override
	public List<XxArea> findRoots() {
		return areaMapper.selectRoots();
	}

	@Override
	public XxArea find(Long id) {
		return areaMapper.selcetById(id);
	}

}
