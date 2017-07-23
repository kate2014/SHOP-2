package com.shop.controller.webcontroller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.XxMember;
import com.shop.service.websevice.PersonalAndUpdatePassService;

@Controller
@RequestMapping("/pandu")
public class PersonalAndUpdatePassController {
	@Resource
	private PersonalAndUpdatePassService personalAndUpdatePassService;
	@RequestMapping("/personaldata")
	public String personalData(Long userid,Model model){
		XxMember xxMember=personalAndUpdatePassService.getById(userid);
		String treepath=personalAndUpdatePassService.getTreepath(xxMember.getArea());
		model.addAttribute("treepath", treepath);
		model.addAttribute("xxMember", xxMember);
		return "shop/personalcenter/memberedit";
	}
	@RequestMapping("/updatep")
	public String updatePersonal(Long userid,String email,String memberAttribute_1,Integer memberAttribute_2,@DateTimeFormat(pattern="yyyy-MM-dd") Date memberAttribute_3,Long memberAttribute_4,String memberAttribute_5,String memberAttribute_6){
		XxMember xx=personalAndUpdatePassService.getById(userid);
		xx.setEmail(email);
		xx.setName(memberAttribute_1);
		xx.setGender(memberAttribute_2);
		xx.setBirth(memberAttribute_3);
		xx.setArea(memberAttribute_4);
		xx.setAddress(memberAttribute_5);
		xx.setZipCode(memberAttribute_6);
		personalAndUpdatePassService.updatem(xx);
		return "redirect:/hc/hyzx?userid="+userid;
	}
	@RequestMapping("/check")
	public String check(){
		return "shop/personalcenter/password";
	}
	@RequestMapping("/updatepass")
	public String updatePass(String password,Long userid){
		XxMember xx=personalAndUpdatePassService.getById(userid);
		xx.setPassword(password);
		personalAndUpdatePassService.updatem(xx);
		return "redirect:/proLogin/login";
	}

}
