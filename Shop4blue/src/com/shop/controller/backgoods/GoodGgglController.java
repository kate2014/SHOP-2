package com.shop.controller.backgoods;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

import com.shop.entity.XxSpecification;
import com.shop.entity.XxSpecificationValue;
import com.shop.service.backgoods.GgglService;

import cn.itcast.utils.Page;

@Controller
@RequestMapping("/gggl")
public class GoodGgglController {

	@Autowired
	GgglService ggglService;
	
	@RequestMapping("/toGggl")
	public String toGggl(Model model,Integer page,@RequestParam(value="rows",defaultValue="5") Integer rowss){
		if(page==null){
			page=1;
		}
		Page<XxSpecification> pages=new Page();
		List<XxSpecification> list=ggglService.getAll();
		List<XxSpecification> list1=new ArrayList<>();
		for(int i=(page-1)*rowss;i<page*rowss&&i<list.size();i++){
			list1.add(list.get(i));
		}
		pages.setPage(page);
		pages.setSize(rowss);
		pages.setRows(list1);
		pages.setTotal(ggglService.getCount());
		model.addAttribute("page",pages);
		return "backstage/goods/规格管理";
	}
	@RequestMapping("/toAddGggl")
	public String toAddGggl(){
		return "backstage/goods/添加规格管理";
	}
	@RequestMapping("/addGggl")
	public String addGggl(@RequestParam("files")MultipartFile[] files,XxSpecification xxSpecification) throws Exception{
		ggglService.saveGg(xxSpecification);
		/*for(int i=0;i<files.length;i++){
			String strName=files[i].getOriginalFilename();
			String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			String extension = FilenameUtils.getExtension(strName);
			files[i].transferTo(new File("D:\\image\\" + name +"."+extension));
			String str = name+"."+extension;
		}*/
		List<XxSpecificationValue> list=xxSpecification.getXxSpecificationValue();
		for(int i=0;i<list.size();i++){
			String strName=files[i].getOriginalFilename();
			String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			String extension = FilenameUtils.getExtension(strName);
			files[i].transferTo(new File("D:\\image\\" + name +"."+extension));
			String str = "/pic/"+name+"."+extension;
			list.get(i).setSpecification(xxSpecification.getId());
			list.get(i).setImage(str);
			ggglService.saveGgValue(list.get(i));
		}
		return "redirect:toGggl";
	}
	@RequestMapping("/toEditGg")
	public String toEditGg(Model model,Long id){
		XxSpecification xxSpecification=ggglService.getOne(id);
		model.addAttribute("xxSpecification",xxSpecification);
		return "backstage/goods/规格编辑";
	}
	@RequestMapping("/editGg")
	public String editGg(@RequestParam("files")MultipartFile[] files,XxSpecification xxSpecification){
		for(int i=0;i<files.length;i++){
			System.out.println(files[i].getOriginalFilename()+"+++++++++++");
		}
		return "redirect:toGggl";
	}
	@RequestMapping("/saveImg")
	public @ResponseBody String saveImg(MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws Exception{
		String str="";
		try{
			// 获取图片原始文件名  
	        String originalFilename = file.getOriginalFilename();  
	        System.out.println(originalFilename);  
	        // 文件名使用当前时间  
	        String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());  
	        // 获取上传图片的扩展名(jpg/png/...)  
	        String extension = FilenameUtils.getExtension(originalFilename);  
	        // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
//	        String path = "\\resources\\upload\\" + name + "." + extension;  
	        // 图片上传的绝对路径  
//	        String url = request.getSession().getServletContext().getRealPath("") + path;  
	        System.out.println(name);
	        System.out.println(extension);
	        file.transferTo(new File("D:\\image\\" + name +"."+extension));
	        str = name+"."+extension;
	        System.out.println(str);
		}catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}
}
