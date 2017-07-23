package com.shop.controller.proscenium;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxMember;
import com.shop.service.proscenium.MemberLoginService;

@Controller
@RequestMapping("/proLogin")
public class LoginController {

	@Autowired
	MemberLoginService mls;
	@RequestMapping("/login")
	public String login(HttpServletRequest request){
		Cookie cookie[]=request.getCookies();
		request.getSession().removeAttribute("user");
		return "shop/login1";
	}
	
	@RequestMapping("/realLogin")
	public String realLogin(XxMember xm,HttpServletResponse response,String isRememberUsername){
		Cookie cname=new Cookie("username",xm.getUsername());
		 Cookie cpass=new Cookie("pass",xm.getPassword());
		 Cookie cre=new Cookie("re","checked");
		if(isRememberUsername!=null){ 
			 cname.setMaxAge(86400*7);
			 cpass.setMaxAge(86400*7);
			 cre.setMaxAge(86400*7);
		}else{
			 cname.setMaxAge(0);
			 cpass.setMaxAge(0);
			 cre.setMaxAge(0);
		 }
		response.addCookie(cname);
		 response.addCookie(cpass);
		 response.addCookie(cre);
		return "redirect:/hc/index";
    }
	
	@RequestMapping("/checkName")
	public @ResponseBody boolean checkName(String username){
		boolean result=false;
		List<String> list=mls.selectAllName();
		for(String l:list){
			if(l.equals(username)){
				result=true;
			}
		}
		return result;
	}
	
	@RequestMapping("nameAndPass")
	public @ResponseBody boolean nameAndPass(XxMember x,HttpSession session){
		boolean result=false;
		XxMember xm=mls.selByNameAndPass(x.getUsername(),x.getPassword());
		System.out.println(xm);
		if(xm!=null){
			result=true;
			session.setAttribute("user", xm);
		}
	    return result;
	}
	
	@RequestMapping("/shoplogin")
	public String shopLogin(HttpSession session,XxMember member,HttpServletRequest request){
		XxMember xm=mls.selByNameAndPass(member.getUsername(),member.getPassword());
		if(xm!=null){
			xm.setLoginIp(request.getRemoteAddr());
			xm.setModifyDate(new Date());
			mls.updateMemberById(xm);
			session.setAttribute("user", xm);
			return "redirect:/hc/index";
		}
		return "redirect:login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "redirect:/hc/index";
	}
}
