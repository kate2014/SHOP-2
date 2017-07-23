package com.shop.controller.backgoods;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.shop.entity.XxAttribute;
import com.shop.entity.XxBrand;
import com.shop.entity.XxGoods;
import com.shop.entity.XxMemberRank;
import com.shop.entity.XxParameterGroup;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductCategory;
import com.shop.entity.XxProductParameterValue;
import com.shop.entity.XxProductParameterValueKey;
import com.shop.entity.XxProductProductImage;
import com.shop.entity.XxPromotion;
import com.shop.entity.XxSpecification;
import com.shop.entity.XxSpecificationValue;
import com.shop.entity.XxTag;
import com.shop.service.backgoods.GgglService;
import com.shop.service.backgoods.GoodManagerService;
import com.shop.service.backgoods.GoodsBrandService;
import com.shop.service.backgoods.ParameterService;
import com.shop.service.backgoods.ProductCategoryService;
import com.shop.service.backstage.MemberRankService;
import com.shop.service.backstage.UtilsService;

import cn.itcast.utils.Page;
@Controller
@RequestMapping("/product")
public class GoodManagerController {
    @Autowired
    private GoodManagerService gms;
    @Autowired
    private UtilsService us;
    @Autowired
    private ParameterService ps;
	@Autowired
	private ProductCategoryService  pcs;
	@Autowired
	private GoodsBrandService gbs;
	@Autowired
	private GgglService   gs;
	@Autowired
	MemberRankService memberRankService;
	@Value("${imagePosition}")
	String imagePosition;
	
	
//	/product/checkProducts
	@RequestMapping("/checkProducts")
	public String checkProducts(Model model,Integer page,Integer size,Long productCategoryId,Long brandId,Long promotionId,Long tagId,String isMarketable,String isList,String isTop,String isGift,String isOutOfStock,String isStockAlert){
		if(page==null){
			page=1;
		}
		if(size==null){
			size=5;
		}
		Page<Map<String,Object>> pages=new Page<>();
		Map<String,Object> map = new HashMap<>();
		if(isMarketable!=null && isMarketable!=""){
			map.put("isMarketable", Boolean.parseBoolean(isMarketable));
			model.addAttribute("isMarketable", Boolean.parseBoolean(isMarketable));
		}
		if(isList!=null && isList!=""){
			map.put("isList", Boolean.parseBoolean(isList));
			model.addAttribute("isList", Boolean.parseBoolean(isList));
		}
		if(isTop!=null && isTop!=""){
			map.put("isTop", Boolean.parseBoolean(isTop));
			model.addAttribute("isTop", Boolean.parseBoolean(isTop));
			}
		if(isGift!=null && isGift!=""){
			map.put("isGift", Boolean.parseBoolean(isGift));
			model.addAttribute("isGift", Boolean.parseBoolean(isGift));
		}
		if(isOutOfStock!=null && isOutOfStock!=""){
			map.put("isOutOfStock", Boolean.parseBoolean(isOutOfStock));
			model.addAttribute("isOutOfStock", Boolean.parseBoolean(isOutOfStock));
			}
		if(isStockAlert!=null && isStockAlert!=""){
			map.put("isStockAlert", Boolean.parseBoolean(isStockAlert));
			model.addAttribute("isStockAlert", Boolean.parseBoolean(isStockAlert));
			}
		/*if(productCategoryId!=null){
			map.put("productCategoryId", productCategoryId);
			}
		if(brandId!=null){
			map.put("brandId", brandId);
			}
		if(promotionId!=null){
			map.put("promotionId", promotionId);
			}
		if(tagId!=null){
			map.put("tagId", tagId);
			}*/
		map.put("index", (page-1)*2);
		map.put("num",size);
		List<Map<String,Object>> list = gms.getProduct(map);
		int total = gms.selectProductCount(map);
		pages.setPage(page);
		pages.setRows(list);
		pages.setSize(size);
		pages.setTotal(total);
		/*List<XxBrand> xb=pcs.getBrand();
		List<XxProductCategory> xpc=pcs.getAll();
		List<XxTag> xxTag=gms.getTags();
		List<XxPromotion> xxPromotion=gms.getPromotion();
		model.addAttribute("xxPromotion", xxPromotion);
		model.addAttribute("xxTag", xxTag);
		model.addAttribute("xb",xb);
		model.addAttribute("xpc",xpc);*/
		model.addAttribute("page",pages);
		return "backstage/goods/goodmanage";
		
	}
	@RequestMapping("/checkProductsBysize")
	public String checkProductsBysize(@RequestParam(value="rows",defaultValue="5")int size,@RequestParam(value="page",defaultValue="1")int page,Model model,String isMarketable,String isList,String isTop,String isGift,String isOutOfStock,String isStockAlert){
		
		Page<Map<String,Object>> pages=new Page<>();
		Map<String,Object> map = new HashMap<>();
		if(isMarketable!=null && isMarketable!=""){
			map.put("isMarketable", Boolean.parseBoolean(isMarketable));
			model.addAttribute("isMarketable", Boolean.parseBoolean(isMarketable));
		}
		if(isList!=null && isList!=""){
			map.put("isList", Boolean.parseBoolean(isList));
			model.addAttribute("isList", Boolean.parseBoolean(isList));
		}
		if(isTop!=null && isTop!=""){
			map.put("isTop", Boolean.parseBoolean(isTop));
			model.addAttribute("isTop", Boolean.parseBoolean(isTop));
			}
		if(isGift!=null && isGift!=""){
			map.put("isGift", Boolean.parseBoolean(isGift));
			model.addAttribute("isGift", Boolean.parseBoolean(isGift));
		}
		if(isOutOfStock!=null && isOutOfStock!=""){
			map.put("isOutOfStock", Boolean.parseBoolean(isOutOfStock));
			model.addAttribute("isOutOfStock", Boolean.parseBoolean(isOutOfStock));
			}
		if(isStockAlert!=null && isStockAlert!=""){
			map.put("isStockAlert", Boolean.parseBoolean(isStockAlert));
			model.addAttribute("isStockAlert", Boolean.parseBoolean(isStockAlert));
			}
		map.put("index", (page-1)*size);
		map.put("num",size);
		List<Map<String,Object>> list = gms.getProduct(map);
		int total = gms.selectProductCount(map);
		pages.setPage(page);
		pages.setRows(list);
		pages.setSize(size);
		pages.setTotal(total);
		/*List<XxBrand> xb=pcs.getBrand();
		List<XxProductCategory> xpc=pcs.getAll();
		List<XxTag> xxTag=gms.getTags();
		List<XxPromotion> xxPromotion=gms.getPromotion();
		model.addAttribute("xxPromotion", xxPromotion);
		model.addAttribute("xxTag", xxTag);
		model.addAttribute("xb",xb);
		model.addAttribute("xpc",xpc);*/
		model.addAttribute(pages);
		return "backstage/goods/goodmanage";
	}
	@RequestMapping("addProduct")
	public String addProduct(Model model){
		List<XxProductCategory> xxProductCategory = pcs.getAll();
		model.addAttribute("xxProductCategory", xxProductCategory);
		
		List<XxMemberRank> memberRank=memberRankService.find();
		model.addAttribute("memberRank", memberRank);
		
		List<XxTag>  tag = gms.getTags();
		model.addAttribute("tag", tag);
		
		List<XxSpecification> specification = gs.getAllByProducts();
		model.addAttribute("xxSpecification", specification);
	
		List<XxBrand> list = gbs.selectAll();
		model.addAttribute("list", list);
		return "backstage/goods/addgood";
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping("delProduct")
	public @ResponseBody Page delProduct(String str,int page,int size){
		System.out.println(page+"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		System.out.println(size+"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
		us.deleteByUpdate(str, XxProduct.class, "id");
		
		Page<Map<String,Object>> pages=new Page<>();
		Map<String,Object> map = new HashMap<>();
		map.put("index", (page-1)*size);
		map.put("num",size*page);
		List<Map<String,Object>> list = gms.getProduct(map);
		int total = gms.selectProductCount(map);
		pages.setPage(page);
		pages.setRows(list);
		pages.setSize(size);
		pages.setTotal(total);
		return pages;
	}
	@RequestMapping("/ajaxGetParameter")
	public @ResponseBody List<XxParameterGroup> ajaxGetParameter(Long id){
		List<XxParameterGroup> parameterGroup = ps.findByGroupId(id);
		return parameterGroup;
	}
	@RequestMapping("/ajaxGetProperty")
	public @ResponseBody List<XxAttribute> ajaxGetProperty(Long id){
		List<XxAttribute>  attribute = gms.ajaxGetproperty(id);
		return attribute;
	}
	@RequestMapping("/uploadPic")
	public @ResponseBody String uploadPic(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		  String str="";
		 try {  
	            // 获取图片原始文件名  
	            String originalFilename = file.getOriginalFilename();  
	            // 文件名使用当前时间  
	            String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());  
	          
	            // 获取上传图片的扩展名(jpg/png/...)  
	            String extension = FilenameUtils.getExtension(originalFilename);  
	              
	            // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
//	            String path = "\\resources\\upload\\" + name + "." + extension;  
	  
	            // 图片上传的绝对路径  
//	            String url = request.getSession().getServletContext().getRealPath("") + path;  
	                  file.transferTo(new File(imagePosition + name +"."+extension));
	             str = name+"."+extension;
	            // 上传图片  
//	            file.transferTo(new File(url));  
	        } catch (Exception e) {  
	            e.printStackTrace();
	        }
		 
		return str;  
	 }
	/**
	 * xp--> 前台获取的商品的实体该实体的属性有 1、productCategory：商品分类的id --- >存入 xx_product 表  并返回商品主键
	 *                                 2、name   ：  商品的name
	 *                                 3、sn： 商品的编号 ---》有可能不好使 ------》 
	 *                                 4、price： 商品的销售价
	 *                                 5、cost ：成本价
	 *                                 6、marketPrice ： 市场价   --------> 若为空  设置为0 
	 *                                 7、image：展示图片
	 *                                 8、unit ：单位
	 *                                 9、weight：重量
	 *                                 10、stock ：库存
	 *                                 11、stock_memo 库存备注
	 *                                 12、point ：赠送积分----------> 若为空 设置为0
	 *                                 13、brand：品牌   -----------> 可以为空
	 *                                 14、isMarketable:是否上架
	 *                                 15、isList：是否列出
	 *                                 16、isTop：是否置顶
	 *                                 17、isGift：是否为赠品
	 *                                 18、memo：备注
	 *                                 19、keyword：搜索关键词
	 *                                 20、seo_title:页面标题
	 *                                 21、seo_keywords:页面关键字
	 *                                 22、seo_description:页面描述
	 *                                 23、introduction:商品介绍
	 *                                 24、brand ： 商品品牌的id
	 *                                 25、attribute[0--??]商品属性
	 *                       前台获取不到的数据：
	 *                                     1、allocated_stock----->暂时 将库存 设置为他
	 *                                     2、create_Date---->  new 一个 创建时间
	 *                                     3、modify_Date----->  new 一个 更改时间
	 *                                     5、hits------->  点击数 暂时设置为0
	 *                                     6、month_hits----->月点击数  暂时设置为0
	 *                                     7、month_hits_date------> 月点击数更新时间  new 一个
	 *                                     8、month_sales   ------>  暂时设置为零
	 *                                     9、month_sales_date  ----->月销量更新时间  暂时设置为零
	 *                                     10、sales  ----------->  销量  暂时设置为0
	 *                                     11、score    ------>  评分  设置为0
	 *                                     12、score_count  -----> 设置为0
	 *                                     13、total_score------>设置为0
	 *                                     14、week_hits  ----->周点击数  设置为零
	 *                                     15、week_hits_date -------> 周点击更新时间   new 一个
	 *                                     16、week_sales  ----->  周销量设置为0
	 *                                     17、week_sales_date -----> 周销量更新时间  new一个
	 *                                     4、full_name------>    获取到的name + 上商品的规格  ----->得搁到最后整
	 *                                     
	 * isMemberPrice -->是否开启会员
	 * memberPrice --> 接收的会员价
	 * memberPriceIds-->接受的会员价id们 ------>上面三个  用 isMemberPrice 判断 是的话 存入到xx_product_member_price表中     done
	 * 
	 * files-->接收的商品图片
	 * titles--> 图片的标题
	 * orders--> 图片的排序     -----------------> 判断  files的大小和是否为空 若否 遍历处理并存入xx_product_product_image done
	 *  
	 * tags--> xx_tags 表的id 选上哪个 就出来那个   ------>存入到  xx_product_tag表中  done
	 * 
	 * productCategory----->  商品分类的id
	 * paramters--> 接收的商品参数values 
	 * hiddens-->接受的商品参数的ids   -------------------->上面的三个存入到xx_parameter_value_key中                    done
	 * 
	 * specificationIds---> 该商品所拥有的商品规格的id
	 * specification_上面的id  获取到多个数组 每个数组的横向 都是 一个 ----------->根据所拥有的商品规格的id 用request获取    规格的value
	 *                         接上面 ↑ 将商品的id 和specificationIds  xx_product_specification 相当于商品有几个规格
	 *                               再 根据 商品的id和 request 获取到的specification_id  存入到xx_product_specification_value表
	 * @param xp
	 * @param request
	 * @return 
	 */
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/addproduct")
	public String addproduct(XxProduct xp,HttpServletRequest request,@RequestParam Long[] specificationIds,@RequestParam MultipartFile[] files ){

		
		String isMemberPrice = request.getParameter("isMemberPrice");
		if(xp.getSn()==null||xp.getSn().equals("")){
			String randomId = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());  
			xp.setSn(randomId);
		};
		if(xp.getMarketPrice()==null||xp.getMarketPrice().equals("")){
			BigDecimal  mathh = new BigDecimal(0);
			xp.setMarketPrice(mathh);
		}
		if(xp.getPoint()==null||xp.getPoint().equals("")){
			xp.setPoint(Long.parseLong("0"));
		}
		xp.setAllocatedStock(xp.getStock());
		xp.setCreateDate(new Date());
		xp.setModifyDate(new Date());
		xp.setHits(Long.parseLong("0"));
		xp.setMonthHits(Long.parseLong("0"));
		xp.setMonthHitsDate(new Date());
		xp.setMonthSales(Long.parseLong("0"));
		xp.setMonthSalesDate(new Date());
		xp.setSales(Long.parseLong("0"));
		xp.setScore(new Float(0));
		xp.setScoreCount(Long.parseLong("0"));
		xp.setTotalScore(Long.parseLong("0"));
		xp.setWeekHits(Long.parseLong("0"));
		xp.setWeekHitsDate(new Date());
		xp.setWeekSales(Long.parseLong("0"));
		xp.setWeekSalesDate(new Date());
		xp.setAllocatedStock(0);
		xp.setDel(false);
		
		String hiddenAttributes[] = request.getParameterValues("hiddenAttributes");
		if(hiddenAttributes.length>0){
			System.out.println(000000000000000000000000000000);
			for(int i =0;i<hiddenAttributes.length;i++){
				String temp = request.getParameter("attributeValue_"+hiddenAttributes[i]);
				System.out.println("11111111111111111111111111111");
				System.err.println(temp);
				Class  clazz = xp.getClass();
					Method method;
					try {
						method = clazz.getMethod("setAttributeValue"+i,String.class);
						method.invoke(xp,temp);
					} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e1) {
						e1.printStackTrace();
					}
			}
		}
		System.out.println(xp.getAttributeValue0());
		System.out.println(xp.getAttributeValue1());
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		
		
		
		List<XxProduct> products = new ArrayList<>();
		if (specificationIds != null && specificationIds.length > 0) {
			System.out.println("这里面是封装specifications 的............................");
			for (int i = 0; i < specificationIds.length; i++) {
				XxSpecification specification = gs.getOne(specificationIds[i]);
				String[] specificationValueIds = request.getParameterValues("specification_" + specification.getId());
				System.out.println("这里面是 里面的东西");
               for(String str :specificationValueIds){
            	   System.out.println(str);
               }
				if (specificationValueIds != null && specificationValueIds.length > 0) {
					for (int j = 0; j < specificationValueIds.length; j++) {
						if (i == 0) {
							if (j == 0) {
								xp.setSpecifications(new HashSet<XxSpecification>());
								xp.setSpecificationValues(new HashSet<XxSpecificationValue>());
								products.add(xp);
							} else {
								XxProduct specificationProduct = new XxProduct();
								BeanUtils.copyProperties(xp, specificationProduct);
								String randomId = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());  
								specificationProduct.setSn(randomId);
								specificationProduct.setSpecifications(new HashSet<XxSpecification>());
								specificationProduct.setSpecificationValues(new HashSet<XxSpecificationValue>());
								products.add(specificationProduct);
							}
				        }
						XxProduct specificationProduct = products.get(j);
						XxSpecificationValue specificationValue = gs.findSpecificationValue(Long.valueOf(specificationValueIds[j]));
						specificationProduct.getSpecifications().add(specification);
						specificationProduct.getSpecificationValues().add(specificationValue);
						System.out.println("有几个......");
						System.out.println(specificationProduct.getSpecifications().size());
						System.out.println(specificationProduct.getSpecificationValues().size());
			       }
		      }
	     }
    }
		for(int i = 0 ; i<products.size();i++){
			Set<XxSpecificationValue> specificationValues = products.get(i).getSpecificationValues();
			String fullName = products.get(i).getName();
			Iterator<XxSpecificationValue> iterator = specificationValues.iterator();
			    while(iterator.hasNext()){
			    	XxSpecificationValue value = iterator.next();
			    	fullName+=value.getName();
			    }
			    products.get(i).setFullName(fullName);
		}
		  XxGoods goods = new XxGoods();
		  goods.setCreateDate(new Date());
		  goods.setModifyDate(new Date());
		     gms.addGoods(goods);
		for(int  i =0;i<products.size();i++){

			  products.get(i).setGoods(goods.getId());
		         gms.insertInToByEntity(products.get(i));
		         Long id = products.get(i).getId();
		     if(isMemberPrice!=null){
		    	 String[] prices = request.getParameterValues("memberPrice");
		    	 int tt = 1;
		    	 for(int  j = 0 ;j<prices.length;j++){
		    		 Map map = new HashMap<>();
		    		 map.put("id", id);
		    		 map.put("memberRankId",tt);
		    		 map.put("price",Double.parseDouble(prices[j]!=null?prices[j]:"1"));
		    		 gms.addXxProductMemberPrice(map);
		    		 tt++;
		    	 }
		     }
		     String[] orders = request.getParameterValues("orders");
		     String[] titles = request.getParameterValues("titles");
		     for(int j=0;j<files.length;j++){
		    	  String str="";
		 		 try {  
		 	            // 获取图片原始文件名  
		 	            String originalFilename = files[j].getOriginalFilename();  
		 	            System.out.println(originalFilename);  
		 	          
		 	            // 文件名使用当前时间  
		 	            String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());  
		 	          
		 	            // 获取上传图片的扩展名(jpg/png/...)  
		 	            String extension = FilenameUtils.getExtension(originalFilename);  
		 	              
		 	            // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
//		 	            String path = "\\resources\\upload\\" + name + "." + extension;  
		 	  
		 	            // 图片上传的绝对路径  
//		 	            String url = request.getSession().getServletContext().getRealPath("") + path;  
		 	            System.out.println(name);
		 	            System.out.println(extension);
		 	                  files[j].transferTo(new File(imagePosition + name +"."+extension));
		 	             str ="/pic/"+ name+"."+extension;
		 	             System.out.println(str);
		 	            // 上传图片  
//		 	            file.transferTo(new File(url));  
		 	             int order = Integer.parseInt(orders[j]);
		 	             Map map =new HashMap<>();
		 	             map.put("id", id);
		 	             map.put("order",order );
		 	             map.put("title",titles[j]);
		 	             map.put("scource",str);
		 	             gms.addXxProductProductImage(map);
		 	        } catch (Exception e) {  
		 	            e.printStackTrace();
		 	        }
		     }
		     //存Tag------------------------------------------------------
		     String tagIds[] = request.getParameterValues("tagIds");
		     if(tagIds!=null){
		    	 for(int j = 0 ;j<tagIds.length;j++){
					 Map map =new HashMap<>();
	 	             map.put("id", id);
	 	             map.put("tag",Integer.parseInt(tagIds[j]));
					  gms.addTags(map);
				}
		     }
			//存商品参数 -------------存入xx_product_parameter_value
			String parameters[] = request.getParameterValues("parameters");
			String hiddens[]   =request.getParameterValues("hiddens");
			
			if(hiddens!=null){
				for(int j = 0;j<hiddens.length;j++){
					 Map map =new HashMap<>();
	 	             map.put("productid", id);
	 	             map.put("parameterValue",parameters[j]);
	 	             map.put("parameterValueKey",Long.parseLong(hiddens[j]));
	 	             gms.addparameterValueKey(map);
				}
			}
			
			//存入商品规格------------------存入 和xx_product_specification
			Iterator<XxSpecification> iterator = products.get(i).getSpecifications().iterator();
			
			System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+++++");
			while(iterator.hasNext()){
				XxSpecification value = iterator.next();
				Long id2 = value.getId();
				 Map map =new HashMap<>();
 	             map.put("id2", id2);
 	             map.put("id",id);
 	             gms.addSpecification(map);
			}
			//存入商品规格------------------存入          xx_product_specification_value
			Iterator<XxSpecificationValue> iterator2 = products.get(i).getSpecificationValues().iterator();
			while(iterator2.hasNext()){
				XxSpecificationValue value2 = iterator2.next();
				Long id2 = value2.getId();
				 Map map =new HashMap<>();
 	             map.put("id2", id2);
 	             map.put("id",id);
 	             gms.addSpecificationValue(map);
			}
			
		}
		return "redirect:checkProducts";
		
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/editproduct")
	public String editproduct(XxProduct xp,HttpServletRequest request,@RequestParam Long[] specificationIds,@RequestParam MultipartFile[] files ){
		System.err.println("goods============"+xp.getGoods());
		//查看 是否使用会员价
		String isMemberPrice = request.getParameter("isMemberPrice");
		//设置Attributes
		String hiddenAttributes[] = request.getParameterValues("hiddenAttributes");
		System.out.println("112312313AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		if(hiddenAttributes.length>0){
			System.out.println(000000000000000000000000000000);
			for(int i =0;i<hiddenAttributes.length;i++){
				String temp = request.getParameter("attributeValue_"+hiddenAttributes[i]);
				System.out.println("11111111111111111111111111111");
				System.err.println(temp);
				Class  clazz = xp.getClass();
					Method method;
					try {
						method = clazz.getMethod("setAttributeValue"+i,String.class);
						method.invoke(xp,temp);
					} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e1) {
						e1.printStackTrace();
					}
			}
		}
		//获取到第一件商品的id
		/*Long id = xp.getId();*/
		List<XxProduct> products = new ArrayList<>();
		if (specificationIds != null && specificationIds.length > 0) {
			System.out.println("这里面是封装specifications 的............................");
			for (int i = 0; i < specificationIds.length; i++) {
				XxSpecification specification = gs.getOne(specificationIds[i]);
				String[] specificationValueIds = request.getParameterValues("specification_" + specification.getId());
				System.out.println("这里面是 里面的东西");
				if (specificationValueIds != null && specificationValueIds.length > 0) {
					for (int j = 0; j < specificationValueIds.length; j++) {
						if (i == 0) {
							if (j == 0) {
								xp.setSpecifications(new HashSet<XxSpecification>());
								xp.setSpecificationValues(new HashSet<XxSpecificationValue>());
								products.add(xp);
							} else {
								XxProduct specificationProduct = new XxProduct();
								BeanUtils.copyProperties(xp, specificationProduct);
								if(specificationProduct.getSn()==null||specificationProduct.getSn().equals("")){
									String randomId = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()); 
									specificationProduct.setSn(randomId);
								};
								if(specificationProduct.getMarketPrice()==null||specificationProduct.getMarketPrice().equals("")){
									BigDecimal  mathh = new BigDecimal(0);
									specificationProduct.setMarketPrice(mathh);
								}
								if(specificationProduct.getPoint()==null||specificationProduct.getPoint().equals("")){
									specificationProduct.setPoint(Long.parseLong("0"));
								}
								specificationProduct.setAllocatedStock(xp.getStock());
								specificationProduct.setCreateDate(new Date());
								specificationProduct.setModifyDate(new Date());
								specificationProduct.setHits(Long.parseLong("0"));
								specificationProduct.setMonthHits(Long.parseLong("0"));
								specificationProduct.setMonthHitsDate(new Date());
								specificationProduct.setMonthSales(Long.parseLong("0"));
								specificationProduct.setMonthSalesDate(new Date());
								specificationProduct.setSales(Long.parseLong("0"));
								specificationProduct.setScore(new Float(0));
								specificationProduct.setScoreCount(Long.parseLong("0"));
								specificationProduct.setTotalScore(Long.parseLong("0"));
								specificationProduct.setWeekHits(Long.parseLong("0"));
								specificationProduct.setWeekHitsDate(new Date());
								specificationProduct.setWeekSales(Long.parseLong("0"));
								specificationProduct.setWeekSalesDate(new Date());
								specificationProduct.setAllocatedStock(0);
								specificationProduct.setDel(false);
								specificationProduct.setSn(UUID.randomUUID()+"");
								specificationProduct.setSpecifications(new HashSet<XxSpecification>());
								specificationProduct.setSpecificationValues(new HashSet<XxSpecificationValue>());
								specificationProduct.setId(null);
								products.add(specificationProduct);
							}
				        }
						XxProduct specificationProduct = products.get(j);
						XxSpecificationValue specificationValue = gs.findSpecificationValue(Long.valueOf(specificationValueIds[j]));
						specificationProduct.getSpecifications().add(specification);
						specificationProduct.getSpecificationValues().add(specificationValue);
			       }
		      }
	     }
    }
		System.out.println("这里是改变fullname的.....................");
		for(int i = 0 ; i<products.size();i++){
			Set<XxSpecificationValue> specificationValues = products.get(i).getSpecificationValues();
			String fullName = products.get(i).getName();
			Iterator<XxSpecificationValue> iterator = specificationValues.iterator();
			    while(iterator.hasNext()){
			    	XxSpecificationValue value = iterator.next();
			    	fullName+=value.getName();
			    }
			    products.get(i).setFullName(fullName);
		}

		
		
		
		
		Long goodId =  gms.getGoodId(xp.getId());
		xp.setGoods(goodId);
		System.err.println("这里是改变多个商品的"+"======"+goodId);
		for(int  i =0;i<products.size();i++){
			if(i!=0){
				 products.get(i).setGoods(goodId);
		         gms.insertInToByEntity(products.get(i));
		         System.err.println("id======================"+products.get(i).getId());
		         Long id = products.get(i).getId();
		     if(isMemberPrice!=null){
		    	 String[] prices =request.getParameterValues("memberPrice1");
		    	 int tt = 1;
		    	 for(int  j = 0 ;j<prices.length;j++){
		    		 Map map = new HashMap<>();
		    		 map.put("id", id);
		    		 map.put("memberRankId",tt);
		    		 map.put("price",Double.parseDouble(prices[j]!=null?prices[j]:"1"));
		    		 gms.addXxProductMemberPrice(map);
		    		 tt++;
		    	 }
		     }
		     String[] orders = request.getParameterValues("orders");
		     String[] titles = request.getParameterValues("titles");
		     for(int j=0;j<files.length;j++){
		    	  String str="";
		 		 try {  
		 	            // 获取图片原始文件名  
		 	            String originalFilename = files[j].getOriginalFilename();  
		 	            System.out.println(originalFilename);  
		 	          
		 	            // 文件名使用当前时间  
		 	            String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());  
		 	          
		 	            // 获取上传图片的扩展名(jpg/png/...)  
		 	            String extension = FilenameUtils.getExtension(originalFilename);  
		 	              
		 	            // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
//		 	            String path = "\\resources\\upload\\" + name + "." + extension;  
		 	  
		 	            // 图片上传的绝对路径  
//		 	            String url = request.getSession().getServletContext().getRealPath("") + path;  
		 	            System.out.println(name);
		 	            System.out.println(extension);
		 	                  files[j].transferTo(new File("E:\\image\\" + name +"."+extension));
		 	             str ="/pic/"+ name+"."+extension;
		 	             System.out.println(str);
		 	            // 上传图片  
//		 	            file.transferTo(new File(url));  
		 	             int order = Integer.parseInt(orders[j]);
		 	             Map map =new HashMap<>();
		 	             map.put("id", id);
		 	             map.put("order",order );
		 	             map.put("title",titles[j]);
		 	             map.put("scource",str);
		 	             gms.addXxProductProductImage(map);
		 	        } catch (Exception e) {  
		 	            e.printStackTrace();
		 	        }
		     }
		     //存Tag------------------------------------------------------
		     String tagIds[] = request.getParameterValues("tagIds");
		     if(tagIds!=null){
		    	 for(int j = 0 ;j<tagIds.length;j++){
					 Map map =new HashMap<>();
	 	             map.put("id", id);
	 	             map.put("tag",Integer.parseInt(tagIds[j]));
					  gms.addTags(map);
				}
		     }
			//存商品参数 -------------存入xx_product_parameter_value
			String parameters[] = request.getParameterValues("parameters");
			String hiddens[]   =request.getParameterValues("hiddens");
			
			if(hiddens!=null){
				for(int j = 0;j<hiddens.length;j++){
					 Map map =new HashMap<>();
	 	             map.put("productid", id);
	 	             map.put("parameterValue",parameters[j]);
	 	             map.put("parameterValueKey",Long.parseLong(hiddens[j]));
	 	             gms.addparameterValueKey(map);
				}
			}
			
			//存入商品规格------------------存入 和xx_product_specification
			Iterator<XxSpecification> iterator = products.get(i).getSpecifications().iterator();
			
			System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+++++");
			while(iterator.hasNext()){
				XxSpecification value = iterator.next();
				Long id2 = value.getId();
				 Map map =new HashMap<>();
	             map.put("id2", id2);
	             map.put("id",id);
	             gms.addSpecification(map);
			}
			//存入商品规格------------------存入          xx_product_specification_value
			Iterator<XxSpecificationValue> iterator2 = products.get(i).getSpecificationValues().iterator();
			while(iterator2.hasNext()){
				XxSpecificationValue value2 = iterator2.next();
				Long id2 = value2.getId();
				 Map map =new HashMap<>();
	             map.put("id2", id2);
	             map.put("id",id);
	             gms.addSpecificationValue(map);
			}
		}
			if(i==0){
				// 第一个  是修改的
				System.err.println("good============"+xp.getGoods());
				gms.editProduct(xp);
				System.out.println("修改product本身......................");
				//修改 会员价
				if(isMemberPrice!=null&&!isMemberPrice.equals("")){
					gms.delMemberPriceByProductId(xp.getId());
					System.out.println("删除之前的会员价");
			    	 String[] prices = request.getParameterValues("memberPrice");
			    	 int tt = 1;
			    	 for(int  j = 0 ;j<prices.length;j++){
			    		 if(prices[j]!=null){
			    			 Map map = new HashMap<>();
				    		 map.put("id", xp.getId());
				    		 map.put("memberRankId",tt);
				    		 map.put("price",Double.parseDouble(prices[j]!=null?prices[j]:"1"));
				    		 gms.addXxProductMemberPrice(map);
			    		 }
			    		 tt++;
			    	 }
			     }
				//修改标签
				String tagIds[] = request.getParameterValues("tagIds");
			     if(tagIds!=null){
			    	 gms.deleteTagsByProductId(xp.getId());
			    	 for(int j = 0 ;j<tagIds.length;j++){
						 Map map =new HashMap<>();
		 	             map.put("id", xp.getId());
		 	             map.put("tag",Integer.parseInt(tagIds[j]));
						  gms.addTags(map);
					}
			     }
			     //修改图片
			     gms.deleteImagesByProductId(xp.getId());
			     String[] orders = request.getParameterValues("orders");
			     String[] titles = request.getParameterValues("titles");
			     for(int j=0;j<files.length;j++){
			    	  String str="";
			 		 try {  
			 	            // 获取图片原始文件名  
			 	            String originalFilename = files[j].getOriginalFilename();  
			 	            System.out.println(originalFilename);  
			 	          
			 	            // 文件名使用当前时间  
			 	            String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());  
			 	          
			 	            // 获取上传图片的扩展名(jpg/png/...)  
			 	            String extension = FilenameUtils.getExtension(originalFilename);  
			 	              
			 	            // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
//			 	            String path = "\\resources\\upload\\" + name + "." + extension;  
			 	  
			 	            // 图片上传的绝对路径  
//			 	            String url = request.getSession().getServletContext().getRealPath("") + path;  
			 	            System.out.println(name);
			 	            System.out.println(extension);
			 	                  files[j].transferTo(new File(imagePosition + name +"."+extension));
			 	             str ="/pic/"+ name+"."+extension;
			 	             System.out.println(str);
			 	            // 上传图片  
//			 	            file.transferTo(new File(url));  
			 	             int order = Integer.parseInt(orders[j]);
			 	             Map map =new HashMap<>();
			 	             map.put("id", xp.getId());
			 	             map.put("order",order );
			 	             map.put("title",titles[j]);
			 	             map.put("scource",str);
			 	             gms.addXxProductProductImage(map);
			 	        } catch (Exception e) {  
			 	            e.printStackTrace();
			 	        }
			     }
			     //修改 商品属性
				   gms.deleteParameterByProductId(xp.getId());	
			     String parameters[] = request.getParameterValues("parameters");
				String hiddens[]   =request.getParameterValues("hiddens");
					
					if(hiddens!=null){
						for(int j = 0;j<hiddens.length;j++){
							 Map map =new HashMap<>();
			 	             map.put("productid", xp.getId());
			 	             map.put("parameterValue",parameters[j]);
			 	             map.put("parameterValueKey",Long.parseLong(hiddens[j]));
			 	             gms.addparameterValueKey(map);
						}
					}
				//修改  商品规格
					gms.deleteSpecificationByProductId(xp.getId());
					gms.deleteSpecificationValueByProductId(xp.getId());
					Iterator<XxSpecification> iterator = products.get(i).getSpecifications().iterator();
					
					while(iterator.hasNext()){
						XxSpecification value = iterator.next();
						Long id2 = value.getId();
						 Map map =new HashMap<>();
			             map.put("id2", id2);
			             map.put("id",xp.getId());
			             gms.addSpecification(map);
					}
					//存入商品规格------------------存入          xx_product_specification_value
					Iterator<XxSpecificationValue> iterator2 = products.get(i).getSpecificationValues().iterator();
					while(iterator2.hasNext()){
						XxSpecificationValue value2 = iterator2.next();
						Long id2 = value2.getId();
						 Map map =new HashMap<>();
			             map.put("id2", id2);
			             map.put("id",xp.getId());
			             gms.addSpecificationValue(map);
					}
			}
		}
		return "redirect:checkProducts";
	}
	
	/**
	 * 编辑
	 * @param id
	 * @param model
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/checkOneGood")
	public String checkOneGood(Long id,Model model){
		//品牌
		List<XxBrand> list = gbs.selectAll();
		model.addAttribute("list", list);
		//标签
		List<XxTag>  tag = gms.getTags();
		model.addAttribute("tag", tag);
		 
		XxProduct product2 = gms.getOneProduct(id);
		//参数
		List<XxParameterGroup> parameterGroup = ps.findByGroupId(product2.getProductCategory());
		 model.addAttribute("parameterGroup", parameterGroup);
		 //属性
		 List<XxAttribute>  attribute = gms.ajaxGetproperty(product2.getProductCategory());
		 model.addAttribute("attribute", attribute);
		 //等级
		List<XxMemberRank> memberRank=memberRankService.find();
		//会员价
		 List<Map<String,Object>>  memberprice = gms.getmemberPrice(id);
		 boolean flag = false;
		 //商品标签
		 List<Map<String,Object>>  tags = gms.getTagByProductId(id);
		 Gson gson = new Gson();
		 String str2 = gson.toJson(tags);
		 String str = gson.toJson(memberprice);
		 model.addAttribute("memberprice", str);
		 model.addAttribute("tags", str2);
		if(memberprice.size()==0){
			model.addAttribute("isMemberPriceFlag", false);
		}else{
			model.addAttribute("isMemberPriceFlag", true);
		}
		model.addAttribute("memberRank", memberRank);
		//规格
		List<XxSpecification> specification = gs.getAllByProducts();
		model.addAttribute("xxSpecification", specification);
		//商品参数
		List<Map<String,Object>>  parameterValue = gms.getParameterValueById(id);
		List<Map<String,Object>> parameterValueKey = gms.getParameterValueKeyById(id); 
		String str3= gson.toJson(parameterValue);
		for(Map<String,Object> xx:parameterValue){
			System.out.println(xx.get("parameter_value"));
		}
		model.addAttribute("parameterValue", str3);
		model.addAttribute("parameterValueKey", parameterValueKey);
		//分类
		List<XxProductCategory> xxProductCategory = pcs.getAll();
		model.addAttribute("xxProductCategory", xxProductCategory);
		
		List<Map<String,Object>> xxSpecificationValue = gms.getSpecifiCationById(id);
		List<Map<String,Object>> xxSpecificationValueKey = gms.getsdjklghkghajksgh(id);
		String json = gson.toJson(xxSpecificationValue);
		String json2 = gson.toJson(xxSpecificationValueKey);
		model.addAttribute("xxSpecificationValueRoll", json);
		model.addAttribute("xxSpecificationValueKeyRoll",json2);
		
		
		
		XxProduct xxproduct = gms.findOneProduct(id);
		model.addAttribute("product",xxproduct);
		String str4 = gson.toJson(xxproduct);
		model.addAttribute("jsonProduct", str4);
		return "backstage/goods/editgood";
		
	}
}

