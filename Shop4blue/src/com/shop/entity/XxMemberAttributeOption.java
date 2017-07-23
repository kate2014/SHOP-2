package com.shop.entity;

public class XxMemberAttributeOption {
    private Long memberAttribute;

    private String options;

    public Long getMemberAttribute() {
        return memberAttribute;
    }

    public void setMemberAttribute(Long memberAttribute) {
        this.memberAttribute = memberAttribute;
    }

    public String getOptions() {
        return options;
    }

    public void setOptions(String options) {
        this.options = options == null ? null : options.trim();
    }
}