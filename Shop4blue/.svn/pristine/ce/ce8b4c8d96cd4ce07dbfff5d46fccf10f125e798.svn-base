package com.shop.controller.backorder;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.XxOrder;
import com.shop.entity.XxOrderItem;
import com.shop.entity.XxPaymentMethod;
import com.shop.entity.XxShippingMethod;
import com.shop.service.backorder.Order4ManageService;
import com.shop.service.backorder.OrderManageEditService;

@Controller
@RequestMapping("/manageedit")
public class OrderManageEditController {

	@Autowired
	Order4ManageService orderManagerService;
	@Autowired
	OrderManageEditService orderManageEditService;

	@RequestMapping("/selectedit")
	public String selectEdit(Model model, Long id) {

		// 1 订单信息 order
		// 2 商品信息 orderItem
		XxOrder order = orderManagerService.selectById(id);
		List<XxOrderItem> orderItem = orderManagerService.selectByOrderId(id);
		order.setOrderItems(orderItem);
		// 支付方式
		List<XxPaymentMethod> pmethod = orderManageEditService.getPmethod();
		// 配送方式
		List<XxShippingMethod> smethod = orderManageEditService.getSmethod();
		int count = orderManageEditService.getcount(id);
		model.addAttribute("count", count);
		model.addAttribute("pmethod", pmethod);
		model.addAttribute("smethod", smethod);
		model.addAttribute("order", order);
		model.addAttribute("orderItem", orderItem);
		return "backstage/order/ordermanageedit1";
	}

	@RequestMapping("/updateedit")
	public String updateEdit(XxOrder order) {
		orderManageEditService.updateedit(order);
		orderManageEditService.updateedit1(order.getOrderItems());
		return "redirect:/ordermanage/list";
	}

	@RequestMapping("/editadd")
	public @ResponseBody XxOrderItem editadd(String productSn, Long id) {
		XxOrderItem orderItem = orderManageEditService.getOrderItem(productSn, id);
		return orderItem;
	}

	@RequestMapping("/editdel")
	public String editdel(Long pid, Long id) {
		orderManageEditService.delById(pid);
		return "redirect:selectedit?id=" + id;
	}

}
