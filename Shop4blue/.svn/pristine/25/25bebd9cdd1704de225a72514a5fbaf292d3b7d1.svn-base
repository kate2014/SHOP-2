package com.shop.entity;

import java.math.BigDecimal;
import java.util.Date;

public class XxShippingMethod {
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private Integer orders;

    private BigDecimal continuePrice;

    private Integer continueWeight;

    private BigDecimal firstPrice;

    private Integer firstWeight;

    private String icon;

    private String name;

    private Long defaultDeliveryCorp;

    private String description;

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

    public BigDecimal getContinuePrice() {
        return continuePrice;
    }

    public void setContinuePrice(BigDecimal continuePrice) {
        this.continuePrice = continuePrice;
    }

    public Integer getContinueWeight() {
        return continueWeight;
    }

    public void setContinueWeight(Integer continueWeight) {
        this.continueWeight = continueWeight;
    }

    public BigDecimal getFirstPrice() {
        return firstPrice;
    }

    public void setFirstPrice(BigDecimal firstPrice) {
        this.firstPrice = firstPrice;
    }

    public Integer getFirstWeight() {
        return firstWeight;
    }

    public void setFirstWeight(Integer firstWeight) {
        this.firstWeight = firstWeight;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getDefaultDeliveryCorp() {
        return defaultDeliveryCorp;
    }

    public void setDefaultDeliveryCorp(Long defaultDeliveryCorp) {
        this.defaultDeliveryCorp = defaultDeliveryCorp;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
    
    /**
	 * 计算运费
	 * 
	 * @param weight
	 *            重量
	 * @return 运费
	 */
	public BigDecimal calculateFreight(Integer weight) {
		BigDecimal freight = new BigDecimal(0);
		if (weight != null) {
			if (weight <= getFirstWeight() || getContinuePrice().compareTo(new BigDecimal(0)) == 0) {
				freight = getFirstPrice();
			} else {
				double contiuneWeightCount = Math.ceil((weight - getFirstWeight()) / (double) getContinueWeight());
				freight = getFirstPrice().add(getContinuePrice().multiply(new BigDecimal(contiuneWeightCount)));
			}
		}
		if(weight==null){
			freight=getFirstPrice();
		}
		return freight;
	}
}