package com.shop.controller.webcontroller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxMemberFavoriteProductKey;
import com.shop.entity.XxProduct;
import com.shop.service.websevice.WebGoodsCollectService;

@Controller
@RequestMapping("/webcollect")
public class WebGoodsCollectController {
	@Resource
    private	WebGoodsCollectService webGoodsCollectService;
	
	@RequestMapping("/selectcollect")
	public String selectAll(Model model,Long userid){
		Long []ids=webGoodsCollectService.getId(userid);
		List<XxProduct> list=webGoodsCollectService.getProduct(ids);
		model.addAttribute("list",list);
		return "shop/personalcenter/goodscollect";
	}
	@RequestMapping("/delcollect")
	public String delcollect(Model model,Long userid,Long id){
		XxMemberFavoriteProductKey xx=new XxMemberFavoriteProductKey();
		xx.setFavoriteMembers(userid);
		xx.setFavoriteProducts(id);
		webGoodsCollectService.del(xx);
		Long []ids=webGoodsCollectService.getId(userid);
		List<XxProduct> list=webGoodsCollectService.getProduct(ids);
		model.addAttribute("list",list);
		return "shop/personalcenter/goodscollect";
	}
	@RequestMapping("/add")
	public @ResponseBody String addcollect(Long id,Long userid){
		webGoodsCollectService.add(id,userid);
		return "success";
	}

}
