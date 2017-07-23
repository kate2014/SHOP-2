package com.shop.controller.backmember;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.XxAdmin;
import com.shop.service.backstage.AdminService;

@Controller
@RequestMapping("/adminman")
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/toadminmanage")
	public String toAdminManage(){
		return "backstage/user/adminmanage";
	}
	
	@RequestMapping("/changepass")
	public String change(String password,String rePassword,HttpSession session){
		XxAdmin admin = (XxAdmin) session.getAttribute("admin");
		if(password.equals(rePassword)){
			System.out.println("----------------------------------");
			admin.setPassword(password);
			adminService.updatePassword(admin);
			session.removeAttribute("admin");
		}
		return "redirect:toadminmanage";
	}
}
