package com.shop.service.backstage;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxReview;

public interface CommentService {

	public List<Map<String,Object>> getAllComment(int pages,int rowss,String type);
	
	public int selectCount();
	
	public XxReview selectByPrimaryKey(Long id);
	
	public int editerComment(XxReview xxReview);
	
	public int deleteByPrimarykey(Long id);
}
