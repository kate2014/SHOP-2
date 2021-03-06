package com.shop.service.backgoods;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.XxProductNotifyMapper;
import com.shop.entity.XxProductNotify;
import com.shop.entity.XxProductNotifyExample;

@Service
public class GoodsMessageServiceImpl implements GoodsMessageService {

	@Resource
	private XxProductNotifyMapper xpnm;
	@Override
	public List<XxProductNotify> getAll(Map<String,Object> map) {
		List<XxProductNotify> list=xpnm.getAll(map);
        return list;
	}
	@Override
	public int selectcount() {
            int size = xpnm.countByExample(new XxProductNotifyExample());
		return size;
	}
	@Override
	public void sendMessage(Long long1) {
		XxProductNotify xx=xpnm.selectByPrimaryKey(long1);
		xx.setHasSent(true);
		xpnm.updateByPrimaryKeySelective(xx);
	}
	@Override
	public void insert(Long productId, String email, Long userid) {
		XxProductNotify xxProductNotify=new XxProductNotify();
		xxProductNotify.setCreateDate(new Date());
		xxProductNotify.setModifyDate(new Date());
		xxProductNotify.setEmail(email);
		xxProductNotify.setProduct(productId);
		xxProductNotify.setMember(userid);
		xxProductNotify.setHasSent(false);
		xxProductNotify.setDel(false);
		xpnm.insertSelective(xxProductNotify);
	}
	@Override
	public XxProductNotify findProductNotifyById(Long id) {
		return xpnm.selectByPrimaryKey(id);
	}

}
