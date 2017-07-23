package com.shop.service.websevice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxProductCategoryMapper;
import com.shop.dao.XxProductMapper;
import com.shop.dao.XxProductParameterValueMapper;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductCategory;
import com.shop.entity.XxProductCategoryExample;
import com.shop.entity.XxProductExample;
import com.shop.entity.XxProductParameterValue;

@Service
public class ShopContentServiceImpl implements ShopContentService{

	/**
	 *  获得商品信息页面的大标签
	 */
	@Autowired
	private XxProductCategoryMapper xxProductCategoryMapper;
	@Autowired
	private XxProductMapper xxProductMapper;
	@Autowired
	private XxProductParameterValueMapper xppvm;
	@Override
	public XxProductCategory bigTagName(Long id) {
		return  xxProductMapper.selectById(id);
	}
	/**
	 * 小标签
	 */
	@Override
	public List<XxProductCategory> smallTagName(Long id) {
		XxProductExample xpe=new XxProductExample();
		xpe.createCriteria().andIdEqualTo(id);
		List<XxProduct> list=xxProductMapper.selectByExample(xpe);
		
		XxProductCategoryExample xpce=new XxProductCategoryExample();
		xpce.createCriteria().andIdEqualTo(list.get(0).getProductCategory());
		return xxProductCategoryMapper.selectByExample(xpce);
	}
	/**
	 * 通过商品id取出其goods 然后通过goods获得所有product的规格(同一商品的所有规格)
	 */
	@Override
	public List<Map<String, Object>> getProductsByProductGoods(Long id){
		return  xxProductMapper.selectProductsByProductGoods(id);
	}
	/**
	 * 通过商品id  获得其商品规格
	 * (同一商品所有规格的对应的xx_product_spectfication_value的specification_values)
	 */
	@Override
	public List<Map<String,Long>> getSpecificationValuesByProductId(Long id){
		return xxProductMapper.selectSpecifaicationValuesByProductId(id);
	}
	/**
	 * 根据productid  查出所有goods下的 productid
	 */
	@Override
	public List<XxProduct> getProductsByProduct(Long id){
		return xxProductMapper.getProductsByProduct(id);
	}
	
	/**
	 * 商品信息
	 */
	@Override
	public XxProduct productContent(Long id) {
		return xxProductMapper.selectByPrimaryKey(id);
	}
	/**
	 * 商品参数
	 */
	@Override
	public List<XxProductParameterValue> getShopParameter(Long id) {
		return xppvm.selectParameterAndValue(id);
	}
	/**
	 * 商品颜色 尺寸 等规格
	 */
	
}
