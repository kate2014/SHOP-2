package com.shop.entity;

import java.util.Date;
import java.util.List;

public class XxAttribute {
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private Integer orders;

    private String name;

    private Integer propertyIndex;

    private Long productCategory;
    
    private XxProductCategory xxProductCategory;
    
    private List<XxAttributeOption> xxAttributeOptions;
    
    public List<XxAttributeOption> getXxAttributeOptions() {
		return xxAttributeOptions;
	}

	public void setXxAttributeOptions(List<XxAttributeOption> xxAttributeOptions) {
		this.xxAttributeOptions = xxAttributeOptions;
	}

	public XxProductCategory getXxProductCategory() {
		return xxProductCategory;
	}

	public void setXxProductCategory(XxProductCategory xxProductCategory) {
		this.xxProductCategory = xxProductCategory;
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

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getPropertyIndex() {
        return propertyIndex;
    }

    public void setPropertyIndex(Integer propertyIndex) {
        this.propertyIndex = propertyIndex;
    }

    public Long getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(Long productCategory) {
        this.productCategory = productCategory;
    }

	@Override
	public String toString() {
		return "XxAttribute [id=" + id + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", orders="
				+ orders + ", name=" + name + ", propertyIndex=" + propertyIndex + ", productCategory="
				+ productCategory + ", xxProductCategory=" + xxProductCategory + ", xxAttributeOptions="
				+ xxAttributeOptions + "]";
	}
    
}