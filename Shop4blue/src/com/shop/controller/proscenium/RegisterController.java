package com.shop.controller.proscenium;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxMember;
import com.shop.service.proscenium.MemberLoginService;

@Controller
@RequestMapping("/proRegister")
public class RegisterController {

	@Autowired
	MemberLoginService mls;
	@RequestMapping("/register")
	public String register(){
		return "shop/register";
	}
	@RequestMapping("/shopRegister")
	public String shopRegister(XxMember member,HttpServletRequest request){
		
		member.setCreateDate(new java.util.Date());
		member.setModifyDate(new java.util.Date());
		member.setAmount(new BigDecimal(0));
		member.setBalance(new BigDecimal(0));
		member.setIsEnabled(true);
		member.setIsLocked(false);
		member.setLoginFailureCount(0);
		member.setPoint(0l);
		member.setMemberRank(1l);
		member.setRegisterIp(request.getRemoteAddr());
		mls.insertMember(member);
		return "redirect:/proLogin/login";
	}
	
	@RequestMapping("/realRegister")
	public String realRegister(XxMember xm,@DateTimeFormat(pattern="yyyy-MM-dd")Date czx,HttpServletRequest request){
		System.out.println(xm);
		System.out.println(czx);
		Date date=new Date();
		xm.setCreateDate(date);
		xm.setModifyDate(date);
		xm.setBirth(czx);
		xm.setGender(1);
		BigDecimal bd=new BigDecimal(0);
		xm.setAmount(bd);
		xm.setBalance(bd);
		xm.setLoginFailureCount(0);
		xm.setIsEnabled(true);
		xm.setIsLocked(false);
		long l=0;
		xm.setPoint(l);
		long mr=1;
		xm.setMemberRank(mr);
		xm.setRegisterIp(request.getRemoteAddr());
		mls.insertMember(xm);
		return "shop/index";
	}
	
	@RequestMapping("seeUserName")
	public @ResponseBody boolean seeUser(String username){
		boolean result=false;
		XxMember xm=mls.selByUserName(username);
		if(xm==null){
			result=true;
		}
		   
		return result;
	}
	@RequestMapping("seeEmail")
	public @ResponseBody boolean seeEmail(String email){
		boolean result=false;
		java.util.List<XxMember> xm=mls.selByEmail(email);
		if(xm==null||xm.size()==0){
			result=true;
		}
		   
		return result;
	}
}
