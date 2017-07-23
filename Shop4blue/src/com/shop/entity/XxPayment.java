package com.shop.entity;

import java.math.BigDecimal;
import java.util.Date;

public class XxPayment {
    private Long id;

    private Date createDate;

    private Date modifyDate;

    private String account;

    private BigDecimal amount;

    private String bank;

    private Date expire;

    private BigDecimal fee;

    private String memo;

    private Integer method;

    private String operator;

    private String payer;

    private Date paymentDate;

    private String paymentMethod;

    private String paymentPluginId;

    private String sn;

    private Integer status;

    private Integer type;

    private Long member;

    private Long orders;

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

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank == null ? null : bank.trim();
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

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public Integer getMethod() {
        return method;
    }

    public void setMethod(Integer method) {
        this.method = method;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public String getPayer() {
        return payer;
    }

    public void setPayer(String payer) {
        this.payer = payer == null ? null : payer.trim();
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod == null ? null : paymentMethod.trim();
    }

    public String getPaymentPluginId() {
        return paymentPluginId;
    }

    public void setPaymentPluginId(String paymentPluginId) {
        this.paymentPluginId = paymentPluginId == null ? null : paymentPluginId.trim();
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Long getMember() {
        return member;
    }

    public void setMember(Long member) {
        this.member = member;
    }

    public Long getOrders() {
        return orders;
    }

    public void setOrders(Long orders) {
        this.orders = orders;
    }

	@Override
	public String toString() {
		return "XxPayment [id=" + id + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", account="
				+ account + ", amount=" + amount + ", bank=" + bank + ", expire=" + expire + ", fee=" + fee + ", memo="
				+ memo + ", method=" + method + ", operator=" + operator + ", payer=" + payer + ", paymentDate="
				+ paymentDate + ", paymentMethod=" + paymentMethod + ", paymentPluginId=" + paymentPluginId + ", sn="
				+ sn + ", status=" + status + ", type=" + type + ", member=" + member + ", orders=" + orders + "]";
	}
    
    
    
    
    
}