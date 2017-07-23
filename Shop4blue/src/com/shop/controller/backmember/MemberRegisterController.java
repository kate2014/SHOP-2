package com.shop.controller.backmember;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxMemberAttribute;
import com.shop.entity.XxMemberAttributeOption;
import com.shop.service.backstage.MemberRegisterService;

@Controller
@RequestMapping("/memberr")
public class MemberRegisterController {
	@Resource
	private MemberRegisterService mrs;
	@RequestMapping("/selectall")
	public String SelectAll(Model model){
		List<XxMemberAttribute> list=mrs.getAll();
		model.addAttribute("list", list);
		return "backstage/user/memberregister";
	}
	
	@RequestMapping("/selectbyid")
	public String SelectById(Model model,long id){
		XxMemberAttribute xma=mrs.getById(id);
		model.addAttribute("xma", xma);
		return "backstage/user/memberregisteredit";
	}
	
	@RequestMapping("/updateedit")
	public String UpdateEdit(XxMemberAttribute xma){
		if(xma.getIsEnabled()==null){xma.setIsEnabled(false);}
		if(xma.getIsRequired()==null){xma.setIsRequired(false);}
		mrs.updateEdit(xma);
		return "redirect:selectall";
	}
	
	@RequestMapping("/insertdate")
	public String InsertDate(XxMemberAttribute xma,String type1,String options[]){
		xma.setCreateDate(new Date());
		xma.setModifyDate(new Date());
		if(xma.getIsEnabled()==null){xma.setIsEnabled(false);}
		if(xma.getIsRequired()==null){xma.setIsRequired(false);}
		xma.setPropertyIndex(new Integer(mrs.getIndex()));
		if(type1.equals("text")){
			xma.setType(0);
			mrs.intsert(xma);
		}
		
		else if(type1.equals("select")){
        	xma.setType(1);
			mrs.intsert(xma);
			for(int i=0;i<options.length;i++){
				XxMemberAttributeOption xmao=new XxMemberAttributeOption();
				xmao.setMemberAttribute(xma.getId());
				xmao.setOptions(options[i]);
				mrs.inserttt(xmao);
			}
		}
		else if(type1.equals("checkbox")){
        	xma.setType(2);
			mrs.intsert(xma);
			for(int i=0;i<options.length;i++){
				XxMemberAttributeOption xmao=new XxMemberAttributeOption();
				xmao.setMemberAttribute(xma.getId());
				xmao.setOptions(options[i]);
				mrs.inserttt(xmao);
			}
        }  
		
		return "redirect:selectall";
	}
	@RequestMapping("/deldate")
	public @ResponseBody List<XxMemberAttribute> delDate(String str){
		String[] split = str.split(",");
		int length = split.length;
		Long a[] = new Long [length];
		for(int i=0 ; i<length;i++){
			a[i] = Long.parseLong(split[i]);
		}
		for(long i:a){
			XxMemberAttribute xx=mrs.getById(i);
			mrs.delm(xx.getPropertyIndex());
			}
		mrs.delmrOptions(a);
		mrs.delmr(a);
		
		List<XxMemberAttribute> list=mrs.getAll();
       return list;
	}
	
	

}
