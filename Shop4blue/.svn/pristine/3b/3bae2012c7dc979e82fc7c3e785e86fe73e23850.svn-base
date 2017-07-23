package com.shop.controller.webcontroller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.entity.XxAdmin;
import com.shop.entity.XxMember;
import com.shop.entity.XxOrder;
import com.shop.entity.XxOrderItem;
import com.shop.entity.XxPayment;
import com.shop.entity.XxPaymentMethod;
import com.shop.service.backorder.Order4ManageService;
import com.shop.service.websevice.MyOrdersService;
import com.shop.utils.GenerateSn;

@Controller
@RequestMapping("/myorders")
public class MyOrdersController {
	
	@Autowired
	private Order4ManageService orderManagerService;
	@Resource
	private MyOrdersService myOrdersService;
	@Resource
	private Order4ManageService order4ManageService;
	@RequestMapping("/selectall")
	public String selectAll(Long userid,Model model){
		List<XxOrder> orders=myOrdersService.getAllBymember(userid);
		for(XxOrder x:orders){
			List<XxOrderItem> orderItem =order4ManageService.selectByOrderId(x.getId());
			x.setOrderItems(orderItem);
		}
		model.addAttribute("order", orders);
		return "shop/personalcenter/myorders";
	}
	@RequestMapping("/check")
	public String check(Model model,Long id){
		XxOrder order = orderManagerService.selectById(id);
		List<XxOrderItem> orderItem = orderManagerService.selectByOrderId(id);
		order.setOrderItems(orderItem);
		model.addAttribute("order", order);
		return "shop/personalcenter/myorderscheck";
	}
	@RequestMapping("/updateorder")
	public @ResponseBody String updateOrder(Long id){
		XxOrder order=orderManagerService.selectById(id);
		order.setOrderStatus(3);
		orderManagerService.updateOrder(order);
		return "success";
	}
	
	/**
	 * 支付
	 */
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	@ResponseBody
	public String payment(HttpSession session,Long orderId, Long paymentMethodId, XxPayment payment, RedirectAttributes redirectAttributes) {
		XxOrder order = orderManagerService.selectById(orderId);
		List<XxOrderItem> orderItems = orderManagerService.selectByOrderId(order.getId());
		order.setOrderItems(orderItems);
		if(paymentMethodId==null){
			paymentMethodId=1l;
		}
		if(payment.getMethod()==null){
			payment.setMethod(3);
		}
		payment.setOrders(order.getId());
		XxPaymentMethod paymentMethod = orderManagerService.findPaymentMethodById(paymentMethodId);
		payment.setPaymentMethod(paymentMethod != null ? paymentMethod.getName() : null);
		
		if (order.isExpired() || order.getOrderStatus() != 1) {
			return "error1";
		}
		if (order.getPaymentStatus() != 0 && order.getPaymentStatus() != 1) {
			return "error2";
		}
		System.err.println("======================"+payment.getAmount());
		// 没赋值
		//|| payment.getAmount().compareTo(order.getOrderMoney()) > 0
		if(payment.getAmount()==null){
			payment.setAmount(order.getOrderMoney());
		}
		System.err.println(payment.getAmount());
		if (payment.getAmount().compareTo(new BigDecimal(0)) <= 0 ) {
			return "error3";
		}
		XxMember member = (XxMember) session.getAttribute("user");
		payment.setSn(GenerateSn.generate());
		payment.setType(0);
		payment.setStatus(1);
		payment.setFee(new BigDecimal(0));
		payment.setOperator(member.getUsername());
		payment.setPaymentDate(new Date());
		payment.setPaymentPluginId(null);
		payment.setExpire(null);
		payment.setMember(null);
		payment.setCreateDate(new Date());
		payment.setModifyDate(new Date());
		orderManagerService.addPayment(order, payment, null);
		System.err.println("+++++++++++here");
		return "success";
	}

}
