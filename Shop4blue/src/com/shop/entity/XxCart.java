package com.shop.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class XxCart {
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private String cartKey;

    private Long member;
    
    private XxMember xxMember;
    
    public XxMember getXxMember() {
		return xxMember;
	}

	public void setXxMember(XxMember xxMember) {
		this.xxMember = xxMember;
	}

	/**
     * 购物车项 、
     * 一对多
     */
    List<XxCartItem> cartItems;

    public List<XxCartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<XxCartItem> cartItems) {
		this.cartItems = cartItems;
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

    public String getCartKey() {
        return cartKey;
    }

    public void setCartKey(String cartKey) {
        this.cartKey = cartKey == null ? null : cartKey.trim();
    }

    public Long getMember() {
        return member;
    }

    public void setMember(Long member) {
        this.member = member;
    }
    
	/**
	 * 获取商品重量
	 * 
	 * @return 商品重量
	 */
	public int getWeight() {
		int weight = 0;
		if (getCartItems() != null) {
			for (XxCartItem cartItem : getCartItems()) {
				if (cartItem != null) {
					weight += cartItem.getWeight();
				}
			}
		}
		return weight;
	}

	/**
	 * 获取商品数量
	 * 
	 * @return 商品数量
	 */
	public int getQuantity() {
		int quantity = 0;
		if (getCartItems() != null) {
			for (XxCartItem cartItem : getCartItems()) {
				if (cartItem != null && cartItem.getQuantity() != null) {
					quantity += cartItem.getQuantity();
				}
			}
		}
		return quantity;
	}


	/**
	 * 获取商品价格
	 * 
	 * @return 商品价格
	 */
	public BigDecimal getPrice() {
		BigDecimal price = new BigDecimal(0);
		if (getCartItems() != null) {
			for (XxCartItem cartItem : getCartItems()) {
				if (cartItem != null && cartItem.getSubtotal() != null) {
					price = price.add(cartItem.getSubtotal());
				}
			}
		}
		return price;
	}
	
	/**
	 * 获取有效商品价格
	 * 没写打折
	 * @return 有效商品价格
	 */
	public BigDecimal getEffectivePrice() {
		BigDecimal effectivePrice = getPrice();
		return effectivePrice.compareTo(new BigDecimal(0)) > 0 ? effectivePrice : new BigDecimal(0);
	}
	
	/**
	 * 获取赠送积分
	 * 
	 * @return 赠送积分
	 */
	public long getPoint() {
		long point = 0L;
		if (getCartItems() != null) {
			for (XxCartItem cartItem : getCartItems()) {
				if (cartItem != null) {
					point += cartItem.getPoint();
				}
			}
		}
		return point;
	}

	/**
	 * 获取有效赠送积分
	 * 
	 * @return 有效赠送积分
	 */
	public long getEffectivePoint() {
		long effectivePoint = getPoint();
		return effectivePoint > 0L ? effectivePoint : 0L;
	}
	
	/**
	 * 判断是否为空
	 * 
	 * @return 是否为空
	 */
	public boolean isEmpty() {
		return getCartItems() == null || getCartItems().isEmpty();
	}

		/**
	 * 获取是否库存不足
	 * 
	 * @return 是否库存不足
	 */
	public boolean getIsLowStock() {
		if (getCartItems() != null) {
			for (XxCartItem cartItem : getCartItems()) {
				if (cartItem != null && cartItem.getIsLowStock()) {
					return true;
				}
			}
		}
		return false;
	}
}