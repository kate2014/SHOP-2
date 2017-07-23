package com.shop.service.backstage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxProductMapper;
import com.shop.dao.XxReviewMapper;
import com.shop.entity.XxProduct;
import com.shop.entity.XxReview;


/**
 * 评论管理Service
 * @author czty
 *
 */
@Service(value="commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	XxReviewMapper reviewMapper;
	@Autowired
	XxProductMapper productMapper;
	@Override
	public List<Map<String, Object>> getAllComment(int pages,int rowss,String type) {
		int max=0;int min=0;
		if("all".equals(type)){
			max=6;
			min=0;
		}else if("good".equals(type)){
			max=6;
			min=3;
		}else if("middle".equals(type)){
			max=4;
			min=1;
		}else{
			max=2;
			min=0;
		}
		int page=(pages-1)*rowss;
		Map<String,Integer> map=new HashMap<>();
		map.put("page",page);
		map.put("rowss",rowss);
		map.put("max",max);
		map.put("min",min);
		System.out.println(rowss);
		List<Map<String,Object>> list=reviewMapper.selectAll(map);
		return list;
	}
	@Override
	public int selectCount() {
		int count=reviewMapper.selectCount();
		return count;
	}
	@Override
	public XxReview selectByPrimaryKey(Long id) {
		XxReview xxReview=reviewMapper.selectByPrimaryKey(id);
		return xxReview;
	}
	@Override
	public int editerComment(XxReview xxReview) {
		reviewMapper.updateByPrimaryKeySelective(xxReview);
		return 0;
	}
	public int deleteByPrimarykey(Long id){
		reviewMapper.deleteByPrimaryKey(id);
		return 0;
	}
}
