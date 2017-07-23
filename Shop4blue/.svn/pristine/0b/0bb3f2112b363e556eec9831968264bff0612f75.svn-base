package com.shop.controller.webcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.XxDeposit;
import com.shop.service.websevice.DepositService;

@Controller
@RequestMapping("yck")
public class DepositController {

	@Autowired
	DepositService depositService;
	
	@RequestMapping("toYckCz")
	public String toYck(Long id,Model model){
		List<XxDeposit> list=depositService.getById(id);
		model.addAttribute("list",list);
		return "shop/personalcenter/预存款充值";
	}
	@RequestMapping("toMyYck")
	public String toMyYck(Long id,Model model){
		List<XxDeposit> list=depositService.getById(id);
		model.addAttribute("list",list);
		return "shop/personalcenter/我的预存款";
	}
	@RequestMapping("chargeType")
	public String choiceChargeType(Long id,double amount){
		System.err.println(id+"==="+amount);
		Map<String,Object> map=new HashMap<>();
		map.put("id", id);
		map.put("amount", amount);
		depositService.addById(map);
		return "shop/personalcenter/充值成功页面";
	}
}
