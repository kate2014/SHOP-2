package com.shop.entity;

import java.math.BigDecimal;
import java.util.Date;

public class XxPromotion {
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private Integer orders;

    private Date beginDate;

    private Date endDate;

    private Boolean isCouponAllowed;

    private Boolean isFreeShipping;

    private BigDecimal maximumPrice;

    private Integer maximumQuantity;

    private BigDecimal minimumPrice;

    private Integer minimumQuantity;

    private String name;

    private String pointExpression;

    private String priceExpression;

    private String title;

    private String introduction;

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

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Boolean getIsCouponAllowed() {
        return isCouponAllowed;
    }

    public void setIsCouponAllowed(Boolean isCouponAllowed) {
        this.isCouponAllowed = isCouponAllowed;
    }

    public Boolean getIsFreeShipping() {
        return isFreeShipping;
    }

    public void setIsFreeShipping(Boolean isFreeShipping) {
        this.isFreeShipping = isFreeShipping;
    }

    public BigDecimal getMaximumPrice() {
        return maximumPrice;
    }

    public void setMaximumPrice(BigDecimal maximumPrice) {
        this.maximumPrice = maximumPrice;
    }

    public Integer getMaximumQuantity() {
        return maximumQuantity;
    }

    public void setMaximumQuantity(Integer maximumQuantity) {
        this.maximumQuantity = maximumQuantity;
    }

    public BigDecimal getMinimumPrice() {
        return minimumPrice;
    }

    public void setMinimumPrice(BigDecimal minimumPrice) {
        this.minimumPrice = minimumPrice;
    }

    public Integer getMinimumQuantity() {
        return minimumQuantity;
    }

    public void setMinimumQuantity(Integer minimumQuantity) {
        this.minimumQuantity = minimumQuantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPointExpression() {
        return pointExpression;
    }

    public void setPointExpression(String pointExpression) {
        this.pointExpression = pointExpression == null ? null : pointExpression.trim();
    }

    public String getPriceExpression() {
        return priceExpression;
    }

    public void setPriceExpression(String priceExpression) {
        this.priceExpression = priceExpression == null ? null : priceExpression.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }
}