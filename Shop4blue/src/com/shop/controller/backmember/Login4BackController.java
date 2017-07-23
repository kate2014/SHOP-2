package com.shop.controller.backmember;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.XxAdmin;
import com.shop.service.backstage.LoginService;

import redis.clients.jedis.Jedis;

/**
 * 简单登录
 * @author ddj
 *
 */
@Controller
@RequestMapping("/")
public class Login4BackController {

	@RequestMapping("/tologin")
	public String toLogin(HttpSession session) {
		session.removeAttribute("admin");
		return "backstage/login";
	}

	@Autowired
	LoginService loginService;

	@RequestMapping("/login")
	public String login(XxAdmin admin, HttpSession session) {
		if (admin.getUsername() != null && admin.getUsername() != "" && admin.getPassword() != null
				&& admin.getPassword() != "") {
			XxAdmin ad = loginService.login(admin);
			if (ad != null){
				ad.setLoginDate(new Date());
				loginService.updateLogindate(ad);
				session.setAttribute("admin", ad);
				return "redirect:index";
			}
		}
		return "redirect:tologin";
		

	}
	
	@RequestMapping("/index")
	public String index(){
		return "backstage/index";
	}
	
	

}
