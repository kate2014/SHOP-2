package com.shop.entity;

import java.util.Date;
import java.util.List;

public class XxSpecification {
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private Integer orders;

    private String memo;

    private String name;

    private Integer type;
    
    private List<XxSpecificationValue> xxSpecificationValue;

    public List<XxSpecificationValue> getXxSpecificationValue() {
		return xxSpecificationValue;
	}

	public void setXxSpecificationValue(List<XxSpecificationValue> xxSpecificationValue) {
		this.xxSpecificationValue = xxSpecificationValue;
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

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}