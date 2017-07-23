package com.shop.service.backorder;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.XxDeliveryCorpMapper;
import com.shop.dao.XxOrderItemMapper;
import com.shop.dao.XxOrderMapper;
import com.shop.dao.XxPaymentMethodMapper;
import com.shop.dao.XxProductMapper;
import com.shop.dao.XxShippingMethodMapper;
import com.shop.entity.XxDeliveryCorp;
import com.shop.entity.XxDeliveryCorpExample;
import com.shop.entity.XxOrder;
import com.shop.entity.XxOrderItem;
import com.shop.entity.XxPaymentMethod;
import com.shop.entity.XxPaymentMethodExample;
import com.shop.entity.XxProduct;
import com.shop.entity.XxShippingMethod;
import com.shop.entity.XxShippingMethodExample;

@Service
public class OrderManageEditServiceImpl implements OrderManageEditService {

	@Resource
    XxPaymentMethodMapper xxPaymentMethodMapper;
	@Resource
	XxShippingMethodMapper xxShippingMethodMapper;
	@Resource
	XxDeliveryCorpMapper xxDeliveryCorpMapper;
	@Resource
	XxOrderMapper xxOrderMapper;
	@Resource
	XxOrderItemMapper xxOrderItemMapper;
	@Resource
	XxProductMapper xxProductMapper;
	@Override
	public List<XxPaymentMethod> getPmethod() {
		return xxPaymentMethodMapper.selectByExampleWithBLOBs(new XxPaymentMethodExample());
	}
	@Override
	public List<XxShippingMethod> getSmethod() {
		return xxShippingMethodMapper.selectByExampleWithBLOBs(new XxShippingMethodExample());
	}
	@Override
	public List<XxDeliveryCorp> getDeliveryCorp() {
		return xxDeliveryCorpMapper.selectByExample(new XxDeliveryCorpExample());
	}
	
	@Override
	public void updateedit(XxOrder order) {
		XxPaymentMethod x=xxPaymentMethodMapper.selectByPrimaryKey(order.getShippingMethod());
		XxShippingMethod xx=xxShippingMethodMapper.selectByPrimaryKey(order.getShippingMethod());
		order.setPaymentMethodName(x.getName());
		order.setShippingMethodName(xx.getName());
		xxOrderMapper.updateByPrimaryKeySelective(order);
	}
	@Override
	public void updateedit1(List<XxOrderItem> orderItems) {
		for(XxOrderItem x:orderItems){
			xxOrderItemMapper.updateByPrimaryKeySelective(x);
		}
		
	}
	@Override
	public XxOrderItem getOrderItem(String productSn, Long id) {
		XxProduct xx=xxProductMapper.getProductBySn(productSn);
		XxOrderItem xxo=new XxOrderItem();
		xxo.setCreateDate(new Date());
		xxo.setModifyDate(new Date());
		xxo.setFullName(xx.getFullName());
		xxo.setIsGift(xx.getIsGift());
		xxo.setName(xx.getName());
		xxo.setPrice(xx.getPrice());
		xxo.setQuantity(1);
		xxo.setReturnQuantity(0);
		xxo.setShippedQuantity(0);
		xxo.setSn(xx.getSn());
		xxo.setOrders(id);
		xxo.setProduct(xx.getId());
		xxOrderItemMapper.insert(xxo);
		return xxo;
	}
	@Override
	public int getcount(Long id) {
		return xxOrderItemMapper.getcount(id);
	}
	@Override
	public void delById(Long id) {
		xxOrderItemMapper.deleteByPrimaryKey(id);
		
	}
	@Override
	public XxPaymentMethod findPaymentMethodById(Long id) {
		return xxPaymentMethodMapper.selectByPrimaryKey(id);
	}
	@Override
	public XxShippingMethod findShippingMethodById(Long id) {
		return xxShippingMethodMapper.selectByPrimaryKey(id);
	}


}
