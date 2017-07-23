package com.shop.controller.backorder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders")
public class Order4BackController {
	
	@RequestMapping("/toorder")
	public String toOrder(){
		return "backstage/order/order";
	}
	
	@RequestMapping("/toordermanage")
	public String toManage(){
		return "backstage/order/ordermanage";
	}

}
