package com.shop.controller.webcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.XxArticle;
import com.shop.entity.XxArticleCategory;
import com.shop.entity.XxBrand;
import com.shop.entity.XxOrder;
import com.shop.entity.XxOrderItem;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductCategory;
import com.shop.service.websevice.ArticleService;
import com.shop.service.backorder.Order4ManageService;
import com.shop.service.websevice.CountService;
import com.shop.service.websevice.HotGoodsService;
import com.shop.service.websevice.MyOrdersService;
import com.shop.service.websevice.ShopService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/hc")
public class HeaderController {
	
	/**
	 * @return 返回主页   更新热门商品热门度
	 */
	@Autowired
	Order4ManageService orderManagerService;
	@Autowired
	private ShopService shopservice;
	@Autowired
	private HotGoodsService hotGoodsService;
	@Autowired
	private ArticleService articleService;
	@Resource
	private CountService countService;
	@Resource
	private MyOrdersService myOrdersService;
	@RequestMapping("/index")
	public String indexHeader(Model model){
		//处理主页下热门标签排名
		List<XxBrand> list=hotGoodsService.sortHotGoods();
		List<XxProductCategory> listshop=hotGoodsService.selectProductCategroy();
		model.addAttribute("list",list.subList(0, 14));
		model.addAttribute("listShop",listshop);//左侧商品列表
		List<XxArticleCategory> lac = articleService.getArticleCategory();
		model.addAttribute("articleCategory",lac);
		for(int i=0;i<3;i++){
			List<XxArticle> article = articleService.getArticles(lac.get(i).getId());
			model.addAttribute("article"+(i+1)+"",article);
		}
		
		// 热门及最新 商品
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("tagIds", "month_sales");
		map.put("id", "1");//被查询商品的id
		List<XxProduct> listShopHot1 = shopservice.selectShopBySort(map);
		map.put("id", "2");
		List<XxProduct> listShopHot2 = shopservice.selectShopBySort(map);
		map.put("id", "3");
		List<XxProduct> listShopHot3 = shopservice.selectShopBySort(map);
		
		map.put("tagIds", "modify_date");
		map.put("id", "1");//被查询商品的id
		List<XxProduct> listShopNew1 = shopservice.selectShopBySort(map);
		map.put("id", "2");
		List<XxProduct> listShopNew2 = shopservice.selectShopBySort(map);
		map.put("id", "3");
		List<XxProduct> listShopNew3 = shopservice.selectShopBySort(map);
		model.addAttribute("listShopHot1",listShopHot1.subList(0, 8));
		model.addAttribute("listShopHot2",listShopHot2.subList(0, 8));
		model.addAttribute("listShopHot3",listShopHot3.subList(0, 8));
		model.addAttribute("listShopNew1",listShopNew1.subList(0, 8));
		model.addAttribute("listShopNew2",listShopNew2.subList(0, 8));
		model.addAttribute("listShopNew3",listShopNew3.subList(0, 8));
		return "shop/index";
	}
	
	/**
	 * 热销   rx
	 * @return 跳转到热销
	 */
	@RequestMapping("/rx")
	public String rxHeader(Model model){
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
		
		model.addAttribute("list",list);
		return "shop/hotproduct";
	}
	
	/**
	 * 跳成搜索页!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	 * return 跳转到搜索页
	 */
	@RequestMapping("/main")
	public String ssnzHeader(Integer page,Integer size,Model model,String type,String temp){
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
//		List<XxProductCategory> list1=hotGoodsService.selectTopList(Long.parseLong(type));
		
		List<XxProductCategory> listTop=hotGoodsService.selectCategory(Long.parseLong(type));
		XxProductCategory xxpc=listTop.get(0);
		List<XxProduct> listShop=null;
		XxProductCategory xxpcs=null;
		if(temp!=null){
			List<XxProductCategory> listTops=hotGoodsService.selectCategory(Long.parseLong(temp));
			xxpcs=listTops.get(0);
			listShop = shopservice.selectShop(Long.parseLong(temp));
		}
		else{
			listShop = shopservice.selectShop(Long.parseLong(type));
		}
		
		model.addAttribute("list",list);//左侧商品列表
//		model.addAttribute("list1",list1);//上方分类列表
		
		
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
		model.addAttribute("listShop",listShop);//查询商品.....
		
		//上方首页后的小标签
		model.addAttribute("xxpc",xxpc);
		model.addAttribute("xxpcs",xxpcs);
		
		//商品种类下标
		model.addAttribute("temp",temp);
		model.addAttribute("type",type);
		model.addAttribute("controller","main");
		return "shop/main";
	}
	
	/**
	 * 最新  zx
	 * @return 跳转到最新
	 */
	@RequestMapping("/zx")
	public String zxHeader(){
		return "shop/最新";
	}
	
	/**
	 * 会员中心 hyzx
	 * @return 跳转到会员中心
	 */
	@RequestMapping("/hyzx")
	public String hyzxHeader(Model model,Long userid){
		int goodsMessageCount=countService.getGoodsMessageCount(userid);
		int goodsCollectCount=countService.getGoodsCollectCount(userid);
		
		List<XxOrder> order=myOrdersService.getAllBymember(userid);
		for(XxOrder x:order){
			List<XxOrderItem> orderItem = orderManagerService.selectByOrderId(x.getId());
			x.setOrderItems(orderItem);
		}
		model.addAttribute("order", order);
		model.addAttribute("goodsMessageCount", goodsMessageCount);
		model.addAttribute("goodsCollectCount", goodsCollectCount);
		return "shop/membercenter";
	}
	
	/**
	 * 退出登录  end
	 * @return 退出登录  跳转到登录页面
	 */
	@RequestMapping("/end")
	public String endHeader(){
		return "shop/login";
	}
}
