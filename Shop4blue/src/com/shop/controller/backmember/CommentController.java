package com.shop.controller.backmember;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.dao.XxProductMapper;
import com.shop.entity.XxProduct;
import com.shop.entity.XxReview;
import com.shop.service.backstage.CommentService;

import cn.itcast.utils.Page;

/**
 * 评论管理
 * @author czty
 *
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
	// 注入service
	@Autowired
	CommentService commentService;
	@Autowired
	XxProductMapper productMapper;
	@RequestMapping("/comment")
	public String getAllComment(Model model,Integer page,@RequestParam(value="rows",defaultValue="5") Integer rowss,@RequestParam(value="type",defaultValue="all") String type){
		if(page==null){
			page=1;
		}
		List<Map<String,Object>> list=commentService.getAllComment(page,rowss,type);
		for(Map<String,Object> map:list){
			System.err.println(map.get("id")+","+map.get("is_show"));
		}
		
		Page<Map<String,Object>> pages = new Page<>();
		pages.setTotal(commentService.selectCount());//数据总数
		pages.setSize(rowss);//每页显示条数
		pages.setPage(page);//当前页数
		pages.setRows(list);//数据列表
		model.addAttribute("page",pages);
		model.addAttribute("count",commentService.selectCount());
		return "backstage/user/comment";
	}
	
	@RequestMapping("/commentedit")
	public String editComment(HttpServletRequest request,Model model){
		String id=request.getParameter("id");
		XxReview xxReview=commentService.selectByPrimaryKey(Long.valueOf(id));
		XxProduct xxProduct=productMapper.selectByPrimaryKey(xxReview.getProduct());
		model.addAttribute("xxReview",xxReview);
		model.addAttribute("xxProduct",xxProduct);
		return "backstage/user/commentedit";
	}
	@RequestMapping("/commentediter")
	public String editerComment(XxReview xxReview){
		System.out.println(xxReview.getId()+","+xxReview.getIsShow());
		if(xxReview.getIsShow()==null){
			xxReview.setIsShow(false);
		}
		else{
			xxReview.setIsShow(true);
		}
		System.out.println(xxReview.getIsShow());
		commentService.editerComment(xxReview);
		return "redirect:comment";
	}
	@RequestMapping("/deleteComment/{del}")
	public String deleteComment(@PathVariable List<Long> del){
		for(Long id:del){
			commentService.deleteByPrimarykey(id);
		}
		return "redirect:/comment/comment";
	}
}
