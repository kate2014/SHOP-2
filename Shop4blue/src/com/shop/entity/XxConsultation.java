package com.shop.entity;

import java.util.Date;

public class XxConsultation {
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private String content;

    private String ip;

    private Boolean isShow;

    private Long forConsultation;

    private Long member;

    private Long product;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Boolean getIsShow() {
		return isShow;
	}

	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}

	public Long getForConsultation() {
		return forConsultation;
	}

	public void setForConsultation(Long forConsultation) {
		this.forConsultation = forConsultation;
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

	@Override
	public String toString() {
		return "XxConsultation [id=" + id + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", content="
				+ content + ", ip=" + ip + ", isShow=" + isShow + ", forConsultation=" + forConsultation + ", member="
				+ member + ", product=" + product + "]";
	}

	
    
    
}