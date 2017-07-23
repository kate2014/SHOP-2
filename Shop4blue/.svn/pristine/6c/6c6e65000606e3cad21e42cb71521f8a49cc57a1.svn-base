package com.shop.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class XxOrder {
	/**
	 * 订单状态
	 */
	public enum OrderStatus {

		/** 未确认 */
		unconfirmed,

		/** 已确认 */
		confirmed,

		/** 已完成 */
		completed,

		/** 已取消 */
		cancelled
	}

	/**
	 * 支付状态
	 */
	public enum PaymentStatus {

		/** 未支付 */
		unpaid,

		/** 部分支付 */
		partialPayment,

		/** 已支付 */
		paid,

		/** 部分退款 */
		partialRefunds,

		/** 已退款 */
		refunded
	}

	/**
	 * 配送状态
	 */
	public enum ShippingStatus {

		/** 未发货 */
		unshipped,

		/** 部分发货 */
		partialShipment,

		/** 已发货 */
		shipped,

		/** 部分退货 */
		partialReturns,

		/** 已退货 */
		returned
	}
	
	
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private String address;

    private BigDecimal amountPaid;

    private String areaName;

    private String consignee;

    private BigDecimal couponDiscount;

    private Date expire;

    private BigDecimal fee;

    private BigDecimal freight;

    private String invoiceTitle;

    private Boolean isAllocatedStock;

    private Boolean isInvoice;

    private Date lockExpire;

    private String memo;

    private BigDecimal offsetAmount;

    private Integer orderStatus;

    private String paymentMethodName;

    private Integer paymentStatus;

    private String phone;

    private Long point;

    private String promotion;

    private BigDecimal promotionDiscount;

    private String shippingMethodName;

    private Integer shippingStatus;

    private String sn;

    private BigDecimal tax;

    private String zipCode;

    private Long area;

    private Long couponCode;

    private Long member;

    private Long operator;

    private Long paymentMethod;
    
    private XxArea xxarea;

    private List<XxOrderItem> orderItems = new ArrayList<>();
    
    /** 优惠券 */
	private List<XxCoupon> coupons = new ArrayList<XxCoupon>();
    
    public List<XxCoupon> getCoupons() {
		return coupons;
	}

	public void setCoupons(List<XxCoupon> coupons) {
		this.coupons = coupons;
	}

	public XxArea getXxarea() {
		return xxarea;
	}

	public void setXxarea(XxArea xxarea) {
		this.xxarea = xxarea;
	}


    public List<XxOrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<XxOrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	private Long shippingMethod;
    // 会员信息
    private XxMember xxMember;
    // 配送方式
    private XxShippingMethod shipMethod;
    
    
    /**
	 * 获取已发货数量
	 * 
	 * @return 已发货数量
	 */
    
	public int getShippedQuantity() {
		int shippedQuantity = 0;
		if (getOrderItems() != null) {
			for (XxOrderItem orderItem : getOrderItems()) {
				if (orderItem != null && orderItem.getShippedQuantity() != null) {
					shippedQuantity += orderItem.getShippedQuantity();
				}
			}
		}
		return shippedQuantity;
	}
	
	/**
	 * 获取已退货数量
	 * 
	 * @return 已退货数量
	 */
	public int getReturnQuantity() {
		int returnQuantity = 0;
		if (getOrderItems() != null) {
			for (XxOrderItem orderItem : getOrderItems()) {
				if (orderItem != null && orderItem.getReturnQuantity() != null) {
					returnQuantity += orderItem.getReturnQuantity();
				}
			}
		}
		return returnQuantity;
	}
    
    /**
	 * 获取订单项
	 * 
	 * @param sn
	 *            商品编号
	 * @return 订单项
	 */
	public XxOrderItem getOrderItem(String sn) {
		if (sn != null && getOrderItems() != null) {
			for (XxOrderItem orderItem : getOrderItems()) {
				if (orderItem != null && sn.equalsIgnoreCase(orderItem.getSn())) {
					return orderItem;
				}
			}
		}
		return null;
	}
    
    
    public boolean isExpired() {
		return getExpire() != null && new Date().after(getExpire());
	}
    
    public boolean isLocked(XxAdmin operator) {
		return getLockExpire() != null && new Date().before(getLockExpire()) && ((getOperator()!=null && operator != null && !operator.getId().equals(getOperator())) || (operator == null && getOperator() != null));
	}
    
    /**
	 * 获取商品数量
	 * 
	 * @return 商品数量
	 */
	public int getQuantity() {
		int quantity = 0;
		if (getOrderItems() != null) {
			for (XxOrderItem orderItem : getOrderItems()) {
				if (orderItem != null && orderItem.getQuantity() != null) {
					quantity += orderItem.getQuantity();
				}
			}
		}
		return quantity;
	}



	/**
	 * 获取商品重量
	 * 
	 * @return 商品重量
	 */
	public int getWeight() {
		int weight = 0;
		if (getOrderItems() != null) {
			for (XxOrderItem orderItem : getOrderItems()) {
				if (orderItem != null) {
					weight += orderItem.getTotalWeight();
				}
			}
		}
		return weight;
	}
	
	public BigDecimal getPrice() {
		BigDecimal price = new BigDecimal(0);
		if (getOrderItems() != null) {
			for (XxOrderItem orderItem : getOrderItems()) {
				if (orderItem != null && orderItem.getSubtotal() != null) {
					price = price.add(orderItem.getSubtotal());
				}
			}
		}
		return price;
	}
	/**
	 * 订单金额
	 * @return
	 */
	public BigDecimal getOrderMoney() {
		BigDecimal amount = getPrice();
		if (getFee() != null) {
			amount = amount.add(getFee());
		}
		if (getFreight() != null) {
			amount = amount.add(getFreight());
		}
		if (getPromotionDiscount() != null) {
			amount = amount.subtract(getPromotionDiscount());
		}
		if (getCouponDiscount() != null) {
			amount = amount.subtract(getCouponDiscount());
		}
		if (getOffsetAmount() != null) {
			amount = amount.add(getOffsetAmount());
		}
		if (getTax() != null) {
			amount = amount.add(getTax());
		}
		return amount.compareTo(new BigDecimal(0)) > 0 ? amount.setScale(2,BigDecimal.ROUND_HALF_UP) : new BigDecimal(0);
	}


	public XxShippingMethod getShipMethod() {
		return shipMethod;
	}

	public void setShipMethod(XxShippingMethod shipMethod) {
		this.shipMethod = shipMethod;
	}

	public XxMember getXxMember() {
		return xxMember;
	}

	public void setXxMember(XxMember xxMember) {
		this.xxMember = xxMember;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public BigDecimal getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee == null ? null : consignee.trim();
    }

    public BigDecimal getCouponDiscount() {
        return couponDiscount;
    }

    public void setCouponDiscount(BigDecimal couponDiscount) {
        this.couponDiscount = couponDiscount;
    }

    public Date getExpire() {
        return expire;
    }

    public void setExpire(Date expire) {
        this.expire = expire;
    }

    public BigDecimal getFee() {
        return fee;
    }

    public void setFee(BigDecimal fee) {
        this.fee = fee;
    }

    public BigDecimal getFreight() {
        return freight;
    }

    public void setFreight(BigDecimal freight) {
        this.freight = freight;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle == null ? null : invoiceTitle.trim();
    }

    public Boolean getIsAllocatedStock() {
        return isAllocatedStock;
    }

    public void setIsAllocatedStock(Boolean isAllocatedStock) {
        this.isAllocatedStock = isAllocatedStock;
    }

    public Boolean getIsInvoice() {
        return isInvoice;
    }

    public void setIsInvoice(Boolean isInvoice) {
        this.isInvoice = isInvoice;
    }

    public Date getLockExpire() {
        return lockExpire;
    }

    public void setLockExpire(Date lockExpire) {
        this.lockExpire = lockExpire;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public BigDecimal getOffsetAmount() {
        return offsetAmount;
    }

    public void setOffsetAmount(BigDecimal offsetAmount) {
        this.offsetAmount = offsetAmount;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPaymentMethodName() {
        return paymentMethodName;
    }

    public void setPaymentMethodName(String paymentMethodName) {
        this.paymentMethodName = paymentMethodName == null ? null : paymentMethodName.trim();
    }

    public Integer getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(Integer paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Long getPoint() {
        return point;
    }

    public void setPoint(Long point) {
        this.point = point;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion == null ? null : promotion.trim();
    }

    public BigDecimal getPromotionDiscount() {
        return promotionDiscount;
    }

    public void setPromotionDiscount(BigDecimal promotionDiscount) {
        this.promotionDiscount = promotionDiscount;
    }

    public String getShippingMethodName() {
        return shippingMethodName;
    }

    public void setShippingMethodName(String shippingMethodName) {
        this.shippingMethodName = shippingMethodName == null ? null : shippingMethodName.trim();
    }

    public Integer getShippingStatus() {
        return shippingStatus;
    }

    public void setShippingStatus(Integer shippingStatus) {
        this.shippingStatus = shippingStatus;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public BigDecimal getTax() {
        return tax;
    }

    public void setTax(BigDecimal tax) {
        this.tax = tax;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode == null ? null : zipCode.trim();
    }

    public Long getArea() {
        return area;
    }

    public void setArea(Long area) {
        this.area = area;
    }

    public Long getCouponCode() {
        return couponCode;
    }

    public void setCouponCode(Long couponCode) {
        this.couponCode = couponCode;
    }

    public Long getMember() {
        return member;
    }

    public void setMember(Long member) {
        this.member = member;
    }

    public Long getOperator() {
        return operator;
    }

    public void setOperator(Long operator) {
        this.operator = operator;
    }

    public Long getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(Long paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Long getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(Long shippingMethod) {
        this.shippingMethod = shippingMethod;
    }
    
    /**
	 * 获取应付金额
	 * 
	 * @return 应付金额
	 */
	public BigDecimal getAmountPayable() {
		BigDecimal amountPayable = getOrderMoney().subtract(getAmountPaid());
		return amountPayable.compareTo(new BigDecimal(0)) > 0 ? amountPayable.setScale(2,BigDecimal.ROUND_HALF_UP) : new BigDecimal(0);
	}
	
	/**
	 * 计算税金
	 * 
	 * @return 税金
	 */
	public BigDecimal calculateTax() {
		BigDecimal tax = new BigDecimal(0);
		BigDecimal amount = getPrice();
		if (getPromotionDiscount() != null) {
			amount = amount.subtract(getPromotionDiscount());
		}
		if (getCouponDiscount() != null) {
			amount = amount.subtract(getCouponDiscount());
		}
		if (getOffsetAmount() != null) {
			amount = amount.add(getOffsetAmount());
		}
		tax = amount.multiply(new BigDecimal(0.06));
		return tax.setScale(2,BigDecimal.ROUND_HALF_UP);
	}
}