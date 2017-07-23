package com.shop.controller.webcontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.XxBrand;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductCategory;
import com.shop.service.websevice.BrandService;
import com.shop.service.websevice.HotGoodsService;
import com.shop.service.websevice.ShopSearchService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private HotGoodsService hotGoodsService;
	@Autowired
	private ShopSearchService shopSearchService;
	@Autowired
	private BrandService brandService;
	
	
	@RequestMapping("searchAll")
	public String search(@RequestParam String keyword,Model model,Integer page,Integer size){
		System.out.println("keyword:"+keyword);
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
		model.addAttribute("list",list);
		XxBrand xxbrand=shopSearchService.searchBrand(keyword);
		if(xxbrand!=null){
			brandService.showBrand(xxbrand.getId());
		}
		List<XxProduct> listShop=shopSearchService.searchShop(keyword);
		for(XxProduct xp:listShop){
			System.out.println(xp);
		}
		Page<XxProduct> pages=new Page<>();
		if(page==null){
			page=1;
		}
		if(size==null){
			size=20;
		}
		pages.setPage(page);
		pages.setSize(size);
		List<XxProduct> listt=new ArrayList<>();
		for(int i=(page-1)*size;i<page*size&&i<listShop.size();i++){
			listt.add(listShop.get(i));
		}
		pages.setRows(listt);
		pages.setTotal(listShop.size());
		model.addAttribute("page",pages);
		model.addAttribute("listShop",listShop);
		model.addAttribute("keyword",keyword);
		model.addAttribute("controller","searchAll");
		return "shop/search";
	}
}
