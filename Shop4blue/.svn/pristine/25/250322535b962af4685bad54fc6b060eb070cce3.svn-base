package com.shop.service.backstage;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.UtilsMapper;

@Service
public class UtilsServiceImpl implements UtilsService {
	
	@Autowired
	UtilsMapper utilsMapper;

	@Override
	public <T> void deleteByIds(String ids, Class<T> clazz, String id) {
		String s = clazz.getSimpleName();
		StringBuilder sb=new StringBuilder();
		sb.append(s.charAt(0));
		for(int i=1;i<s.length();i++){
			if(s.charAt(i)>='A'&&s.charAt(i)<='Z'){
				sb.append("_");
			}
			sb.append(s.charAt(i));
		}
		Map<String,Object> map = new HashMap<>();
		map.put("ids", ids);
		map.put("name", sb.toString());
		map.put("id", id);
		utilsMapper.deleteById(map);
		
	}

	@Override
	public <T> void deleteByUpdate(String ids, Class<T> clazz, String id) {
		String s = clazz.getSimpleName();
		StringBuilder sb=new StringBuilder();
		sb.append(s.charAt(0));
		for(int i=1;i<s.length();i++){
			if(s.charAt(i)>='A'&&s.charAt(i)<='Z'){
				sb.append("_");
			}
			sb.append(s.charAt(i));
		}
		Map<String,Object> map = new HashMap<>();
		map.put("ids", ids);
		map.put("name", sb.toString());
		map.put("id", id);
		utilsMapper.deleteByUpdate(map);
		
	}
	
	

}
