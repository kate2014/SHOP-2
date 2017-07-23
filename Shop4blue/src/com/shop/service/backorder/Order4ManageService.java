package com.shop.service.backorder;

import java.util.List;
import java.util.Map;

import com.shop.entity.XxAdmin;
import com.shop.entity.XxDeliveryCenter;
import com.shop.entity.XxDeliveryCorp;
import com.shop.entity.XxDeliveryTemplate;
import com.shop.entity.XxOrder;
import com.shop.entity.XxOrderItem;
import com.shop.entity.XxOrderLog;
import com.shop.entity.XxPayment;
import com.shop.entity.XxPaymentMethod;
import com.shop.entity.XxProduct;
import com.shop.entity.XxRefunds;
import com.shop.entity.XxReturns;
import com.shop.entity.XxShipping;
import com.shop.entity.XxShippingMethod;

public interface Order4ManageService {
	/**
	 * 查询所有订单
	 * @param start
	 * @param size
	 * @return
	 */
	public List<XxOrder> selectAll(Map<String,Object> map);
	/**
	 * 查询订单总数
	 * @return
	 */
	public int totalNum(Map<String,Object> map);
	/**
	 * 根据主键查询订单
	 * @param id
	 * @return
	 */
	public XxOrder selectById(Long id);
	/**
	 * 根据订单id查询所有订单项
	 * @param id 订单id
	 * @return
	 */
	public List<XxOrderItem> selectByOrderId(Long id);
	/**
	 * 查询DeliveryTemplate所有
	 * @return
	 */
	public List<XxDeliveryTemplate> selectAllTemplate();
	/**
	 * 查询DeliveryCenter所有
	 * @return
	 */
	public List<XxDeliveryCenter> selectAllCenter();
	/**
	 * 根据主键查询DeliveryTemplate
	 * @param id
	 * @return
	 */
	public XxDeliveryTemplate selectTemplateById(Long id);
	/**
	 * 根据主键查询DeliveryCenter
	 * @param id
	 * @return
	 */
	public XxDeliveryCenter selectCenterById(Long id);
	/**
	 * 根据订单id查询收款信息
	 * @param id 订单id
	 * @return
	 */
	public List<XxPayment> findPaymentByOrderId(Long id);
	/**
	 * 根据订单id查询发货信息
	 * @param id 订单id
	 * @return
	 */
	public XxShipping findShippingByOrderId(Long id);
	/**
	 * 根据订单id查询退款信息
	 * @param id 订单id
	 * @return
	 */
	public XxRefunds findRefundsByOrderId(Long id);
	/**
	 * 根据订单id查询退货信息
	 * @param id 订单id
	 * @return
	 */
	public XxReturns findReturnsByOrderId(Long id);
	/**
	 * 根据订单id查询订单日志
	 * @param id 订单id
	 * @return
	 */
	public List<XxOrderLog> findOrderLogByOrderId(Long id);
	/**
	 * 根据order主键更新
	 * @param order
	 */
	public void updateOrder(XxOrder order);
	/**
	 * 插入订单日志
	 * @param orderLog
	 */
	public void insertOrderLog(XxOrderLog orderLog);
	/**
	 * 根据主键查询支付方法
	 * @param id
	 * @return
	 */
	public XxPaymentMethod findPaymentMethodById(Long id);
	/**
	 * 订单支付
	 * @param order 订单
	 * @param payment 收款单
	 * @param admin 管理员
	 */
	public void addPayment(XxOrder order, XxPayment payment, XxAdmin admin);
	/**
	 * 退款
	 * @param order 订单
	 * @param refunds 退款单
	 * @param admin 管理员
	 */
	public void addrefunds(XxOrder order, XxRefunds refunds, XxAdmin admin);
	/**
	 * 根据主键查询商品
	 * @param id
	 * @return
	 */
	public XxProduct findProductById(Long id);
	/**
	 * 根据主键查配送方式
	 * @param id
	 * @return
	 */
	public XxShippingMethod findShippingMethodById(Long id);
	/**
	 * 根据主键查物流公司
	 * @param id
	 * @return
	 */
	public XxDeliveryCorp findDeliveryCorpById(Long id);
	/**
	 * 发货
	 * @param order 订单
	 * @param shipping 发货单
	 * @param admin 管理员
	 */
	public void addshipping(XxOrder order, XxShipping shipping, XxAdmin admin);
	/**
	 * 退货
	 * @param order 订单
	 * @param returns 退货单
	 * @param admin 管理员
	 */
	public void addreturns(XxOrder order, XxReturns returns, XxAdmin admin);
	/**
	 * 完成
	 * @param order 订单
	 * @param admin 管理员
	 */
	public void addcomplete(XxOrder order, XxAdmin admin);
	/**
	 * 取消
	 * @param order
	 * @param admin
	 */
	public void addcancel(XxOrder order, XxAdmin admin);

}
