package com.shop.controller.backorder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxPayment;
import com.shop.entity.XxProduct;
import com.shop.service.backorder.Order4GetMoneyService;
import com.shop.service.backstage.UtilsService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/orderGet")
public class Order4GetMoneyController {
     @Autowired
     private Order4GetMoneyService ogms;
     @Autowired
     private UtilsService us;
     
     @RequestMapping("/getMoney")
     public String getMoney(Model model,Integer page,Integer size){
    	 if(page==null){
 			page=1;
 		}
 		if(size==null){
 			size=5;
 		}
 		Page<Map<String,Object>> pages=new Page<>();
 		Map<String,Object> map = new HashMap<>();
 		map.put("index", (page-1)*2);
 		map.put("num",size);
 		List<Map<String,Object>> list = ogms.getTakeMoney(map);
 		
 		/*for(Map<String,Object> map2:list){
 			BigDecimal mData = new BigDecimal(xm.getBalance().toString()).setScale(2, BigDecimal.ROUND_HALF_UP);
 		}*/
 		
 		
 		int total = ogms.selectPaymentCount();
		pages.setPage(page);
		pages.setRows(list);
		pages.setSize(size);
		pages.setTotal(total);
		model.addAttribute("page",pages);
		return "backstage/order/getmoney";
     }
     @SuppressWarnings("rawtypes")
	@RequestMapping("/delPayment")
     public @ResponseBody Page delPayment(String str,int page,int size){
    	 us.deleteByUpdate(str, XxPayment.class, "id");
    	 int total = ogms.selectPaymentCount();
    	 Page<Map<String,Object>> pages=new Page<>();
  		Map<String,Object> map = new HashMap<>();
  		map.put("index", (page-1)*2);
  		map.put("num",size);
  		List<Map<String,Object>> list = ogms.getTakeMoney(map);
  		pages.setPage(page);
		pages.setRows(list);
		pages.setSize(size);
		pages.setTotal(total);
		return pages;
    	 
     }
     @RequestMapping("/checkPaymentBysize")
 	public String checkProductsBysize(@RequestParam(value="rows",defaultValue="5")int size,@RequestParam(value="page",defaultValue="1")int page,Model model){
    	int total = ogms.selectPaymentCount();
 		Page<Map<String,Object>> pages=new Page<>();
 		Map<String,Object> map = new HashMap<>();
 		map.put("index", (page-1)*size);
 		map.put("num",size);
 		System.out.println(size+"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
 		List<Map<String,Object>> list = ogms.getTakeMoney(map);
 		pages.setPage(page);
 		pages.setRows(list);
 		pages.setSize(size);
 		pages.setTotal(total);
 		model.addAttribute(pages);
 		return "backstage/order/getmoney";
 	}
     @RequestMapping("/getMoneyDetails")
     public String getMoneyDetails(Model model,int id){
    		XxPayment xp = ogms.getXxPaymentById(id);
    	 model.addAttribute("xp", xp);
    	 return "backstage/order/getmoneydetails";
    	 
     }
}
