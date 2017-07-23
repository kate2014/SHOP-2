package com.shop.service.websevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxReceiverMapper;
import com.shop.dao.XxReviewMapper;
import com.shop.entity.XxReview;

@Service
public class MemberCommentServiceImpl implements MemberCommentService {

	@Autowired
	XxReviewMapper xxReviewMapper;
	
	@Override
	public List<XxReview> getById(Long id) {
		List<XxReview> list=xxReviewMapper.getById(id);
		return list;
	}

}
