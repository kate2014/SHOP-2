package com.shop.controller.backmember;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxMemberRank;
import com.shop.service.backstage.MemberRankService;
import com.shop.service.backstage.UtilsService;

/**
 * 会员等级
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/memberRank")
public class MemberRankController {
	@Autowired
	UtilsService utilService;
  
	@Autowired
	MemberRankService memberRankService;
	@RequestMapping("/getMemberRank")
	public String getAll(Model model){
		List<XxMemberRank> list=memberRankService.find();
		model.addAttribute("list", list);
		System.err.println(list.get(0).getIsDefault());
		return "backstage/user/levelofmember";
	}
	@RequestMapping("/edit")
	public String edit(XxMemberRank xxmemberrank){
		System.out.println(xxmemberrank.getName());
		memberRankService.update(xxmemberrank);
		return "redirect:getMemberRank";
	}
	@RequestMapping("/update")
	public String update(Model model){
		return "backstage/user/levelofmemberadd";
		}
	@RequestMapping("/edit1/{id}")
	public String edit1(@PathVariable Long id,Model model){
		XxMemberRank xxmemberrank=memberRankService.findidByid(id);
		model.addAttribute("memberrank",xxmemberrank);
		System.out.println(xxmemberrank.getIsDefault());
		return "backstage/user/levelofmemberedit";
		}
	@RequestMapping("/getuser")
    public String  getuser(XxMemberRank xxmemberrank){
		xxmemberrank.setCreateDate(new Date());
		xxmemberrank.setModifyDate(new Date());
		if(xxmemberrank.getIsDefault()==null){
			xxmemberrank.setIsDefault(false);
		}
		if(xxmemberrank.getIsSpecial()==null){
			xxmemberrank.setIsSpecial(false);
		}
		memberRankService.insert(xxmemberrank);
		System.err.println(xxmemberrank.getName());
    	return "redirect:getMemberRank";
    }
	@RequestMapping("/delete")
	@ResponseBody
	public List<XxMemberRank> delete(String str){
		utilService.deleteByIds(str, XxMemberRank.class, "id");
		List<XxMemberRank> list=memberRankService.find();
		return list;
	}
	
	
	}
