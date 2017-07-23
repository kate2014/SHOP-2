package com.shop.controller.backgoods;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.XxBrand;
import com.shop.entity.XxProductCategory;
import com.shop.entity.XxProductCategoryBrandKey;
import com.shop.service.backgoods.ProductCategoryService;
import com.shop.service.backstage.UtilsService;

@Controller
@RequestMapping("/category")
public class ProductCategoryController {
	@Resource
	private ProductCategoryService pcs;
	@Resource
	private UtilsService us;
	@RequestMapping("/select")
	public String selectAll(Model model){
		List<XxProductCategory> xpc=pcs.getAll();
		model.addAttribute("xpc",xpc);
		return "backstage/goods/productcategory";
	}
	@RequestMapping("/selectadd")
	public String selectAddAll(Model model){
		List<XxProductCategory> xpc=pcs.getAll();
		List<XxBrand> xb=pcs.getBrand();
		model.addAttribute("xb",xb);
		model.addAttribute("xpc",xpc);
		return "backstage/goods/productcategoryadd";
	}
	@RequestMapping("/insertpc")
	public String insertpc(XxProductCategory xpc,long brandIds[]){
		if(xpc.getParent()==0)xpc.setParent(null);
		xpc.setDel(false);
		xpc.setCreateDate(new Date());
		xpc.setModifyDate(new Date());
		pcs.insertPC(xpc, brandIds);
		return "redirect:select";
	}
	@RequestMapping("/selectedit")
	public String selectEdit(long id,Model model){
		XxProductCategory xpc=pcs.selectEdit(id);
		List<XxProductCategory> xpcs=pcs.getAll();
		List<XxBrand> xb=pcs.getBrand();
		List<Long> brands=pcs.getBrands(id);
		System.out.println(brands);
		model.addAttribute("brands",brands);
		model.addAttribute("xpc",xpc);
		model.addAttribute("xpcs",xpcs);
		model.addAttribute("xb",xb);
		return "backstage/goods/productcategoryedit";
	}
	@RequestMapping("/delpc")
	public String delpc(String id){
		us.deleteByUpdate(id,XxProductCategory.class,"id");
		return "redirect:select";
	}
	@RequestMapping("/updateedit")
	public String updateEdit(XxProductCategory xpc,Long[] brandIds){
		pcs.updateEdit(xpc, brandIds);
		return "redirect:select";
	}

}
