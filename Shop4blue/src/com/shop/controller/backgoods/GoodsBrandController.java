package com.shop.controller.backgoods;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.XxBrand;
import com.shop.service.backgoods.GoodsBrandService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/brand")
public class GoodsBrandController {

	@Autowired
	GoodsBrandService gbs;
	
	@RequestMapping("/showBrands")
	public String showBrands(XxBrand xb,Model model,Integer rows,Integer page,HttpSession session,String flag,int[] ids){
		System.out.println(xb.getLogo()+"======="+xb.getName()+"======"+xb.getUrl());
		if(page==null){
			page=1;
		}
		if("delBrand".equals(flag)){
			
			gbs.delByIds(ids);
			
		}
		if("add".equals(flag)){
			Date date=new Date();
			xb.setCreateDate(date);
			xb.setModifyDate(date);
			xb.setType(1);
			gbs.addBrand(xb);
		}
		if("update".equals(flag)){
			Date date=new Date();
			xb.setModifyDate(date);
			gbs.updateById(xb);
		}
		
		List<XxBrand> list=gbs.selAllbrand(page,rows);
		Page<XxBrand> ppage=new Page<>();
        ppage.setSize(rows);
		ppage.setPage(page);
		ppage.setRows(list);
		ppage.setTotal(gbs.selectNum());
        model.addAttribute("page", ppage);
        session.setAttribute("rows", rows);
		return "backstage/goods/brandManager";
	}
	
	@RequestMapping("addBrand")
	public String aa(){
		
		return "backstage/goods/addBrand";
	}
	
	@RequestMapping("editBrand")
	public String  editbrand(long id,Model model){
		
		XxBrand xb=gbs.selById(id);
		model.addAttribute("xb", xb);
		return "backstage/goods/editBrand";
	}
	
}
