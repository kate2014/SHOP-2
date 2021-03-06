package com.shop.controller.backgoods;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxAttribute;
import com.shop.entity.XxAttributeExample;
import com.shop.entity.XxAttributeOption;
import com.shop.entity.XxProductCategory;
import com.shop.service.backgoods.ProductCategoryService;
import com.shop.service.backgoods.SpsxService;
import com.shop.service.backstage.UtilsService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/spsx")
public class GoodSPSXController {

	@Autowired
	SpsxService spsxService;
	@Autowired
	ProductCategoryService productCategoryService;
	@Autowired
	UtilsService utilsService;
	
	@RequestMapping("/toAddSpsx")
	public String toAddSpsx(Model model){
		List<XxProductCategory> list=productCategoryService.getAll();
		model.addAttribute("list",list);
		return "backstage/goods/添加商品属性";
	}
	@RequestMapping("/tospsx")
	public String getAll(Model model,Integer page,@RequestParam(value="rows",defaultValue="5") Integer rowss){
		if(page==null){
			page=1;
		}
		Page<XxAttribute> pages=new Page();
		List<XxAttribute> list=spsxService.getAll();
		List<XxAttribute> list1=new ArrayList<>();
		for(int i=(page-1)*rowss;i<page*rowss&&i<list.size();i++){
			list1.add(list.get(i));
		}
		pages.setPage(page);
		pages.setSize(rowss);
		pages.setRows(list1);
		pages.setTotal(spsxService.getCountAttribute());
		model.addAttribute("page",pages);
		return "backstage/goods/商品属性";
	}
	@RequestMapping("/addSpsx")
	public String addSpsx(XxAttribute xxAttribute,String[] options){
		XxAttributeOption xxAttributeOption=new XxAttributeOption();
		spsxService.addSpsx(xxAttribute);
		xxAttributeOption.setAttribute(xxAttribute.getId());
		for(int i=0;i<options.length;i++){
			xxAttributeOption.setOptions(options[i]);
			spsxService.addAttributeOption(xxAttributeOption);
		}
		return "redirect:tospsx";
	}
	@RequestMapping("/deleteSpsx")
	public String deleteSpsx(String del){
		utilsService.deleteByUpdate(del, XxAttribute.class,"id");
		return "redirect:tospsx";
	}
	@RequestMapping("/toEdit")
	public String toEdit(Long id,Model model){
		XxAttribute xxAttribute=spsxService.getById(id);
		model.addAttribute("attr", xxAttribute);
		return "backstage/goods/属性编辑";
	}
	/*@RequestMapping("deleteOptions")
	public @ResponseBody String deleteOptions(Long attribute,String options){
		try{
			XxAttributeOption xxAttributeOption=new XxAttributeOption();
			xxAttributeOption.setAttribute(attribute);
			xxAttributeOption.setOptions(options);
			spsxService.deleteOne(xxAttributeOption);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}*/
	@RequestMapping("/editOptions")
	public String editOptions(XxAttribute xxAttribute,String[] options){
		spsxService.deleteById(xxAttribute.getId());
		XxAttributeOption xxAttributeOption=new XxAttributeOption();
		spsxService.addSpsx(xxAttribute);
		xxAttributeOption.setAttribute(xxAttribute.getId());
		for(int i=0;i<options.length;i++){
			xxAttributeOption.setOptions(options[i]);
			spsxService.addAttributeOption(xxAttributeOption);
		}
		return "redirect:tospsx";
	}
}
