package com.shop.entity;

import java.util.ArrayList;
import java.util.List;

public class XxProductParameterValueExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public XxProductParameterValueExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andProductIsNull() {
            addCriterion("product is null");
            return (Criteria) this;
        }

        public Criteria andProductIsNotNull() {
            addCriterion("product is not null");
            return (Criteria) this;
        }

        public Criteria andProductEqualTo(Long value) {
            addCriterion("product =", value, "product");
            return (Criteria) this;
        }

        public Criteria andProductNotEqualTo(Long value) {
            addCriterion("product <>", value, "product");
            return (Criteria) this;
        }

        public Criteria andProductGreaterThan(Long value) {
            addCriterion("product >", value, "product");
            return (Criteria) this;
        }

        public Criteria andProductGreaterThanOrEqualTo(Long value) {
            addCriterion("product >=", value, "product");
            return (Criteria) this;
        }

        public Criteria andProductLessThan(Long value) {
            addCriterion("product <", value, "product");
            return (Criteria) this;
        }

        public Criteria andProductLessThanOrEqualTo(Long value) {
            addCriterion("product <=", value, "product");
            return (Criteria) this;
        }

        public Criteria andProductIn(List<Long> values) {
            addCriterion("product in", values, "product");
            return (Criteria) this;
        }

        public Criteria andProductNotIn(List<Long> values) {
            addCriterion("product not in", values, "product");
            return (Criteria) this;
        }

        public Criteria andProductBetween(Long value1, Long value2) {
            addCriterion("product between", value1, value2, "product");
            return (Criteria) this;
        }

        public Criteria andProductNotBetween(Long value1, Long value2) {
            addCriterion("product not between", value1, value2, "product");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyIsNull() {
            addCriterion("parameter_value_key is null");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyIsNotNull() {
            addCriterion("parameter_value_key is not null");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyEqualTo(Long value) {
            addCriterion("parameter_value_key =", value, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyNotEqualTo(Long value) {
            addCriterion("parameter_value_key <>", value, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyGreaterThan(Long value) {
            addCriterion("parameter_value_key >", value, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyGreaterThanOrEqualTo(Long value) {
            addCriterion("parameter_value_key >=", value, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyLessThan(Long value) {
            addCriterion("parameter_value_key <", value, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyLessThanOrEqualTo(Long value) {
            addCriterion("parameter_value_key <=", value, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyIn(List<Long> values) {
            addCriterion("parameter_value_key in", values, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyNotIn(List<Long> values) {
            addCriterion("parameter_value_key not in", values, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyBetween(Long value1, Long value2) {
            addCriterion("parameter_value_key between", value1, value2, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueKeyNotBetween(Long value1, Long value2) {
            addCriterion("parameter_value_key not between", value1, value2, "parameterValueKey");
            return (Criteria) this;
        }

        public Criteria andParameterValueIsNull() {
            addCriterion("parameter_value is null");
            return (Criteria) this;
        }

        public Criteria andParameterValueIsNotNull() {
            addCriterion("parameter_value is not null");
            return (Criteria) this;
        }

        public Criteria andParameterValueEqualTo(String value) {
            addCriterion("parameter_value =", value, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueNotEqualTo(String value) {
            addCriterion("parameter_value <>", value, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueGreaterThan(String value) {
            addCriterion("parameter_value >", value, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueGreaterThanOrEqualTo(String value) {
            addCriterion("parameter_value >=", value, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueLessThan(String value) {
            addCriterion("parameter_value <", value, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueLessThanOrEqualTo(String value) {
            addCriterion("parameter_value <=", value, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueLike(String value) {
            addCriterion("parameter_value like", value, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueNotLike(String value) {
            addCriterion("parameter_value not like", value, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueIn(List<String> values) {
            addCriterion("parameter_value in", values, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueNotIn(List<String> values) {
            addCriterion("parameter_value not in", values, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueBetween(String value1, String value2) {
            addCriterion("parameter_value between", value1, value2, "parameterValue");
            return (Criteria) this;
        }

        public Criteria andParameterValueNotBetween(String value1, String value2) {
            addCriterion("parameter_value not between", value1, value2, "parameterValue");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}