package com.shop.controller.webcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.XxReview;
import com.shop.service.websevice.MemberCommentService;

@Controller
@RequestMapping("sppl")
public class MemberCommentController {
	
	@Autowired
	MemberCommentService memberCommentService;
	
	@RequestMapping("toSppl")
	public String toSppl(Long id,Model model){
		List<XxReview> list=memberCommentService.getById(id);
		model.addAttribute("list",list);
		return "shop/personalcenter/商品评论";
	}
}
