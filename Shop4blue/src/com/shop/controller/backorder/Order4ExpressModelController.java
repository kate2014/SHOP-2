package com.shop.controller.backorder;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shop.entity.XxDeliveryTemplate;
import com.shop.service.backorder.Order4ExpressModelService;
import com.shop.service.backstage.UtilsService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/orderExpressModel")
public class Order4ExpressModelController {
	@Autowired
	private Order4ExpressModelService oems;
	@Autowired
	private UtilsService us;
	
	@RequestMapping("/getExpressModel")
	public String getExpressModel(Model model,Integer page,Integer size){
		if (page == null) {
			page = 1;
		}
		if (size == null) {
			size = 5;
		}
		Page<Map<String, Object>> pages = new Page<>();
		Map<String, Object> map = new HashMap<>();
		map.put("index", (page - 1) * 2);
		map.put("num", size);
		List<Map<String, Object>> list = oems.getExpressModel(map);
		System.out.println(list.size()+"AAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		int total = oems.selectExpressModelCount();
		pages.setPage(page);
		pages.setRows(list);
		pages.setSize(size);
		pages.setTotal(total);
		model.addAttribute("page", pages);
		return "backstage/order/expressmodel";
	}
	 @RequestMapping("/checkExpressModelBySize")
	 	public String checkExpressModelBySize(@RequestParam(value="rows",defaultValue="5")int size,@RequestParam(value="page",defaultValue="1")int page,Model model){
		 int total = oems.selectExpressModelCount();
		 Page<Map<String, Object>> pages = new Page<>();
			Map<String, Object> map = new HashMap<>();
			map.put("index", (page - 1) * size);
			map.put("num", size);
			List<Map<String, Object>> list = oems.getExpressModel(map);
	 		pages.setPage(page);
	 		pages.setRows(list);
	 		pages.setSize(size);
	 		pages.setTotal(total);
	 		model.addAttribute(pages);
	 		return "backstage/order/expressmodel";
	 	}
	 @SuppressWarnings("rawtypes")
		@RequestMapping("/delExpressModel")
	     public @ResponseBody Page delExpressModel(String str,int page,int size){
	    	 us.deleteByUpdate(str, XxDeliveryTemplate.class, "id");
	    	 int total = oems.selectExpressModelCount();
			 Page<Map<String, Object>> pages = new Page<>();
				Map<String, Object> map = new HashMap<>();
				map.put("index", (page - 1) * size);
				map.put("num", size);
				List<Map<String, Object>> list = oems.getExpressModel(map);
		 		pages.setPage(page);
		 		pages.setRows(list);
		 		pages.setSize(size);
		 		pages.setTotal(total);
			return pages;
	     }
	 @RequestMapping("/addExpressModel")
	 public String addExpressModel(){
		 return "backstage/order/addorder";
	 }
	 @RequestMapping("/uploadPic")
	 public @ResponseBody String uploadPic(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		  String str="";
		 try {  
	            // 获取图片原始文件名  
	            String originalFilename = file.getOriginalFilename();  
	            System.out.println(originalFilename);  
	          
	            // 文件名使用当前时间  
	            String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());  
	          
	            // 获取上传图片的扩展名(jpg/png/...)  
	            String extension = FilenameUtils.getExtension(originalFilename);  
	              
	            // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
//	            String path = "\\resources\\upload\\" + name + "." + extension;  
	  
	            // 图片上传的绝对路径  
//	            String url = request.getSession().getServletContext().getRealPath("") + path;  
	            System.out.println(name);
	            System.out.println(extension);
	                  file.transferTo(new File("G:\\images\\" + name +"."+extension));
	             str = name+"."+extension;
	             System.out.println(str);
	            // 上传图片  
//	            file.transferTo(new File(url));  
	        } catch (Exception e) {  
	            e.printStackTrace();
	        }
		 
		return str;  
	 }
	 @RequestMapping("/addExpress")
	 public String addExpress(XxDeliveryTemplate xdt){
		 xdt.setCreateDate(new Date());
		 xdt.setModifyDate(new Date());
		 oems.addExpress(xdt);
		return "redirect:getExpressModel";
		 
	 }
	 @RequestMapping("/editExpressModelDetails")
	 public String editExpressModelDetails(Model model ,Long id){
		 XxDeliveryTemplate xdt =  oems.selectDeliveryTemplatebyId(id);
		 model.addAttribute("xdt", xdt);
		return "backstage/order/editexpressmodel";
	 }
	 @RequestMapping("/editExpressModel")
	 public String editExpressModel(XxDeliveryTemplate xdt){
		 xdt.setModifyDate(new Date());
		 oems.updateExpressModel(xdt);
		return "redirect:getExpressModel";
		 
	 }
}
