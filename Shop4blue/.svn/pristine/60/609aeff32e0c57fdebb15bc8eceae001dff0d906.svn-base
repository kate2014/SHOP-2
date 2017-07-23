package com.shop.controller.webcontroller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxCart;
import com.shop.entity.XxCartItem;
import com.shop.entity.XxMember;
import com.shop.entity.XxProduct;
import com.shop.service.websevice.CartService;
import com.shop.service.websevice.OrderShopService;
import com.shop.utils.GenerateSn;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	CartService cartService;
	
	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody
	String add(Long id, Integer quantity, HttpServletRequest request, HttpServletResponse response) {
		
		if (quantity == null || quantity < 1) {
			return "error";
		}
		XxProduct product = cartService.findProductById(id);
		if (product == null) {
			return "error";
		}
		if (!product.getIsMarketable()) {
			return "error";
		}
		XxMember member = (XxMember) request.getSession().getAttribute("user");
		XxCart cart = cartService.findCartByUserId(member.getId());

		if (cart == null) {
			cart = new XxCart();
			cart.setCartKey(UUID.randomUUID().toString() + GenerateSn.generate());
			cart.setMember(member.getId());
			cart.setCreateDate(new Date());
			cart.setModifyDate(new Date());
			cartService.insertCart(cart);
		}
		
		List<XxCartItem> cis = cartService.findCartItemsByCartId(cart.getId());
		boolean flag=true;
		for(XxCartItem ci : cis){
			if(ci.getProduct()==product.getId()){
				ci.setQuantity(quantity+ci.getQuantity());
				flag=false;
				cartService.updateCartItem(ci);
			}
		}
		if(flag){
			XxCartItem cartItem = new XxCartItem();
			cartItem.setQuantity(quantity);
			cartItem.setProduct(product.getId());
			cartItem.setCart(cart.getId());
			cartItem.setCreateDate(new Date());
			cartItem.setModifyDate(new Date());
			cartItem.setQuantity(quantity);
			cartService.insertCartItem(cartItem);
		}		
		List<XxCartItem> list = cartService.findCartItemsByCartId(cart.getId());
		for(XxCartItem ci:list){
			XxProduct p = cartService.findProductById(ci.getProduct());
			ci.setXxProduct(p);
			ci.setXxCart(cart);
		}
		cart.setCartItems(list);
		member.setXxMemberRank(cartService.findMemberRankById(member.getMemberRank()));
		cart.setXxMember(member);
		

		String s = "您选购的商品已加入购物车购物车共有"+cart.getQuantity()+"件商品，合计:￥"+cart.getEffectivePrice();
		return s;
	}

	
	
	/**
	 * 查询购物车及购物项
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/tocart")
	public String toCart(HttpSession session,Model model){
		XxMember user = (XxMember) session.getAttribute("user");
		XxCart cart = cartService.findCartByUserId(user.getId());
		if(cart!=null){
			// 设置会员
			cart.setXxMember(user);
			List<XxCartItem> cartItems = cartService.findCartItemsByCartId(cart.getId());
			// 设置购物项的购物车
			for(XxCartItem cartItem : cartItems){
				cartItem.setXxCart(cart);
			}
			cart.setCartItems(cartItems);
			// 设置商品的会员价  会员的会员等级
			cartService.setMemberPrice(cart);
			model.addAttribute("cartItems", cartItems);
		}
		
		model.addAttribute("cart", cart);
		return "shop/cart/shoppingcart";
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> edit(HttpSession session,Long id, Integer quantity) {
		System.err.println("====================编辑");
		Map<String, Object> data = new HashMap<String, Object>();
		if (quantity == null || quantity < 1) {
			data.put("message", "error");
			return data;
		}
		XxCartItem cartItem = cartService.findCartItemById(id);
		// 查购物车
		XxCart cart = cartService.findCartById(cartItem.getCart());
		// 查询会员及设置会员等级
		XxMember user = (XxMember)session.getAttribute("user");
		user.setXxMemberRank(cartService.findMemberRankById(user.getMemberRank()));
		cart.setXxMember(user);
		List<XxCartItem> cis = cartService.findCartItemsByCartId(cart.getId());
		cart.setCartItems(cis);
		// 设置购物项的购物车
		for(XxCartItem ci : cis){
			ci.setXxProduct(cartService.findProductById(ci.getProduct()));
			ci.setXxCart(cart);
		}
		// 设置商品的会员价  会员的会员等级
		cartService.setMemberPrice(cart);
		if (cart == null || cart.isEmpty()) {
			data.put("message", "error");
			return data;
		}
		
		List<XxCartItem> cartItems = cart.getCartItems();
		if (cartItem == null || cartItems == null ) {
			data.put("message", "error");
			return data;
		}
		if (XxCartItem.MAX_QUANTITY != null && quantity > XxCartItem.MAX_QUANTITY) {
			data.put("message", "error");
			return data;
		}
		// 查询当前购物项的商品
		cartItem.setXxProduct(cartService.findProductById(cartItem.getProduct()));
		cartItem.setXxCart(cart);
		XxProduct product = cartItem.getXxProduct();
		if (product.getStock() != null && quantity > product.getAvailableStock()) {
			data.put("message", "error");
			return data;
		}
		cartItem.setQuantity(quantity);
		cartService.updateCartItem(cartItem);
		System.err.println("==========="+cartItem.getXxCart().getXxMember().getMemberRank());
		data.put("message", "success");
		data.put("subtotal", cartItem.getSubtotal());
		data.put("isLowStock", cartItem.getIsLowStock());
		data.put("quantity", cart.getQuantity());
		data.put("effectivePoint", cart.getEffectivePoint());
		data.put("effectivePrice", cart.getEffectivePrice());
		// 没积分没礼物  烦！！！
		/*data.put("promotions", cart.getPromotions());
		data.put("giftItems", cart.getGiftItems());*/
		return data;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> delete(HttpSession session,Long id) {
		Map<String, Object> data = new HashMap<String, Object>();
		XxCartItem cartItem = cartService.findCartItemById(id);
		// 查购物车
		cartService.deleteCartItemById(id);
		XxCart cart = cartService.findCartById(cartItem.getCart());
		List<XxCartItem> cartItems = cartService.findCartItemsByCartId(cart.getId());
		for(XxCartItem ci : cartItems){
			ci.setXxCart(cart);
			ci.setXxProduct(cartService.findProductById(ci.getProduct()));
		}
		cart.setCartItems(cartItems);
		XxMember user = (XxMember) session.getAttribute("user");
		user.setXxMemberRank(cartService.findMemberRankById(user.getId()));
		cart.setXxMember(user);
		cartService.setMemberPrice(cart);
		
		data.put("message", "success");
		data.put("quantity", cart.getQuantity());
		data.put("effectivePoint", cart.getEffectivePoint());
		data.put("effectivePrice", cart.getEffectivePrice());
		return data;
	}
	
	/**
	 * 清空
	 */
	@RequestMapping(value = "/clear", method = RequestMethod.POST)
	public @ResponseBody
	String clear(HttpSession session) {
		XxMember user = (XxMember) session.getAttribute("user");
		XxCart cart = cartService.findCartByUserId(user.getId());
		// 删除购物车项
		List<XxCartItem> list = cartService.findCartItemsByCartId(cart.getId());
		for(XxCartItem ci : list){
			cartService.deleteCartItemById(ci.getId());
		}
		// 清空购物车
		cartService.deleteCart(cart);
		return "success";
	}

}
