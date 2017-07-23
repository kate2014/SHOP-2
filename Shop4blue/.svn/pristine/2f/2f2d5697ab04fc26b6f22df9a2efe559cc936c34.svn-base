package com.shop.service.websevice;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.XxCartItemMapper;
import com.shop.dao.XxCartMapper;
import com.shop.dao.XxMemberRankMapper;
import com.shop.dao.XxProductMapper;
import com.shop.entity.XxCart;
import com.shop.entity.XxCartItem;
import com.shop.entity.XxMemberRank;
import com.shop.entity.XxProduct;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	XxCartMapper cartMapper;
	@Autowired
	XxCartItemMapper cartItemMapper;
	@Autowired
	XxMemberRankMapper memberRankMapper;
	@Autowired
	XxProductMapper productMapper;

	@Override
	public XxCart findCartByUserId(Long id) {
		return cartMapper.findCartByUserId(id);
	}

	@Override
	public List<XxCartItem> findCartItemsByCartId(Long id) {
		return cartItemMapper.findCartItemsByCartId(id);
	}

	@Override
	public XxCartItem findCartItemById(Long id) {
		return cartItemMapper.selectByPrimaryKey(id);
	}

	@Override
	public XxCart findCartById(Long id) {
		return cartMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateCartItem(XxCartItem cartItem) {
		cartItemMapper.updateByPrimaryKeySelective(cartItem);
	}

	@Override
	public void setMemberPrice(XxCart cart) {
		List<XxMemberRank> memberRanks = memberRankMapper.selectAll();
		for (XxCartItem cartItem : cart.getCartItems()) {
			Map<XxMemberRank, BigDecimal> map = new HashMap<>();
			XxProduct product = cartItem.getXxProduct();
			// 设置会员的会员等级
			if(cart.getXxMember()!=null){
				cart.getXxMember().setXxMemberRank(findMemberRankById(cart.getXxMember().getMemberRank()));
			}
			// 设置商品的会员价
			if(product!=null){
				for (XxMemberRank memberRank : memberRanks) {
					if (cart.getXxMember().getMemberRank() == memberRank.getId() && memberRank.getScale() != null) {
						map.put(memberRank, product.getPrice().multiply(new BigDecimal(memberRank.getScale())));
					}
				}
				product.setMemberPrice(map);
			}
		}
	}

	@Override
	public XxMemberRank findMemberRankById(Long id) {
		return memberRankMapper.selectByPrimaryKey(id);
	}

	@Override
	public XxProduct findProductById(Long id) {
		return productMapper.selectByPrimaryKey(id);
	}

	@Override
	public void deleteCartItemById(Long id) {
		cartItemMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void deleteCart(XxCart cart) {
		cartMapper.deleteByPrimaryKey(cart.getId());
	}

	@Override
	public void insertCart(XxCart cart) {
		cartMapper.insert(cart);
	}

	@Override
	public void insertCartItem(XxCartItem cartItem) {
		cartItemMapper.insert(cartItem);
	}

}
