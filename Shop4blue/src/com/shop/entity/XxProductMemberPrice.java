package com.shop.entity;

import java.math.BigDecimal;

public class XxProductMemberPrice extends XxProductMemberPriceKey {
    private BigDecimal memberPrice;

    public BigDecimal getMemberPrice() {
        return memberPrice;
    }

    public void setMemberPrice(BigDecimal memberPrice) {
        this.memberPrice = memberPrice;
    }
}