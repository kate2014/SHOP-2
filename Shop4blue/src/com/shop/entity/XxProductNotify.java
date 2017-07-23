package com.shop.entity;

import java.util.Date;


public class XxProductNotify {
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private String email;

    private Boolean hasSent;

    private Long member;

    private Long product;
    
    private XxMember xmember;
    
    private XxProduct xproduct;

    private boolean del;
    
    
    public boolean isDel() {
		return del;
	}

	public void setDel(boolean del) {
		this.del = del;
	}

	public XxMember getXmember() {
		return xmember;
	}

	public void setXmember(XxMember xmember) {
		this.xmember = xmember;
	}

	public XxProduct getXproduct() {
		return xproduct;
	}

	public void setXproduct(XxProduct xproduct) {
		this.xproduct = xproduct;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Boolean getHasSent() {
        return hasSent;
    }

    public void setHasSent(Boolean hasSent) {
        this.hasSent = hasSent;
    }

    public Long getMember() {
        return member;
    }

    public void setMember(Long member) {
        this.member = member;
    }

    public Long getProduct() {
        return product;
    }

    public void setProduct(Long product) {
        this.product = product;
    }
}