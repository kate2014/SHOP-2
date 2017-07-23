package com.shop.controller.webcontroller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.XxProductNotify;
import com.shop.service.backstage.UtilsService;
import com.shop.service.websevice.WebGoodsMessageService;

@Controller
@RequestMapping("/wbmessage")
public class WebGoodsMessageController {

	@Resource
	private WebGoodsMessageService webGoodsMessageService;
	@Resource
	private UtilsService us;
	@RequestMapping("/webselectall")
	public String webSelectAll(Model model,Long userid){
		List<XxProductNotify> list=webGoodsMessageService.WebSelectAll(userid);
		model.addAttribute("list",list);
		return "shop/personalcenter/goodsmessage";
	}
	@RequestMapping("/deleteone")
	public String deleteOne(Model model,String id,Long userid){
		us.deleteByUpdate(id,XxProductNotify.class,"id");
		List<XxProductNotify> list=webGoodsMessageService.WebSelectAll(userid);
		model.addAttribute("list",list);
		return "shop/personalcenter/goodsmessage";
	}
}
