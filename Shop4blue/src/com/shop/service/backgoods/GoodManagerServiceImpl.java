package com.shop.service.backgoods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.XxAttributeMapper;
import com.shop.dao.XxProductMapper;
import com.shop.dao.XxPromotionMapper;
import com.shop.entity.XxAttribute;
import com.shop.entity.XxGoods;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductExample;
import com.shop.entity.XxProductMemberPrice;
import com.shop.entity.XxProductParameterValue;
import com.shop.entity.XxProductParameterValueKey;
import com.shop.entity.XxPromotion;
import com.shop.entity.XxPromotionExample;
import com.shop.entity.XxTag;

@Service
public class GoodManagerServiceImpl implements GoodManagerService {
	@Autowired
	private XxProductMapper xpm;
	@Autowired
	private XxAttributeMapper xam;
	@Resource
	XxPromotionMapper xxPromotionMapper;
	public List<Map<String, Object>> getProduct(Map<String, Object> map) {
		List<Map<String,Object>> list = xpm.getProduct(map);
		return list;
	}

	@Override
	public int selectProductCount(Map<String, Object> map) {
		int count = xpm.getCount(map);
		return count;
	}

	@Override
	public List<XxAttribute> ajaxGetproperty(Long id) {
      List<XxAttribute> attr = xam.selectById(id);
		return attr;
	}

	@Override
	public List<XxTag> getTags() {
		return xpm.getTags();
	}

	@Override
	public Long insertInToByEntity(XxProduct xxProduct) {
 		return xpm.insertInToByEntity(xxProduct);
	}

	@Override
	public void addXxProductMemberPrice(Map map) {
         xpm.insertInToMemberPrice(map);		
	}

	@Override
	public void addXxProductProductImage(Map map) {
		xpm.insertInToProductImage(map);		
	}

	@Override
	public void addTags(Map map) {
		xpm.addTag(map);
	}

	@Override
	public void addparameterValueKey(Map map) {
		xpm.addParameterValueKey(map);
	}

	@Override
	public void addSpecification(Map map) {
		xpm.addSpecification(map);
	}

	@Override
	public void addSpecificationValue(Map map) {
		xpm.addSpecificationValue(map);
	}

	@Override
	public Long addGoods(XxGoods  goods) {
			return  xpm.addGoods(goods);	
	}

	@Override
	public XxProduct finOne(Long id) {
		return xpm.findOne(id);
	}

	@Override
	public XxProduct getOneProduct(Long id) {
		return xpm.selectByPrimaryKey(id);
	}

	@Override
	public XxProduct findOneProduct(Long id) {
		return xpm.findONeProduct(id);
	}

	@Override
	public List<Map<String,Object>> getmemberPrice(Long id) {
		return xpm.getMemberPrice(id);
	}

	@Override
	public List<Map<String, Object>> getTagByProductId(Long id) {
		return xpm.getTagsByProductId(id);
	}

	@Override
	public List<Map<String,Object>> getParameterValueById(Long id) {
		return xpm.getParameterValueById(id);
	}

	@Override
	public List<Map<String,Object>> getParameterValueKeyById(Long id) {
		return xpm.getParameterValueKeyById(id);
	}

	@Override
	public List<Map<String, Object>> getSpecifiCationById(Long id) {
		return xpm.getSpecifiCationById(id);
	}

	@Override
	public List<Map<String, Object>> getsdjklghkghajksgh(Long id) {
		return xpm.getSpec(id);
	}

	@Override
	public Long getGoodId(Long id) {
		return xpm.getGoodIdByProductId(id);
	}

	@Override
	public void editProduct(XxProduct xp) {
         xpm.updateByPrimaryKeySelective(xp);		
	}

	@Override
	public void deleteTagsByProductId(Long id) {
xpm.deleteTagsByProductId(id);		
	}

	@Override
	public void deleteImagesByProductId(Long id) {
		xpm.deleteImagesByProductId(id);		
	}

	@Override
	public void deleteParameterByProductId(Long id) {
        xpm.deleteParameterByProductId(id);		
	}

	@Override
	public void deleteSpecificationByProductId(Long id) {
		xpm.deleteSpecificationByProductId(id);		
	}

	@Override
	public void deleteSpecificationValueByProductId(Long id) {
		xpm.deleteSpecificationValueByProductId(id);
		
	}

	@Override
	public void delMemberPriceByProductId(Long id) {
        xpm.deleteMemberPriceByProductId(id);		
	}

	@Override
	public List<XxPromotion> getPromotion() {
		return xxPromotionMapper.selectByExample(new XxPromotionExample());
	}
	
	
}
