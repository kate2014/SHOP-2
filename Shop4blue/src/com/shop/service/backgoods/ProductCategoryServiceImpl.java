package com.shop.service.backgoods;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.XxBrandMapper;
import com.shop.dao.XxProductCategoryBrandMapper;
import com.shop.dao.XxProductCategoryMapper;
import com.shop.entity.XxBrand;
import com.shop.entity.XxBrandExample;
import com.shop.entity.XxProductCategory;
import com.shop.entity.XxProductCategoryBrandKey;
@Service
public class ProductCategoryServiceImpl implements  ProductCategoryService{

	@Resource
	private XxProductCategoryMapper xpcm;
	@Resource
	private XxBrandMapper xbm;
	@Resource
	private XxProductCategoryBrandMapper xpcbm;
	@Override
	public List<XxProductCategory> getAll() {
		List<XxProductCategory> list=xpcm.getAll();
		return list;
	}
	@Override
	public List<XxBrand> getBrand() {
		List<XxBrand> list=xbm.selectByExample(new XxBrandExample());
		return list;
	}
	@Override
	public void insertPC(XxProductCategory xpc,long brandIds[]) {
		xpcm.insertSelective(xpc);
		for(long i:brandIds){
	    XxProductCategoryBrandKey  xpcb=new XxProductCategoryBrandKey();
	    xpcb.setProductCategories(xpc.getId());
	    xpcb.setBrands(i);
		xpcbm.insertSelective(xpcb);
		}
	}
	@Override
	public XxProductCategory selectEdit(long id) {
		XxProductCategory xpc=xpcm.selectByPrimaryKey(id);
		return xpc;
	}
	@Override
	public List<Long>  getBrands(long id) {
		List<Long> brands=xpcbm.getBrands(id); 
		return brands;
	}
	@Override
	public void updateEdit(XxProductCategory xpc, Long[] brandIds) {
		xpcm.updateByPrimaryKeySelective(xpc);
		List<Long> brands=xpcbm.getBrands(xpc.getId());
		XxProductCategoryBrandKey xx = new XxProductCategoryBrandKey();
		if(brandIds!=null){
		for(Long b:brandIds){
			int temp=1;
			if(brands!=null){
			for(Long br:brands){
				if(b==br) temp=0;
			}
			}
			if(temp==1){
				xx.setProductCategories(xpc.getId());
				xx.setBrands(b);
				xpcbm.insert(xx);
			}
		}
		}
		if(brands!=null){
		for(Long br:brands){
			int temp=1;
			if(brandIds!=null){
			for(Long b:brandIds){
				if(br==b) temp=0;
			}
			}
			if(temp==1){
				xx.setProductCategories(xpc.getId());
				xx.setBrands(br);
				xpcbm.deleteByPrimaryKey(xx);
			}
		}
		}
		
	}
	
	

}
