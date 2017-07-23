package com.shop.service.backorder;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.XxCouponCodeMapper;
import com.shop.dao.XxDeliveryCenterMapper;
import com.shop.dao.XxDeliveryCorpMapper;
import com.shop.dao.XxDeliveryTemplateMapper;
import com.shop.dao.XxDepositMapper;
import com.shop.dao.XxMemberMapper;
import com.shop.dao.XxMemberRankMapper;
import com.shop.dao.XxOrderItemMapper;
import com.shop.dao.XxOrderLogMapper;
import com.shop.dao.XxOrderMapper;
import com.shop.dao.XxPaymentMapper;
import com.shop.dao.XxPaymentMethodMapper;
import com.shop.dao.XxProductMapper;
import com.shop.dao.XxRefundsMapper;
import com.shop.dao.XxReturnsMapper;
import com.shop.dao.XxShippingMapper;
import com.shop.dao.XxShippingMethodMapper;
import com.shop.entity.XxAdmin;
import com.shop.entity.XxCoupon;
import com.shop.entity.XxCouponCode;
import com.shop.entity.XxDeliveryCenter;
import com.shop.entity.XxDeliveryCenterExample;
import com.shop.entity.XxDeliveryCorp;
import com.shop.entity.XxDeliveryTemplate;
import com.shop.entity.XxDeliveryTemplateExample;
import com.shop.entity.XxDeposit;
import com.shop.entity.XxMember;
import com.shop.entity.XxMemberRank;
import com.shop.entity.XxOrder;
import com.shop.entity.XxOrderExample;
import com.shop.entity.XxOrderItem;
import com.shop.entity.XxOrderLog;
import com.shop.entity.XxPayment;
import com.shop.entity.XxPaymentMethod;
import com.shop.entity.XxProduct;
import com.shop.entity.XxRefunds;
import com.shop.entity.XxReturns;
import com.shop.entity.XxReturnsItem;
import com.shop.entity.XxShipping;
import com.shop.entity.XxShippingItem;
import com.shop.entity.XxShippingMethod;

@Service
public class Order4ManageServiceImpl implements Order4ManageService {
	@Autowired
	XxOrderMapper orderMapper;
	@Autowired
	XxOrderItemMapper orderItemMapper;
	@Autowired
	XxDeliveryTemplateMapper deliveryTemplateMapper;
	@Autowired
	XxDeliveryCenterMapper deliveryCenterMapper;
	@Autowired
	XxPaymentMapper paymentMapper;
	@Autowired
	XxShippingMapper shippingMapper;
	@Autowired
	XxRefundsMapper refundsMapper;
	@Autowired
	XxReturnsMapper returnsMapper;
	@Autowired
	XxOrderLogMapper orderLogMapper;
	@Autowired
	XxPaymentMethodMapper paymentMethodMapper;
	@Autowired
	XxMemberMapper memberMapper;
	@Autowired
	XxDepositMapper depositMapper;
	@Autowired
	XxProductMapper productMapper;
	@Autowired
	XxShippingMethodMapper shippingMethodMapper;
	@Autowired
	XxDeliveryCorpMapper deliveryCorpMapper;
	@Autowired
	XxMemberRankMapper memberRankMapper;
	@Autowired
	XxCouponCodeMapper couponCodeMapper;

	@Override
	public List<XxOrder> selectAll(Map<String,Object> map) {
		return orderMapper.findAll(map);
	}

	@Override
	public int totalNum(Map<String,Object> map) {
		return orderMapper.getTotalNum(map);
	}

	@Override
	public XxOrder selectById(Long id) {
		return orderMapper.findById(id);
	}

	@Override
	public List<XxOrderItem> selectByOrderId(Long id) {
		return orderItemMapper.findByOrderId(id);
	}

	@Override
	public List<XxDeliveryTemplate> selectAllTemplate() {
		return deliveryTemplateMapper.selectByExampleWithBLOBs(new XxDeliveryTemplateExample());
	}

	@Override
	public List<XxDeliveryCenter> selectAllCenter() {
		return deliveryCenterMapper.selectByExample(new XxDeliveryCenterExample());
	}

	@Override
	public XxDeliveryTemplate selectTemplateById(Long id) {
		return deliveryTemplateMapper.selectByPrimaryKey(id);
	}

	@Override
	public XxDeliveryCenter selectCenterById(Long id) {
		return deliveryCenterMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<XxPayment> findPaymentByOrderId(Long id) {
		return paymentMapper.findPaymentByOrderId(id);
	}

	@Override
	public XxShipping findShippingByOrderId(Long id) {
		return shippingMapper.findShippingByOrderId(id);
	}

	@Override
	public XxRefunds findRefundsByOrderId(Long id) {
		return refundsMapper.findRefundsByOrderId(id);
	}

	@Override
	public XxReturns findReturnsByOrderId(Long id) {
		return returnsMapper.findReturnsByOrderId(id);
	}

	@Override
	public List<XxOrderLog> findOrderLogByOrderId(Long id) {
		return orderLogMapper.findOrderLogByOrderId(id);
	}

	@Override
	public void updateOrder(XxOrder order) {
		orderMapper.updateByPrimaryKey(order);
	}

	@Override
	public void insertOrderLog(XxOrderLog orderLog) {
		orderLogMapper.insert(orderLog);
	}

	@Override
	public XxPaymentMethod findPaymentMethodById(Long id) {
		return paymentMethodMapper.selectByPrimaryKey(id);
	}
	@Transactional
	@Override
	public void addPayment(XxOrder order, XxPayment payment, XxAdmin admin) {
		payment.setOrders(order.getId());
		// 插入收款单
		//paymentMapper.insert(payment);
		paymentMapper.insert(payment);
		if (payment.getMethod() == 2) {
			XxMember member = order.getXxMember();
			System.err.println(member.getUsername()+"==="+member.getBalance()+"================"+payment.getAmount());
			member.setBalance(member.getBalance().subtract(payment.getAmount()));
			// 更新会员余额
			memberMapper.updateByPrimaryKeySelective(member);
			// 插入预存款
			XxDeposit deposit = new XxDeposit();
			deposit.setType(admin != null ? 4 : 1);
			deposit.setCredit(new BigDecimal(0));
			deposit.setDebit(payment.getAmount());
			deposit.setBalance(member.getBalance());
			deposit.setOperator(admin != null ? admin.getUsername() : null);
			deposit.setMember(member.getId());
			deposit.setOrders(order.getId());
			deposit.setCreateDate(new Date());
			deposit.setModifyDate(new Date());
			depositMapper.insert(deposit);
		}

		List<XxOrderItem> list = orderItemMapper.findByOrderId(order.getId());
		order.setOrderItems(list);
		if (!order.getIsAllocatedStock() ) {
			for (XxOrderItem orderItem : list) {
				if (orderItem != null) {
					XxProduct product = productMapper.selectByPrimaryKey(orderItem.getProduct());
					if (product != null && product.getStock() != null) {
						product.setAllocatedStock(product.getAllocatedStock() + (orderItem.getQuantity() - orderItem.getShippedQuantity()));
						productMapper.updateByPrimaryKeySelective(product);
					}
				}
			}
			order.setIsAllocatedStock(true);
		}

		order.setAmountPaid(order.getAmountPaid().add(payment.getAmount()));
		order.setFee(payment.getFee());
		order.setExpire(null);
		
		if (order.getAmountPaid().compareTo(order.getOrderMoney()) >= 0) {
			order.setOrderStatus(1);
			order.setPaymentStatus(2);
		} else if (order.getAmountPaid().compareTo(new BigDecimal(0)) > 0) {
			order.setOrderStatus(1);
			order.setPaymentStatus(1);
		}
		orderMapper.updateByPrimaryKeySelective(order);

		XxOrderLog orderLog = new XxOrderLog();
		orderLog.setType(3);
		orderLog.setOperator(admin != null ? admin.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(new Date());
		orderLog.setModifyDate(new Date());
		orderLogMapper.insert(orderLog);
		
	}
	@Transactional
	@Override
	public void addrefunds(XxOrder order, XxRefunds refunds, XxAdmin admin) {
		// 插入退款单
		refunds.setOrders(order.getId());
		refundsMapper.insert(refunds);
		if (refunds.getMethod() == 2) {
			// 更新会员的余额
			XxMember member = order.getXxMember();
			member.setBalance(member.getBalance().add(refunds.getAmount()));
			memberMapper.updateByPrimaryKeySelective(member);
			
			// 插入预存款
			XxDeposit deposit = new XxDeposit();
			deposit.setType(5);
			deposit.setCredit(refunds.getAmount());
			deposit.setDebit(new BigDecimal(0));
			deposit.setBalance(member.getBalance());
			deposit.setOperator(admin != null ? admin.getUsername() : null);
			deposit.setMember(member.getId());
			deposit.setOrders(order.getId());
			deposit.setCreateDate(new Date());
			deposit.setModifyDate(new Date());
			depositMapper.insert(deposit);
		}

		// 更新order的状态 退款
		order.setAmountPaid(order.getAmountPaid().subtract(refunds.getAmount()));
		order.setExpire(null);
		if (order.getAmountPaid().compareTo(new BigDecimal(0)) == 0) {
			order.setPaymentStatus(4);
		} else if (order.getAmountPaid().compareTo(new BigDecimal(0)) > 0) {
			order.setPaymentStatus(3);
		}
		orderMapper.updateByPrimaryKeySelective(order);
		
		// 打日志
		XxOrderLog orderLog = new XxOrderLog();
		orderLog.setType(4);
		orderLog.setOperator(admin != null ? admin.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(new Date());
		orderLog.setModifyDate(new Date());
		orderLogMapper.insert(orderLog);
	}

	@Override
	public XxProduct findProductById(Long id) {
		return productMapper.selectByPrimaryKey(id);
	}

	@Override
	public XxShippingMethod findShippingMethodById(Long id) {
		return shippingMethodMapper.selectByPrimaryKey(id);
	}

	@Override
	public XxDeliveryCorp findDeliveryCorpById(Long id) {
		return deliveryCorpMapper.selectByPrimaryKey(id);
	}

	@Transactional
	@Override
	public void addshipping(XxOrder order, XxShipping shipping, XxAdmin admin) {
		if (!order.getIsAllocatedStock()) {
			for (XxOrderItem orderItem : order.getOrderItems()) {
				if (orderItem != null) {
					Long pid = orderItem.getProduct();
					XxProduct product = productMapper.selectByPrimaryKey(pid);
					if (product != null && product.getStock() != null) {
						product.setAllocatedStock(product.getAllocatedStock() + (orderItem.getQuantity() - orderItem.getShippedQuantity()));
						productMapper.updateByPrimaryKeySelective(product);
					}
				}
			}
			order.setIsAllocatedStock(true);
		}

		shipping.setOrders(order.getId());
		shipping.setCreateDate(new Date());
		shipping.setModifyDate(new Date());
		shippingMapper.insert(shipping);
		for (XxShippingItem shippingItem : shipping.getShippingItems()) {
			XxOrderItem orderItem = order.getOrderItem(shippingItem.getSn());
			if (orderItem != null) {
				XxProduct product = orderItem.getXxProduct();
				if (product != null) {
					if (product.getStock() != null) {
						product.setStock(product.getStock() - shippingItem.getQuantity());
						if (order.getIsAllocatedStock()) {
							product.setAllocatedStock(product.getAllocatedStock() - shippingItem.getQuantity());
						}
					}
					productMapper.updateByPrimaryKeySelective(product);
				}
				orderItem.setShippedQuantity(orderItem.getShippedQuantity() + shippingItem.getQuantity());
				orderItemMapper.updateByPrimaryKeySelective(orderItem);
			}
		}
		System.err.println(order.getShippedQuantity()+"======"+order.getQuantity());
		if (order.getShippedQuantity() >= order.getQuantity()) {
			order.setShippingStatus(2);
			order.setIsAllocatedStock(false);
		} else if (order.getShippedQuantity() > 0) {
			order.setShippingStatus(1);
		}
		order.setExpire(null);
		orderMapper.updateByPrimaryKeySelective(order);

		XxOrderLog orderLog = new XxOrderLog();
		orderLog.setType(5);
		orderLog.setOperator(admin != null ? admin.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(new Date());
		orderLog.setModifyDate(new Date());
		orderLogMapper.insert(orderLog);
		
	}
	@Transactional
	@Override
	public void addreturns(XxOrder order, XxReturns returns, XxAdmin admin) {
		returns.setOrders(order.getId());
		returns.setCreateDate(new Date());
		returns.setModifyDate(new Date());
		// 退货单
		returnsMapper.insert(returns);
		for (XxReturnsItem returnsItem : returns.getReturnsItems()) {
			XxOrderItem orderItem = order.getOrderItem(returnsItem.getSn());
			if (orderItem != null) {
				orderItem.setReturnQuantity(orderItem.getReturnQuantity() + returnsItem.getQuantity());
				// 更新商品退货数量
				orderItemMapper.updateByPrimaryKeySelective(orderItem);
			}
		}
		if (order.getReturnQuantity() >= order.getShippedQuantity()) {
			order.setShippingStatus(4);
		} else if (order.getReturnQuantity() > 0) {
			order.setShippingStatus(3);
		}
		order.setExpire(null);
		// 更新订单
		orderMapper.updateByPrimaryKeySelective(order);

		XxOrderLog orderLog = new XxOrderLog();
		orderLog.setType(6);
		orderLog.setOperator(admin != null ? admin.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(new Date());
		orderLog.setModifyDate(new Date());
		// 打印日志
		orderLogMapper.insert(orderLog);
	}

	@Override
	public void addcomplete(XxOrder order, XxAdmin admin) {
		XxMember member = memberMapper.selectByPrimaryKey(order.getMember());
		// 查会员
		order.setXxMember(member);
		// 插入订单项
		List<XxOrderItem> orderItems = orderItemMapper.findByOrderId(order.getId());
		order.setOrderItems(orderItems);
		// 优惠券  不想写
		/*if (order.getShippingStatus() == 1 || order.getShippingStatus() == 2) {
			member.setPoint(member.getPoint() + order.getPoint());
			for (XxCoupon coupon : order.getCoupons()) {
				couponCodeDao.build(coupon, member);
			}
		}

		if (order.getShippingStatus() == ShippingStatus.unshipped || order.getShippingStatus() == ShippingStatus.returned) {
			CouponCode couponCode = order.getCouponCode();
			if (couponCode != null) {
				couponCode.setIsUsed(false);
				couponCode.setUsedDate(null);
				couponCodeDao.merge(couponCode);

				order.setCouponCode(null);
				orderDao.merge(order);
			}
		}*/
		
		System.err.println(member.getAmount()+"====="+order.getAmountPaid());
		member.setAmount(member.getAmount().add(order.getAmountPaid()));
		// 查询会员等级 是否更新会员等级
		XxMemberRank mr = memberRankMapper.selectByPrimaryKey(member.getMemberRank());
		if (!mr.getIsSpecial()) {
			XxMemberRank memberRank = memberRankMapper.findByAmount(member.getAmount());
			if (memberRank != null && memberRank.getAmount().compareTo(mr.getAmount()) > 0) {
				member.setMemberRank(memberRank.getId());
			}
		}
		memberMapper.updateByPrimaryKeySelective(member);

		if (order.getIsAllocatedStock()) {
			for (XxOrderItem orderItem : order.getOrderItems()) {
				if (orderItem != null) {
					// 更新商品库存
					XxProduct product = orderItem.getXxProduct();
					if (product != null && product.getStock() != null) {
						product.setAllocatedStock(product.getAllocatedStock() - (orderItem.getQuantity() - orderItem.getShippedQuantity()));
						productMapper.updateByPrimaryKeySelective(product);
					}
				}
			}
			order.setIsAllocatedStock(false);
		}

		// 更新商品销量
		for (XxOrderItem orderItem : order.getOrderItems()) {
			if (orderItem != null) {
				XxProduct product = productMapper.selectByPrimaryKey(orderItem.getProduct());
				if (product != null) {
					Integer quantity = orderItem.getQuantity();
					Calendar nowCalendar = Calendar.getInstance();
					Calendar weekSalesCalendar = DateUtils.toCalendar(product.getWeekSalesDate());
					Calendar monthSalesCalendar = DateUtils.toCalendar(product.getMonthSalesDate());
					if (nowCalendar.get(Calendar.YEAR) != weekSalesCalendar.get(Calendar.YEAR) || nowCalendar.get(Calendar.WEEK_OF_YEAR) > weekSalesCalendar.get(Calendar.WEEK_OF_YEAR)) {
						product.setWeekSales((long) quantity);
					} else {
						product.setWeekSales(product.getWeekSales() + quantity);
					}
					if (nowCalendar.get(Calendar.YEAR) != monthSalesCalendar.get(Calendar.YEAR) || nowCalendar.get(Calendar.MONTH) > monthSalesCalendar.get(Calendar.MONTH)) {
						product.setMonthSales((long) quantity);
					} else {
						product.setMonthSales(product.getMonthSales() + quantity);
					}
					product.setSales(product.getSales() + quantity);
					product.setWeekSalesDate(new Date());
					product.setMonthSalesDate(new Date());
					productMapper.updateByPrimaryKeySelective(product);
				}
			}
		}

		order.setOrderStatus(2);
		order.setExpire(null);
		orderMapper.updateByPrimaryKeySelective(order);

		XxOrderLog orderLog = new XxOrderLog();
		orderLog.setType(7);
		orderLog.setOperator(admin != null ? admin.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(new Date());
		orderLog.setModifyDate(new Date());
		orderLogMapper.insert(orderLog);	
	}

	@Override
	public void addcancel(XxOrder order, XxAdmin admin) {
		XxCouponCode couponCode = couponCodeMapper.selectByPrimaryKey(order.getCouponCode());
		if (couponCode != null) {
			couponCode.setIsUsed(false);
			couponCode.setUsedDate(null);
			couponCodeMapper.updateByPrimaryKeySelective(couponCode);

			order.setCouponCode(null);
			orderMapper.updateByPrimaryKeySelective(order);
		}
		if (order.getIsAllocatedStock()) {
			for (XxOrderItem orderItem : order.getOrderItems()) {
				if (orderItem != null) {
					XxProduct product = productMapper.selectByPrimaryKey(orderItem.getId());
					if (product != null && product.getStock() != null) {
						product.setAllocatedStock(product.getAllocatedStock() - (orderItem.getQuantity() - orderItem.getShippedQuantity()));
						productMapper.updateByPrimaryKeySelective(product);
					}
				}
			}
			order.setIsAllocatedStock(false);
		}

		order.setOrderStatus(3);
		order.setExpire(null);
		orderMapper.updateByPrimaryKeySelective(order);

		XxOrderLog orderLog = new XxOrderLog();
		orderLog.setType(8);
		orderLog.setOperator(admin != null ? admin.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(new Date());
		orderLog.setModifyDate(new Date());
		orderLogMapper.insert(orderLog);		
	}
	


}
