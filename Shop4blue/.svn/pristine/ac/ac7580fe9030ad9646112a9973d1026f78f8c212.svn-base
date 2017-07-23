package com.shop.controller.webcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.XxArticle;
import com.shop.entity.XxArticleCategory;
import com.shop.service.websevice.ArticleService;

@Controller
@RequestMapping("/")
public class ArticleController {

	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/article")
	public String getArticle(@RequestParam Long id,Model model){
		//增加该文章访问量
		articleService.updateHits(id);
		
		//左侧文章类别列表  ------热点分类
		List<XxArticleCategory> lac = articleService.getArticleCategory();
		model.addAttribute("articleCategory",lac);
		
		//热点文章
		List<XxArticle> list = articleService.selectOrderByHits();
		model.addAttribute("hotArticle",list);
		
		//文章上方大标题
		XxArticleCategory pan = articleService.getParentArticleName(id);
		model.addAttribute("articleTag",pan);
				
				
		//文章内容
		List<XxArticle>  article= articleService.getArticle(id);
		System.out.println(article);
		model.addAttribute("article",article);
		
		
		return "shop/article";
	}
	
	/**
	 * 根据分类id查询 其下属article
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/articleByTag")
	public String getArticleByTagId(@RequestParam Long id,Model model){
		
		//左侧文章类别列表  ------热点分类
		List<XxArticleCategory> lac = articleService.getArticleCategory();
		model.addAttribute("articleCategory",lac);
				
		//热点文章
		List<XxArticle> list = articleService.selectOrderByHits();
		model.addAttribute("hotArticle",list);
		
		//文章上方大标题
		XxArticleCategory articleName = articleService.getArticleName(id);
		model.addAttribute("articleTag",articleName);
		
		//获得标签id为 id 的标签下的所有文章
		List<XxArticle> articles = articleService.getArticleByCategoryId(id);
		model.addAttribute("articles",articles);
		
		return "shop/article";
	}
}
