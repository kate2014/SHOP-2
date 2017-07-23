package com.shop.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

public class XxCartItem {
	
	/** 最大数量 */
	public static final Integer MAX_QUANTITY = 10000;
	
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private Integer quantity;

    private Long cart;

    private Long product;

    public Long getId() {
        return id;
    }
    
    private XxCart xxCart;
    
    public XxCart getXxCart() {
		return xxCart;
	}

	public void setXxCart(XxCart xxCart) {
		this.xxCart = xxCart;
	}

	/**
     * 商品 一对一
     */
    XxProduct xxProduct;

    public XxProduct getXxProduct() {
		return xxProduct;
	}

	public void setXxProduct(XxProduct xxProduct) {
		this.xxProduct = xxProduct;
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

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Long getCart() {
        return cart;
    }

    public void setCart(Long cart) {
        this.cart = cart;
    }

    public Long getProduct() {
        return product;
    }

    public void setProduct(Long product) {
        this.product = product;
    }
    
	/**
	 * 获取商品重量
	 * 
	 * @return 商品重量
	 */
	public int getWeight() {
		if (getProduct() != null && getXxProduct().getWeight() != null && getQuantity() != null) {
			return getXxProduct().getWeight() * getQuantity();
		} else {
			return 0;
		}
	}
	
	/**
	 * 获取赠送积分
	 * 
	 * @return 赠送积分
	 */
	public long getPoint() {
		if (getProduct() != null && getXxProduct().getPoint() != null && getQuantity() != null) {
			return getXxProduct().getPoint() * getQuantity();
		} else {
			return 0L;
		}
	}
	
	/**
	 * 获取小计
	 * 
	 * @return 小计
	 */
	public BigDecimal getSubtotal() {
		if (getQuantity() != null) {
			return getUnitPrice().multiply(new BigDecimal(getQuantity()));
		} else {
			return new BigDecimal(0);
		}
	}
	
	/**
	 * 获取单价
	 * 
	 * @return 单价
	 */
	public BigDecimal getUnitPrice() {
		if (getProduct() != null && getXxProduct().getPrice() != null) {
			if (getCart() != null && getXxCart().getXxMember() != null && getXxCart().getXxMember().getXxMemberRank() != null) {
				// 获取会员等级
				XxMemberRank memberRank = getXxCart().getXxMember().getXxMemberRank();
				// 获取会员价
				Map<XxMemberRank, BigDecimal> memberPrice = getXxProduct().getMemberPrice();
				// 设置会员价
				if (memberPrice != null && !memberPrice.isEmpty()) {
					if (memberPrice.containsKey(memberRank)) {
						return memberPrice.get(memberRank);
					}
				}
				if (memberRank.getScale() != null) {
					return getXxProduct().getPrice().multiply(new BigDecimal(memberRank.getScale()));
				}
			}
			return getXxProduct().getPrice();
		} else {
			return new BigDecimal(0);
		}
	}
	
	/**
	 * 获取是否库存不足
	 * 
	 * @return 是否库存不足
	 */
	public boolean getIsLowStock() {
		if (getQuantity() != null && getProduct() != null && getXxProduct().getStock() != null && getQuantity() > getXxProduct().getAvailableStock()) {
			return true;
		} else {
			return false;
		}
	}
}