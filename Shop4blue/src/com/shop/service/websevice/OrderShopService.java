package com.shop.service.websevice;

import java.util.List;

import com.shop.entity.XxAdmin;
import com.shop.entity.XxCart;
import com.shop.entity.XxCouponCode;
import com.shop.entity.XxOrder;
import com.shop.entity.XxPaymentMethod;
import com.shop.entity.XxProductProductImage;
import com.shop.entity.XxReceiver;
import com.shop.entity.XxShippingMethod;

public interface OrderShopService {
	/**
	 * 根据商品id查图片
	 * @param id
	 * @return
	 */
	public List<XxProductProductImage> findProductImageByProductId(Long id);
	
	/**
	 * 根据会员id查询收获地址
	 * @param id
	 * @return
	 */
	public List<XxReceiver> findReceiversByMemberId(Long id);
	
	/**
	 * 根据主键查询收获地址
	 * @param id
	 * @return
	 */
	XxReceiver findReceiversById(Long id);
	
	/**
	 * 新增收获地址
	 * @param receiver
	 */
	public void saveReceiver(XxReceiver receiver);
	
	/**
	 * 根据编号查订单
	 * @param sn
	 * @return
	 */
	public XxOrder findOrderBySn(String sn);

	/**
	 * 生成订单
	 * 
	 * @param cart
	 *            购物车
	 * @param receiver
	 *            收货地址
	 * @param paymentMethod
	 *            支付方式
	 * @param shippingMethod
	 *            配送方式
	 * @param couponCode
	 *            优惠码
	 * @param isInvoice
	 *            是否开据发票
	 * @param invoiceTitle
	 *            发票抬头
	 * @param useBalance
	 *            是否使用余额
	 * @param memo
	 *            附言
	 * @return 订单
	 */
	XxOrder build(XxCart cart, XxReceiver receiver, XxPaymentMethod paymentMethod, XxShippingMethod shippingMethod, XxCouponCode couponCode, boolean isInvoice, String invoiceTitle, boolean useBalance, String memo);
	
	/**
	 * 创建订单
	 * 
	 * @param cart
	 *            购物车
	 * @param receiver
	 *            收货地址
	 * @param paymentMethod
	 *            支付方式
	 * @param shippingMethod
	 *            配送方式
	 * @param couponCode
	 *            优惠码
	 * @param isInvoice
	 *            是否开据发票
	 * @param invoiceTitle
	 *            发票抬头
	 * @param useBalance
	 *            是否使用余额
	 * @param memo
	 *            附言
	 * @param operator
	 *            操作员
	 * @return 订单
	 */
	XxOrder create(XxCart cart, XxReceiver receiver, XxPaymentMethod paymentMethod, XxShippingMethod shippingMethod, XxCouponCode couponCode, boolean isInvoice, String invoiceTitle, boolean useBalance, String memo, XxAdmin operator);

}
