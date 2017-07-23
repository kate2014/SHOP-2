package com.shop.service.websevice;

import java.util.List;

import com.shop.entity.XxReview;

public interface MemberCommentService {

	List<XxReview> getById(Long id);
}
