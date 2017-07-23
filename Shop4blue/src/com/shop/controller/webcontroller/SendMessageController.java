package com.shop.controller.webcontroller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.dao.XxMessageMapper;
import com.shop.entity.XxMember;
import com.shop.entity.XxMemberRank;
import com.shop.entity.XxMessage;
import com.shop.service.backstage.UtilsService;
import com.shop.service.websevice.SendMessageService;


@Controller
@RequestMapping("/sendMessage")
public class SendMessageController {
	
	@Autowired
	UtilsService utilService;
	@Autowired
	private SendMessageService  sendmessage ;
	@Autowired XxMessageMapper messages;
	@RequestMapping("/tomymessage")
	public String toMyMessage(){
		return "shop/sendmessage";
		
	}
	@RequestMapping("/getmessage")
	public String getmessage(HttpSession session,XxMessage xxmessage,Model model){
		XxMember member=(XxMember)session.getAttribute("user");
		Long id=member.getId();
		String username=xxmessage.getUsername();
		Long receiver=sendmessage.getReceiver(username);
		xxmessage.setCreateDate(new Date());
		xxmessage.setModifyDate(new Date());
		xxmessage.setIp(member.getLoginIp());
		xxmessage.setReceiverDelete(false);
		xxmessage.setReceiverRead(false);
		xxmessage.setSenderDelete(false);
		xxmessage.setSenderRead(true);
		xxmessage.setReceiver(receiver);
		xxmessage.setSender(id);
		sendmessage.getMessage(xxmessage);
		return "redirect:minemessage";
	}
	@RequestMapping("/minemessage")
	public String tomymessage(HttpSession session,Model model){
		XxMember member=(XxMember)session.getAttribute("user");
		Long id=member.getId();
		List<XxMessage> list=sendmessage.getreceiver(id);
		System.err.println(list.size()+"===========");
		for(XxMessage mess:list){
			mess.setUsername(sendmessage.findusername(mess.getReceiver()));
			System.err.println(mess.getCreateDate());
		}
		System.err.println(list);
		model.addAttribute("totalSize", list.size());
		model.addAttribute("list", list);
		return "shop/mymessage";
	}
	@RequestMapping("/check/{id}")
	public String check(@PathVariable Long id,Model model){
		List<XxMessage> list = new ArrayList<>();
		XxMessage message=sendmessage.findbyid(id);
		message.setSenderRead(false);
		model.addAttribute("message",message);
		sendmessage.update(message);
		while(message!=null){
			list.add(message);
			model.addAttribute("mess", message);
			message=sendmessage.findByForwardId(message.getId());
		}
		model.addAttribute("list",list);
		return "shop/checkmessage";
	}
	@RequestMapping("/drafts")
	public String drafts(HttpSession session,Model model){
		XxMember member=(XxMember)session.getAttribute("user");
		Long id=member.getId();
		List<XxMessage> list=sendmessage.finddraft(id);
		for(XxMessage mess:list){
			mess.setUsername(sendmessage.findusername(mess.getReceiver()));
			System.err.println("=========="+mess.getCreateDate());
		}
		model.addAttribute("totalSize", list.size());
		model.addAttribute("list", list);
		return "shop/drafts";
	}
	@RequestMapping("/checkdrafts/{id}")
	public String checkdrafts(@PathVariable Long id,Model model){
		XxMessage message=sendmessage.findbyid(id);
		message.setUsername(sendmessage.findusername(message.getReceiver()));
		System.err.println("=================="+message.getContent());
		model.addAttribute("message",message);
		return "shop/checkdrafs";
	}
	
	@RequestMapping("/deletedraft")
	@ResponseBody
	public String deletedra(Long id){
		XxMessage message=sendmessage.findbyid(id);
		message.setSenderDelete(true);
		sendmessage.update(message);
		return "success";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Long id){
		XxMessage message=sendmessage.findbyid(id);
		message.setSenderDelete(true);
		sendmessage.update(message);
		return "success";
	}
	@RequestMapping("/update")
	public String update(XxMessage message){
		message.setIsDraft(false);
		sendmessage.update(message);
		return "redirect:minemessage";
	}
	@RequestMapping("/reply")
	public String reply(Long firstid,HttpSession session,XxMessage message){
		XxMember member=(XxMember)session.getAttribute("user");
		Long id=member.getId();
		
		String username=message.getUsername();
		Long receiver=sendmessage.getReceiver(username);
		message.setCreateDate(new Date());
		message.setModifyDate(new Date());
		message.setIp(member.getLoginIp());
		message.setReceiverDelete(false);
		message.setReceiverRead(false);
		message.setSenderDelete(false);
		message.setSenderRead(true);
		message.setIsDraft(false);
		message.getForMessage();
		message.setReceiver(receiver);
		message.setSender(id);
		sendmessage.getMessage(message);
		return "redirect:check/"+firstid;
	}
}
