package com.shop.controller.webcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductCategory;
import com.shop.entity.XxProductParameterValue;
import com.shop.service.websevice.HotGoodsService;
import com.shop.service.websevice.ShopContentService;


@Controller
@RequestMapping("/shopContent")
public class ShopContentController {
	
	@Autowired
	private ShopContentService shopContentService;
	@Autowired
	private HotGoodsService hotGoodsService;
	
	//澶勭悊鍟嗗搧淇℃伅
	/**
	 * 
	 * @param id 鑾峰緱鐨勫晢鍝両D
	 * @return
	 */
	@RequestMapping("/shop")
	public String shopContent(@RequestParam Long id,Model model){
		System.out.println(id);
		
		List<XxProductCategory> list=hotGoodsService.selectProductCategroy();
		model.addAttribute("list",list);
		XxProductCategory xxpc=shopContentService.bigTagName(id);
//		System.out.println("++++++bigtagname"+listbig.get(0).getId());
//		System.out.println("++++++bigtagname"+listbig.get(0).getName());
		model.addAttribute("xxpc",xxpc);//澶ф爣绛�
		List<XxProductCategory> listsmall = shopContentService.smallTagName(id);
		model.addAttribute("xxpcs",listsmall.get(0));
		XxProduct xxProduct = shopContentService.productContent(id);
		
		
		//根据商品id访问xx_product_parameter_value的product
		//根据xx_product_parameter_value的parameter_value_key 访问xx_parameter 的 id
		//根据xx_parameter的parameter_group访问xx_parameter_group的id
		//根据xx_parameter_group的product_category 访问xx_product_category 的id
		
		//查出goods 查询所有颜色 尺码的 标签
		List<Map<String, Object>> listParameter = shopContentService.getProductsByProductGoods(id);
		for(Map<String, Object> map:listParameter){
			System.out.println(map.get("id")+","+map.get("svid")+","+map.get("name1")+","+map.get("name2"));
		}
		Set<Map<String, Object>> listcolor=new HashSet<>();
		Set<Map<String, Object>> listsize=new HashSet<>();
		Set<String>  liststyle=new HashSet<>();
		//找出所有的颜色以及尺码
		for(Map<String, Object> map:listParameter){
			//找出该goods的所有颜色
			if(map.get("name1").equals("颜色")){
				Map<String, Object> newmap=new HashMap<>();
				newmap.put("name",map.get("name2"));
				newmap.put("id", map.get("svid"));
				listcolor.add(newmap);
				liststyle.add("颜色");
			}
			//找出该goods的所有尺码
			if(map.get("name1").equals("尺码")){
				Map<String, Object> newmap=new HashMap<>();
				newmap.put("name",map.get("name2"));
				newmap.put("id", map.get("svid"));
				listsize.add(newmap);
				liststyle.add("尺码");
			}
		}
		for(String s:liststyle){
			System.out.println("<liststyle"+s);
		}
		
		//找出颜色、属性对
		
		//获得所有同一goods的product
		List<XxProduct> listgoods=shopContentService.getProductsByProduct(id);
		//遍历每个product获得其规格
		List<Map<String,Long>> listTwin=new ArrayList<>();
		for(XxProduct xp:listgoods){
			List<Map<String, Long>> specificationValuesMap = shopContentService.getSpecificationValuesByProductId(xp.getId());
			//规格处理
			Map<String,Long> resultMap =new HashMap<>();
			int i=0;
			for(Map<String,Long> map:specificationValuesMap){
//				System.out.println("specificationValuesMap:"+map.get("specification_values"));
				if(i==0){
					resultMap.put("first",map.get("specification_values"));
				}
				if(i==1){
					resultMap.put("second",map.get("specification_values"));
				}
				i++;
			}
			listTwin.add(resultMap);
			
		}
		for(Map<String, Long> mapp:listTwin){
			System.out.println("=================="+mapp.get("first")+","+mapp.get("second"));
		}
		model.addAttribute("listColor",listcolor);
		model.addAttribute("listSize",listsize);
		model.addAttribute("listStyle",liststyle);
//		model.addAttribute("listTwin",listTwin);
		Map<String, Long> map = listTwin.get(0);
		listTwin.remove(0);
		Gson gson=new Gson();
		model.addAttribute("mp", map);
		model.addAttribute("product", gson.toJson(map));
		String str=gson.toJson(listTwin);
		model.addAttribute("listTwinSize",listTwin.size());
		model.addAttribute("listTwin",str);
	
		
		//商品参数
		List<XxProductParameterValue> shopParameter = shopContentService.getShopParameter(id);
		xxProduct.setParameterValue(shopParameter);
		
		
		
		
		
		
		//装商品
		model.addAttribute("xxProduct",xxProduct);
		return "shop/shopContent";
	}
}
