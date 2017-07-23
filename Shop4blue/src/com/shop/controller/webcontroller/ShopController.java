package com.shop.controller.webcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.XxBrand;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductCategory;
import com.shop.service.websevice.BrandService;
import com.shop.service.websevice.HotGoodsService;
import com.shop.service.websevice.ShopService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/sortShop")
public class ShopController {
	/**
	 * 此controller仅处理各种方式的查询 
	 */
	
	
	@Autowired
	private ShopService shopservice;
//	@RequestMapping("/sort")
//	public String sort(String sort,String type,Model model){
//		List<XxProduct> listShop=shopservice.selectShopBySort(sort,type);
//		model.addAttribute("listShop",listShop);
//		return null;
//	}
	@Autowired
	private HotGoodsService hotGoodsService;
	
	
	/**
     *  处理商品分类里包含的的商品得商品查询
	 * @param str 查询条件    price—asc
	 * @param type  大商品id
	 * @param temp	小商品id
	 * @param startPrice  最低价格
	 * @param endPrice	      最高价格
	 * @param tagIds	热销 或者 最新
	 * @param model		
	 * @return
	 */
	@RequestMapping("/sort")
	public String sortShop(Integer page,Integer size,String str,String type,String temp,String startPrice,String endPrice,String tagIds,Model model){
//		System.out.println(str+","+type+","+temp);
//		System.out.println(temp!=null);
//		System.out.println(temp.equals(""));
//		System.out.println(startPrice+","+endPrice);
		System.out.println(tagIds);
		Map<String,Object> map=new HashMap<String,Object>();
		System.out.println("==========="+page+","+size);
		//宸︿晶鍟嗗搧鍒楄〃
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
		model.addAttribute("list",list);
		
		if(str!=null){
			String strs[]=str.split("-");
			map.put("type1", strs[0]);//排序列
			map.put("type2", strs[1]);//升序降序
		}
		if(startPrice!=null){
//			map.put("startPrice",Double.parseDouble(startPrice));
			map.put("startPrice",startPrice);
		}
		if(endPrice!=null){
//			map.put("endPrice", Double.parseDouble(endPrice));
			map.put("endPrice", endPrice);
		}
//		System.out.println(Long.parseLong(type)+","+strs[0]+","+strs[1]);
//		for(String strr:map.keySet()){
//			System.out.println(map.get(strr));
//		}
		if(tagIds!=null){
			map.put("tagIds", tagIds);
		}
		
//		for(XxProduct xp:listShop){
//			System.out.println(xp.getName()+","+xp.getPrice());
//		}
		if(!"".equals(type)){
			//澶ф爣绛�
			List<XxProductCategory> listTop=hotGoodsService.selectCategory(Long.parseLong(type));
			XxProductCategory xxpc=listTop.get(0);
			model.addAttribute("xxpc",xxpc);
			
			//鏌ヨ鍟嗗搧
			List<XxProduct> listShop=null;
			XxProductCategory xxpcs=null;
			if(!"".equals(temp)){
				List<XxProductCategory> listTops=hotGoodsService.selectCategory(Long.parseLong(temp));
				xxpcs=listTops.get(0);
				map.put("id", Long.parseLong(temp));//琚煡璇㈠晢鍝佺殑id
				listShop = shopservice.selectShopBySort(map);
			}
			else{
				map.put("id", Long.parseLong(type));
				listShop = shopservice.selectShopBySort(map);
			}
			Page<XxProduct> pages=new Page<>();
			if(page==null){
				page=1;
			}
			if(size==null){
				size=20;
			}
			for(XxProduct xp:listShop){
				System.out.println("listshop:"+xp);
			}
			
			pages.setPage(page);
			pages.setSize(size);
			List<XxProduct> listt=new ArrayList<>();
			for(int i=(page-1)*size;i<page*size&&i<listShop.size();i++){
				listt.add(listShop.get(i));
			}
			pages.setRows(listt);
			pages.setTotal(listShop.size());
			for(XxProduct xp:listt){
				System.out.println("listtt:"+xp);
			}
			model.addAttribute("page",pages);
			model.addAttribute("listShop",listShop);//鏉′欢鏌ヨ杩斿洖鍒楄〃
			model.addAttribute("xxpcs",xxpcs);//灏忔爣绛�
			model.addAttribute("controller","sort");
		}

		//杩斿洖椤甸潰鍙傛暟 鏇存敼椤甸潰瀵瑰簲鏍囩灞炴��
		model.addAttribute("temp",temp);
		model.addAttribute("type",type);//灏忔爣绛鹃亶鍘嗕綅缃�
		model.addAttribute("str",str);
		model.addAttribute("tagIds",tagIds);
		return "shop/main";
	}
	
	@RequestMapping("/search")
	public String sortSearch(Integer page,Integer size,String str,String keyword,String startPrice,String endPrice,String tagIds,Model model){
		System.out.println("keyword:"+keyword);
		Map<String,Object> map=new HashMap<String,Object>();
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
		model.addAttribute("list",list);
		map.put("str", keyword);
		if(str!=null){
			String strs[]=str.split("-");
			map.put("type1", strs[0]);//鎺掑簭鍒�
			map.put("type2", strs[1]);//鍗囧簭闄嶅簭
		}
		if(startPrice!=null){
			map.put("startPrice",startPrice);
		}
		if(endPrice!=null){
			map.put("endPrice", endPrice);
		}
//		System.out.println(Long.parseLong(type)+","+strs[0]+","+strs[1]);
//		for(String strr:map.keySet()){
//			System.out.println(map.get(strr));
//		}
		if(tagIds!=null){
			map.put("tagIds", tagIds);
		}
		List<XxProduct> listShop = shopservice.selectShopBySort(map);
		for(XxProduct xp:listShop){
			System.out.println(xp.getName()+","+xp.getPrice());
		}

		Page<XxProduct> pages=new Page<>();
		if(page==null){
			page=1;
		}
		if(size==null){
			size=20;
		}
		pages.setPage(page);
		pages.setSize(size);
		List<XxProduct> listt=new ArrayList<>();
		for(int i=(page-1)*size;i<page*size&&i<listShop.size();i++){
			listt.add(listShop.get(i));
		}
		pages.setRows(listt);
		pages.setTotal(listShop.size());
		model.addAttribute("page",pages);
		model.addAttribute("listShop",listShop);
		model.addAttribute("keyword",keyword);
		return "shop/search";
	}
	
	
	/**
	 * header涓嬬殑鐑棬   鏈�鏂�
	 * @param tagIds
	 * @param model
	 * @return
	 */
	@RequestMapping("/shopSort")
	public String shopSort(Integer page,Integer size,String tagIds,Model model){
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
		model.addAttribute("list",list);
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("tagIds", tagIds);
		List<XxProduct> listShop = shopservice.selectShopBySort(map);
		Page<XxProduct> pages=new Page<>();
		if(page==null){
			page=1;
		}
		if(size==null){
			size=20;
		}
		pages.setPage(page);
		pages.setSize(size);
		List<XxProduct> listt=new ArrayList<>();
		for(int i=(page-1)*size;i<page*size&&i<listShop.size();i++){
			listt.add(listShop.get(i));
		}
		pages.setRows(listt);
		pages.setTotal(listShop.size());
		model.addAttribute("page",pages);
//		model.addAttribute("listShop",listShop);
		for(XxProduct xp:listShop){
			System.out.println(xp.getName());
		}
		Map<String, Object> ll=new HashMap<String,Object>();
		if(tagIds.equals("month_sales")){
			ll.put("name","热销");
		}
		else{
			ll.put("name","最新");
		}
		model.addAttribute("controller","shopSort");
		model.addAttribute("xxpc",ll);
		model.addAttribute("shopSort","shopSort");
		return "shop/main";
		
	}
	
	@Autowired
	private BrandService brandService;
	
	/**
	 * 遍历所有品牌
	 * @param model
	 * @return
	 */
	@RequestMapping("/brands")
	public String sortBrand(Model model){
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
		model.addAttribute("list",list);
		List<XxBrand> listBrand=brandService.showBrands();
		model.addAttribute("listBrand",listBrand);
		Map<String, Object> ll=new HashMap<String,Object>();
		ll.put("name","品牌");
		model.addAttribute("xxpc",ll);
		model.addAttribute("divs","6");
		return "shop/category";
	}
	
	@RequestMapping("/brand")
	public String sortBrands(@RequestParam("id") long id,Model model){
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
		model.addAttribute("list",list);
		
		XxBrand xxbrand=brandService.showBrand(id);
		Map<String, Object> ll=new HashMap<String,Object>();
		ll.put("name","品牌");
		ll.put("id","1");
		model.addAttribute("xxpcs",xxbrand);
		model.addAttribute("xxpc",ll);
		model.addAttribute("xxBrand",xxbrand);
		model.addAttribute("divs","7");
		return "shop/category";
	}
	
	@RequestMapping("/category")
	public String sortCategory(Model model){
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
		model.addAttribute("list",list);
		model.addAttribute("divs","5");
		
		Map<String, Object> ll=new HashMap<String,Object>();
		ll.put("name","商品分类");
		model.addAttribute("xxpc",ll);
		return "shop/category";
	}
}
