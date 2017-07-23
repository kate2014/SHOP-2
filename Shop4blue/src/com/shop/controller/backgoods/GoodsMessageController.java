package com.shop.controller.backgoods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxProductNotify;
import com.shop.service.backgoods.GoodsMessageService;
import com.shop.service.backstage.UtilsService;
import com.shop.utils.MailUtils;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/gmessage")
public class GoodsMessageController {
	@Resource
	private GoodsMessageService gms;
	@Resource
	private UtilsService us;
	@RequestMapping("/gselect")
	public String selectAll(Integer page,Integer size,Model model,String isMarketable,String isOutOfStock,String hasSent){
		if(page==null){page=1;}
		if(size==null){size=5;}
		Map<String,Object> map=new HashMap<>();
		System.out.println(isMarketable+","+isOutOfStock+","+hasSent);
		System.out.println(Boolean.parseBoolean(isOutOfStock));
		if(isMarketable!=null && isMarketable!=""){
			map.put("isMarketable", Boolean.parseBoolean(isMarketable));
			model.addAttribute("isMarketable", Boolean.parseBoolean(isMarketable));
		}
		if(isOutOfStock!=null && isOutOfStock!=""){
			map.put("isOutOfStock", Boolean.parseBoolean(isOutOfStock));
			model.addAttribute("isOutOfStock", Boolean.parseBoolean(isOutOfStock));
			}
		if(hasSent!=null && hasSent!=""){
			map.put("hasSent",Boolean.parseBoolean(hasSent));
			model.addAttribute("hasSent",Boolean.parseBoolean(hasSent));
			}
		map.put("index",(page-1)*size);
		map.put("size",size);
		List<XxProductNotify> list=gms.getAll(map);
		Page<XxProductNotify> pages=new Page<XxProductNotify>();
		pages.setPage(page);
		pages.setSize(size);
		int num=gms.selectcount();
		pages.setTotal(num);
		pages.setRows(list);
		model.addAttribute("page",pages);
		return "backstage/goods/goodsmessage";
	}
	@RequestMapping("/del")
	public @ResponseBody Page<XxProductNotify> delmessage(String str,Page<XxProductNotify> pages){
		System.out.println(str);
		us.deleteByUpdate(str,XxProductNotify.class,"id");
		Page<XxProductNotify> page=new Page<XxProductNotify>();
		Map<String,Object> map=new HashMap<>();
		map.put("index",0);
		map.put("size",pages.getSize());
		List<XxProductNotify> list=gms.getAll(map);
		page.setPage(1);
		page.setSize(pages.getSize());
		int num=gms.selectcount();
		page.setTotal(num);
		page.setRows(list);
		return page;
	}
	@RequestMapping("/send")
	public @ResponseBody Page<XxProductNotify>sendmessage(String str,Page<XxProductNotify> pages){
		String[] split = str.split(",");
		int length = split.length;
		Long a[] = new Long [length];
		for(int i=0 ; i<length;i++){
		a[i] = Long.parseLong(split[i]);
		gms.sendMessage(a[i]);
		XxProductNotify pl = gms.findProductNotifyById(a[i]);
		String email = pl.getEmail();
		try {
			MailUtils.sendMail(email, "您喜欢的商品已到货 可前往购买");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		Page<XxProductNotify> page=new Page<XxProductNotify>();
		Map<String,Object> map=new HashMap<>();
		map.put("index",0);
		map.put("size",pages.getSize());
		List<XxProductNotify> list=gms.getAll(map);
		page.setPage(1);
		page.setSize(pages.getSize());
		int num=gms.selectcount();
		page.setTotal(num);
		page.setRows(list);
		return page;
	}
	@RequestMapping("/add")
	public @ResponseBody String add(Long productId,String email,Long userid){
		gms.insert(productId,email,userid);
		return "success";
	}

}
