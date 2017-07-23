package com.shop.controller.backgoods;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxParameter;
import com.shop.entity.XxParameterGroup;
import com.shop.entity.XxProductCategory;
import com.shop.service.backgoods.ParameterService;
import com.shop.service.backgoods.ProductCategoryService;
import com.shop.service.backstage.UtilsService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/parameter")
public class ParameterController {
	@Autowired
	ParameterService parameterService;
	@Autowired
	UtilsService utilsService;
	@Autowired
	ProductCategoryService productCategoryService;
	@RequestMapping("/list")
	public String list(Model model,Integer page,Integer size){
		Page<XxParameterGroup> pages = new Page<>();
		if(page==null){
			page=1;
		}
		if(size==null){
			size=5;
		}
		Map<String,Integer> map = new HashMap<>();
		map.put("size", size);
		map.put("start", (page-1)*size);
		List<XxParameterGroup> list = parameterService.findParams();
		List<XxParameterGroup> l = new ArrayList<>();
		for(int i=(page-1)*size;i<page*size&&i<list.size();i++){
			l.add(list.get(i));
		}
		System.err.println(list.size());
		int sum=parameterService.totalNum();
		pages.setPage(page);
		pages.setSize(size);
		pages.setRows(l);
		pages.setTotal(sum);
		model.addAttribute("page", pages);
		model.addAttribute("totalParam",sum);
		return "backstage/goods/productparamters";
	}
	
	@RequestMapping("/edit")
	public String edit(Long id,Model model){
		XxParameterGroup par = parameterService.findOne(id);
		List<XxProductCategory> categorys = productCategoryService.getAll();
		model.addAttribute("totalNum", par.getParameters().size());
		model.addAttribute("par", par);
		model.addAttribute("cate", categorys);
		return "backstage/goods/productparamedit";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Page<XxParameterGroup> delete(String str,Page<XxParameterGroup> pages,Model model){
		utilsService.deleteByUpdate(str, XxParameterGroup.class, "id");
		List<XxParameterGroup> list = parameterService.findParams();
		int sum = parameterService.totalNum();
		pages.setRows(list);
		return pages;
	}
	
	@RequestMapping("/toadd")
	public String toAdd(Model model){
		List<XxProductCategory> categorys = productCategoryService.getAll();
		model.addAttribute("cate", categorys);
		return "backstage/goods/productparamadd";
	}
	
	@RequestMapping("/add")
	public String add(XxParameterGroup parameterGroup){
		// 1 添加XxParameterGroup
		parameterGroup.setCreateDate(new Date());
		parameterGroup.setModifyDate(new Date());
		parameterService.insertParameterGroup(parameterGroup);
		
		// 2 添加XxParameters
		for(XxParameter p : parameterGroup.getParameters()){
			p.setCreateDate(new Date());
			p.setModifyDate(new Date());
			p.setParameterGroup(parameterGroup.getId());
		}
		parameterService.insertParameters(parameterGroup.getParameters());
		return "redirect:list";
	}
	
	@RequestMapping("/change")
	public String edit(XxParameterGroup parameterGroup){
		// 1 更新XxParameterGroup
		parameterGroup.setModifyDate(new Date());
		parameterService.updateParameterGroup(parameterGroup);
		
		// 2 更新XxParameters
		// 查询当前parameterGroup中的XxParameter
		XxParameterGroup pp = parameterService.findOne(parameterGroup.getId());
		System.err.println("更新大小"+parameterGroup.getParameters().size());
		System.err.println("原大小"+pp.getParameters().size());
		List<XxParameter> exist = pp.getParameters();
		List<XxParameter> insert = new ArrayList<>();
		List<XxParameter> update = new ArrayList<>();
		
		for(XxParameter p : parameterGroup.getParameters()){
			for(int i=0;i<exist.size();i++){
				// 删除-1
				if(exist.get(i).getId().equals(p.getId())){
					exist.remove(i);
				}
			}
			
			if(p.getId()==null){
				// 插入+1
				p.setCreateDate(new Date());
				p.setModifyDate(new Date());
				p.setParameterGroup(parameterGroup.getId());
				insert.add(p);
			}else{
				// 更新+1
				update.add(p);
			}
		}
		// 拼接删除字符串ids
		if(exist.size()>0){
			StringBuilder sb = new StringBuilder();
			for(XxParameter p : exist){
				sb.append(p.getId());
				sb.append(",");
			}
			utilsService.deleteByIds(sb.toString().substring(0,sb.length()-1), XxParameter.class, "id");
		}
		if(insert.size()>0)
		parameterService.insertParameters(insert);
		if(update.size()>0)
		parameterService.updateParameters(update);
		return "redirect:list";
	}

}
