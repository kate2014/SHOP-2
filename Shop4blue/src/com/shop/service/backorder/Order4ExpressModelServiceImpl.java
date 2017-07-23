package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxDeliveryTemplateMapper;
import com.shop.entity.XxDeliveryTemplate;
import com.shop.entity.XxDeliveryTemplateExample;

@Service
public class Order4ExpressModelServiceImpl implements Order4ExpressModelService {
	@Autowired
	private XxDeliveryTemplateMapper xdtm;
	@Override
	public List<Map<String, Object>> getExpressModel(Map<String, Object> map) {
          List<Map<String,Object>> list = xdtm.selctExpressModel(map);
		  return list;
	}
	@Override
	public int selectExpressModelCount() {
		int size = xdtm.countByExample(new XxDeliveryTemplateExample());
		return size;
	}
	@Override
	public void addExpress(XxDeliveryTemplate xdt) {
		xdtm.insert(xdt);
	}
	@Override
	public XxDeliveryTemplate selectDeliveryTemplatebyId(Long id) {
		XxDeliveryTemplate xdt = xdtm.selectByPrimaryKey(id);
		return xdt;
	}
	@Override
	public void updateExpressModel(XxDeliveryTemplate xdt) {
                 xdtm.updateByPrimaryKey(xdt);		
	}
}
