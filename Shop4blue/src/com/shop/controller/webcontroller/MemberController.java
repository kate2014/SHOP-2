package com.shop.controller.webcontroller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxArea;
import com.shop.entity.XxMember;
import com.shop.entity.XxReceiver;
import com.shop.service.backstage.AreaService;
import com.shop.service.websevice.MemberPreService;
import com.shop.service.websevice.OrderShopService;

@Controller
@RequestMapping("/premember")
public class MemberController {
	@Autowired
	OrderShopService orderService;
	@Autowired
	AreaService areaService;
	@Autowired
	MemberPreService memberPreService;
	
	/**
	 * 收获地址列表
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/receivers")
	public String receivers(HttpSession session,Model model){
		System.err.println("=====================");
		XxMember user = (XxMember) session.getAttribute("user");
		List<XxReceiver> receivers = orderService.findReceiversByMemberId(user.getId());
		model.addAttribute("receivers", receivers);
		return "shop/personalcenter/Receiver";
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "shop/personalcenter/receiveradd";
	}
	
	/**
	 * 添加收获地址
	 * @param session
	 * @param receiver
	 * @param areaId
	 * @return
	 */
	@RequestMapping("/add")
	public String saveReceiver(HttpSession session,XxReceiver receiver, Long areaId) {
		receiver.setArea(areaId);
		XxMember member = (XxMember) session.getAttribute("user");
		receiver.setAreaName(areaService.find(areaId).getFullName());
		receiver.setMember(member.getId());
		receiver.setCreateDate(new Date());
		receiver.setModifyDate(new Date());
		// 清空原来默认的地址
		if(receiver.getIsDefault()){
			memberPreService.updateReceiverDefaultByMemberId(member.getId());
		}
		orderService.saveReceiver(receiver);
		return "redirect:receivers";
	}
	
	@RequestMapping("/toedit")
	public String toedit(Long id,Model model){
		XxReceiver receiver = memberPreService.findReceiverById(id);
		receiver.setXxArea(areaService.find(receiver.getArea()));
		model.addAttribute("receiver", receiver);
		return "shop/personalcenter/receiveredit";
	}
	
	@RequestMapping("/update")
	public String update(HttpSession session,XxReceiver receiver, Long areaId){
		XxMember member = (XxMember) session.getAttribute("user");
		XxArea area = areaService.find(areaId);
		receiver.setArea(area.getId());
		receiver.setAreaName(area.getFullName());
		// 清空原来默认的地址
		if(receiver.getIsDefault()){
			memberPreService.updateReceiverDefaultByMemberId(member.getId());
		}
		memberPreService.updateReceiverById(receiver);
		return "redirect:receivers";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Long id){
		memberPreService.deleteReceiver(id);
		return "success";
	}
}
