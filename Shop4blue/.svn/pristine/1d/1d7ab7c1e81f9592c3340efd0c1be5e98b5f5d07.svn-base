package com.shop.service.websevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxArticleCategoryMapper;
import com.shop.dao.XxArticleMapper;
import com.shop.entity.XxArticle;
import com.shop.entity.XxArticleCategory;
import com.shop.entity.XxArticleCategoryExample;
import com.shop.entity.XxArticleExample;

@Service
public class ArticleServiceImpl implements ArticleService{

	
	@Autowired
	private XxArticleCategoryMapper xacm;
	@Autowired
	private XxArticleMapper xam;
	
	/**
	 * 获得所有文章类别
	 */
	@Override
	public List<XxArticleCategory> getArticleCategory(){
		XxArticleCategoryExample xace=new XxArticleCategoryExample();
		xace.createCriteria().andIdIsNotNull();
		return xacm.selectByExample(xace);
	}
	
	
	/**
	 *  通过  文章类别id 获得某一类别下的所有文章
	 */
	@Override
	public List<XxArticle> getArticles(Long id){
		XxArticleExample xae=new XxArticleExample();
		xae.createCriteria().andArticleCategoryEqualTo(id);
		return xam.selectByExample(xae);
	}


	/**
	 * 通过文章id查询某一详细文章
	 */
	@Override
	public List<XxArticle> getArticle(Long id) {
		return xam.selectArticle(id);
	}
	
	/**
	 * 根据标签id获得所有标签下的文章
	 */
	@Override
	public List<XxArticle> getArticleByCategoryId(Long id){
		return xam.selectArticleByCategoryId(id);
	}
	/**
	 * 根据文章id获得其父类实体
	 */
	@Override
	public XxArticleCategory getParentArticleName(Long id){
		return xam.selectParentArticleCategory(id);
	}
	/**
	 * 根据标签ID 获得其实体(xx_article_category)
	 */
	@Override
	public XxArticleCategory getArticleName(Long id){
		return xam.selectArticleCategory(id);
	}
	
	/**
	 * 增加文章点击次数
	 */
	@Override
	public void updateHits(Long id){
		XxArticleExample xae=new XxArticleExample();
		xae.createCriteria().andIdEqualTo(id);
		xam.updateHits(id);
	}
	/**
	 * 按点击量排序文章  -------热门文章
	 */
	@Override
	public List<XxArticle> selectOrderByHits(){
		return xam.selectOrderByHits();
	}
}
