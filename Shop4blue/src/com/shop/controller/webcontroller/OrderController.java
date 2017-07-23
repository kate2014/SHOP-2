package com.shop.controller.webcontroller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxCart;
import com.shop.entity.XxCartItem;
import com.shop.entity.XxMember;
import com.shop.entity.XxOrder;
import com.shop.entity.XxPaymentMethod;
import com.shop.entity.XxProduct;
import com.shop.entity.XxProductProductImage;
import com.shop.entity.XxReceiver;
import com.shop.entity.XxShippingMethod;
import com.shop.service.backorder.OrderManageEditService;
import com.shop.service.backstage.AreaService;
import com.shop.service.websevice.CartService;
import com.shop.service.websevice.MemberPreService;
import com.shop.service.websevice.OrderShopService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	CartService cartService;
	@Autowired
	OrderShopService orderService;
	@Autowired
	OrderManageEditService orderManageEditService;
	@Autowired
	AreaService areaService;
	@Autowired
	MemberPreService memberPreService;
	
	@RequestMapping("/info")
	public String info(HttpSession session,Model model){
		XxMember user = (XxMember) session.getAttribute("user");
		// 设置收获地址
		List<XxReceiver> receivers = orderService.findReceiversByMemberId(user.getId());
		user.setReceivers(receivers);
		XxCart cart = cartService.findCartByUserId(user.getId());
		List<XxCartItem> cartItems = cartService.findCartItemsByCartId(cart.getId());
		for(XxCartItem ci : cartItems){
			ci.setXxCart(cart);
			XxProduct product = cartService.findProductById(ci.getProduct());
			// 查图片 只想用一张  不写了
			List<XxProductProductImage> list = orderService.findProductImageByProductId(product.getId());
			product.setProductImages(list);
			ci.setXxProduct(product);
		}
		cart.setCartItems(cartItems);
		user.setXxMemberRank(cartService.findMemberRankById(user.getId()));
		cart.setXxMember(user);
		XxOrder order = orderService.build(cart, null, null, null, null, false, null, false, null);
		model.addAttribute("order", order);
		model.addAttribute("paymentMethods", orderManageEditService.getPmethod());
		model.addAttribute("shippingMethods", orderManageEditService.getSmethod());
		
		return "shop/cart/orderinfo";
	}
	
	/**
	 * 保存收货地址
	 */
	@RequestMapping(value = "/save_receiver", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> saveReceiver(HttpSession session,XxReceiver receiver, Long areaId) {
		Map<String, Object> data = new HashMap<String, Object>();
		receiver.setArea(areaId);
		XxMember member = (XxMember) session.getAttribute("user");
		member.setReceivers(orderService.findReceiversByMemberId(member.getId()));
		if (XxReceiver.MAX_RECEIVER_COUNT != null && member.getReceivers().size() >= XxReceiver.MAX_RECEIVER_COUNT) {
			data.put("message", "error");
			return data;
		}
		receiver.setAreaName(areaService.find(areaId).getFullName());
		receiver.setMember(member.getId());
		receiver.setCreateDate(new Date());
		if(receiver.getIsDefault()){
			memberPreService.updateReceiverDefaultByMemberId(member.getId());
		}
		receiver.setModifyDate(new Date());
		orderService.saveReceiver(receiver);
		System.err.println("receiverid=================="+receiver.getId());
		data.put("message", "success");
		data.put("receiver", receiver);
		return data;
	}
	
	/**
	 * 计算
	 */
	@RequestMapping(value = "/calculate", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> calculate(HttpSession session,Long paymentMethodId, Long shippingMethodId, String code, @RequestParam(defaultValue = "false") Boolean isInvoice, String invoiceTitle, @RequestParam(defaultValue = "false") Boolean useBalance, String memo) {
		Map<String, Object> data = new HashMap<String, Object>();
		XxMember user = (XxMember) session.getAttribute("user");
		XxCart cart = cartService.findCartByUserId(user.getId());
		List<XxCartItem> cartItems = cartService.findCartItemsByCartId(cart.getId());
		for(XxCartItem ci : cartItems){
			ci.setXxCart(cart);
			XxProduct product = cartService.findProductById(ci.getProduct());
			// 查图片 只想用一张  不写了
			List<XxProductProductImage> list = orderService.findProductImageByProductId(product.getId());
			product.setProductImages(list);
			ci.setXxProduct(product);
		}
		cart.setCartItems(cartItems);
		user.setXxMemberRank(cartService.findMemberRankById(user.getId()));
		cart.setXxMember(user);
		
		XxPaymentMethod paymentMethod = orderManageEditService.findPaymentMethodById(paymentMethodId);
		XxShippingMethod shippingMethod = orderManageEditService.findShippingMethodById(shippingMethodId);
		//CouponCode couponCode = couponCodeService.findByCode(code);
		XxOrder order = orderService.build(cart, null, paymentMethod, shippingMethod, null, isInvoice, invoiceTitle, useBalance, memo);
		data.put("message", "success");
		data.put("quantity", order.getQuantity());
		data.put("price", order.getPrice());
		data.put("freight", order.getFreight());
		data.put("promotionDiscount", order.getPromotionDiscount());
		data.put("couponDiscount", order.getCouponDiscount());
		data.put("tax", order.getTax());
		data.put("amountPayable", order.getAmountPayable());
		return data;
	}
	
	/**
	 * 创建
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> create(HttpSession session,String cartToken, Long receiverId, Long paymentMethodId, Long shippingMethodId, String code, @RequestParam(defaultValue = "false") Boolean isInvoice, String invoiceTitle, @RequestParam(defaultValue = "false") Boolean useBalance, String memo) {
		Map<String, Object> data = new HashMap<String, Object>();
		XxMember user = (XxMember) session.getAttribute("user");
		XxCart cart = cartService.findCartByUserId(user.getId());
		List<XxCartItem> cartItems = cartService.findCartItemsByCartId(cart.getId());
		for(XxCartItem ci : cartItems){
			ci.setXxCart(cart);
			XxProduct product = cartService.findProductById(ci.getProduct());
			// 查图片 只想用一张  不写了
			List<XxProductProductImage> list = orderService.findProductImageByProductId(product.getId());
			product.setProductImages(list);
			ci.setXxProduct(product);
		}
		cart.setCartItems(cartItems);
		user.setXxMemberRank(cartService.findMemberRankById(user.getId()));
		cart.setXxMember(user);
		
		if (cart.getIsLowStock()) {
			data.put("message", "error");
			return data;
		}
		XxReceiver receiver = orderService.findReceiversById(receiverId);
		if (receiver == null) {
			data.put("message", "error");
			return data;
		}
		XxPaymentMethod paymentMethod = orderManageEditService.findPaymentMethodById(paymentMethodId);
		if (paymentMethod == null) {
			data.put("message", "error");
			return data;
		}
		XxShippingMethod shippingMethod = orderManageEditService.findShippingMethodById(shippingMethodId);
		if (shippingMethod == null) {
			data.put("message", "error");
			return data;
		}
		XxOrder order = orderService.create(cart, receiver, paymentMethod, shippingMethod, null, isInvoice, invoiceTitle, useBalance, memo, null);
		
		data.put("message", "success");
		data.put("sn", order.getSn());
		return data;
	}
	
	/**
	 * 支付
	 */
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment(String sn, Model model) {
		XxOrder order = orderService.findOrderBySn(sn);
		System.err.println("====================");
		System.err.println(order.getSn());
		System.err.println(order.getAmountPaid());
		model.addAttribute("order", order);
		return "/shop/cart/payment";
	}

	
}
