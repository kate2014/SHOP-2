package com.shop.entity;

public class XxProductParameterValue extends XxProductParameterValueKey {
    private String parameterValue;
    
    private XxParameter xxparameter;

    public XxParameter getXxparameter() {
		return xxparameter;
	}

	public void setXxparameter(XxParameter xxparameter) {
		this.xxparameter = xxparameter;
	}

	public String getParameterValue() {
        return parameterValue;
    }

    public void setParameterValue(String parameterValue) {
        this.parameterValue = parameterValue == null ? null : parameterValue.trim();
    }
}