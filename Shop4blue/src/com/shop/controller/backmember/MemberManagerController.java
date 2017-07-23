package com.shop.controller.backmember;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxMember;
import com.shop.entity.XxMemberRank;
import com.shop.service.backstage.MemberManagerService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/memberm")
public class MemberManagerController {
	@Autowired
	private MemberManagerService mms;
	@RequestMapping("/getMember")
	public String getMember(HttpServletRequest request,Integer page,Integer size){
		if(page==null){
			page=1;
		}if(size==null){
			size=5;
		}
		Page<Map<String,Object>> pages=new Page<>();
		Map<String,Object> map = new HashMap<>();
		map.put("index", (page-1)*2);
		map.put("num",size);
		List<Map<String,Object>> list = mms.getMember(map);
		int total = mms.selectMemberCount();
		pages.setPage(page);
		pages.setRows(list);
		pages.setSize(size);
		pages.setTotal(total);
		request.setAttribute("page",pages);
		return "backstage/user/membermanage";
	}
	@RequestMapping("/saveMember")
	public String saveMember(XxMember xm,HttpServletRequest request){
		String addr = request.getRemoteAddr();
		System.err.println("这里是保存会员的....................................");
		xm.setRegisterIp(addr);
		if(xm.getBirth()==null){
			xm.setBirth(new Date());
		}
		mms.saveMember(xm);
		return "redirect:getMember";
		
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping("/delMember")
	public @ResponseBody Page delMember(String str,int page){
		String[] split = str.split(",");
		int length = split.length;
		Long a[] = new Long [length];
		for(int i=0 ; i<length;i++){
			a[i] = Long.parseLong(split[i]);
		}
		mms.delByIds(a);
		int total = mms.selectMemberCount();
		Page<Map<String,Object>> pages=new Page<>();
		Map<String,Object> map = new HashMap<>();
		map.put("index", (page-1)*2);
		map.put("num",2);
		List<Map<String,Object>> list = mms.getMember(map);
		pages.setPage(page);
		pages.setRows(list);
		pages.setSize(2);
		pages.setTotal(total);
		return pages;
		
	}
	@RequestMapping("/updateMemberMessage")
	public String updateMemberMessage(HttpServletRequest request,int id){
		List<Map<String,Object>> list = mms.selectMemberById(id);
		request.setAttribute("xm", list);
		List<XxMemberRank> memberRank = mms.selectAllLevel();
        request.setAttribute("rank", memberRank);
		return "backstage/user/membermanageedit";
	}
	@RequestMapping("/checkMemberMessage")
	public String checkMemberMessage(HttpServletRequest request,int id){
		String i =id+"";
		XxMember xm = mms.selectMembermById(Long.parseLong(i));
		request.setAttribute("xm",xm);
		return "backstage/user/membermanagefind";
		
	}
	@RequestMapping("/updateMember")
	public String  updateMember(@DateTimeFormat(pattern="yyyy-MM-dd")Date birth1,String treePath,XxMember xm,String changeBalance,String changePoint){
		
		/*
		Long area = mms.selectAreaByTreePath(treePath);
		xm.setArea(area);*/
		xm.setBirth(birth1);
		mms.updateMember( xm);
		if(!changeBalance.equals("")){
			Long changebalance1 = Long.parseLong(changeBalance);
			mms.updateOneConlum(changebalance1,xm.getId());
		}
		if(!changePoint.equals("")){
			 Long changePoint1 = Long.parseLong(changePoint);
			 mms.updatePoint(changePoint1,xm.getId());
		}
		return "redirect:getMember";
		
	}
	@RequestMapping("/showMemberByCount")
	public String showMemberByCount(@RequestParam(value="rows",defaultValue="5")int size,@RequestParam(value="page",defaultValue="1")int page,Model model){
		int total = mms.selectMemberCount();
		System.out.println(size+"sdasdasdasdasdasdasdasdasdasdasd");
		Page<Map<String,Object>> pages=new Page<>();
		Map<String,Object> map = new HashMap<>();
		map.put("index", (page-1)*size);
		map.put("num",size);
		List<Map<String,Object>> list = mms.getMember(map);
		pages.setPage(page);
		pages.setRows(list);
		pages.setSize(size);
		pages.setTotal(total);
		model.addAttribute(pages);
		return "backstage/user/membermanage";
	}
	@RequestMapping("/membermanageadd")
	public String membermanageadd(Model model){
		List<XxMemberRank> memberRank = mms.selectAllLevel();
		model.addAttribute("rank", memberRank);
		System.out.println("AAAAAAAAAAAAAAAAA"+memberRank.size());
		for(int i=0;i<memberRank.size();i++){
			System.out.println(memberRank.get(i).getId());
		}
		return "backstage/user/membermanageadd";
		
	}
}



