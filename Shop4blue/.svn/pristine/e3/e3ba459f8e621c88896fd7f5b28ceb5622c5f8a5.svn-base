package com.shop.service.websevice;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.shop.entity.XxCart;
import com.shop.entity.XxCartItem;
import com.shop.entity.XxMemberRank;
import com.shop.entity.XxProduct;

public interface CartService {
	
	/**
     * 根据用户id查询购物车
     * @param id
     * @return
     */
    public XxCart findCartByUserId(Long id);
    
    /**
     * 根据购物车id查询购物车项
     * @param id
     * @return
     */
    public List<XxCartItem> findCartItemsByCartId(Long id);
    
    /**
     * 根据主键查询购物车
     * @param id
     * @return
     */
    public XxCart findCartById(Long id);
    
    /**
     * 根据主键查询购物车项
     * @param id
     * @return
     */
    public  XxCartItem findCartItemById(Long id);
    
    /**
     * 根据主键更新购物车项
     * 数量
     * @param cartItem
     */
    public void updateCartItem(XxCartItem cartItem);
    
    /**
     * 查询设置会员价
     * @param list
     * @return
     */
    public void setMemberPrice(XxCart cart);
    
    /**
     * 根据主键查询会员等级
     * @return
     */
    public XxMemberRank findMemberRankById(Long id);
    
    /**
     * 根据主键查询商品
     * @param id
     * @return
     */
    public XxProduct findProductById(Long id);
    
    /**
     * 根据主键删除购物车项
     * @param id
     */
    public void deleteCartItemById(Long id);
    
    /**
     * 清空购物车
     * @param cart
     */
    public void deleteCart(XxCart cart);
    
    /**
     * 新建购物车
     * @param cart
     */
    public void insertCart(XxCart cart);
    
    /**
     * 新建购物车项
     * @param cartItem
     */
    public void insertCartItem(XxCartItem cartItem);

}
