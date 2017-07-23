package com.shop.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class XxMemberExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public XxMemberExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNull() {
            addCriterion("create_date is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("create_date is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("create_date =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("create_date <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("create_date >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("create_date >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("create_date <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("create_date <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("create_date in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("create_date not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("create_date between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("create_date not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateIsNull() {
            addCriterion("modify_date is null");
            return (Criteria) this;
        }

        public Criteria andModifyDateIsNotNull() {
            addCriterion("modify_date is not null");
            return (Criteria) this;
        }

        public Criteria andModifyDateEqualTo(Date value) {
            addCriterion("modify_date =", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateNotEqualTo(Date value) {
            addCriterion("modify_date <>", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateGreaterThan(Date value) {
            addCriterion("modify_date >", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateGreaterThanOrEqualTo(Date value) {
            addCriterion("modify_date >=", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateLessThan(Date value) {
            addCriterion("modify_date <", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateLessThanOrEqualTo(Date value) {
            addCriterion("modify_date <=", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateIn(List<Date> values) {
            addCriterion("modify_date in", values, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateNotIn(List<Date> values) {
            addCriterion("modify_date not in", values, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateBetween(Date value1, Date value2) {
            addCriterion("modify_date between", value1, value2, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateNotBetween(Date value1, Date value2) {
            addCriterion("modify_date not between", value1, value2, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAmountIsNull() {
            addCriterion("amount is null");
            return (Criteria) this;
        }

        public Criteria andAmountIsNotNull() {
            addCriterion("amount is not null");
            return (Criteria) this;
        }

        public Criteria andAmountEqualTo(BigDecimal value) {
            addCriterion("amount =", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotEqualTo(BigDecimal value) {
            addCriterion("amount <>", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThan(BigDecimal value) {
            addCriterion("amount >", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("amount >=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThan(BigDecimal value) {
            addCriterion("amount <", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("amount <=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountIn(List<BigDecimal> values) {
            addCriterion("amount in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotIn(List<BigDecimal> values) {
            addCriterion("amount not in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("amount between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("amount not between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0IsNull() {
            addCriterion("attribute_value0 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0IsNotNull() {
            addCriterion("attribute_value0 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0EqualTo(String value) {
            addCriterion("attribute_value0 =", value, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0NotEqualTo(String value) {
            addCriterion("attribute_value0 <>", value, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0GreaterThan(String value) {
            addCriterion("attribute_value0 >", value, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value0 >=", value, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0LessThan(String value) {
            addCriterion("attribute_value0 <", value, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0LessThanOrEqualTo(String value) {
            addCriterion("attribute_value0 <=", value, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0Like(String value) {
            addCriterion("attribute_value0 like", value, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0NotLike(String value) {
            addCriterion("attribute_value0 not like", value, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0In(List<String> values) {
            addCriterion("attribute_value0 in", values, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0NotIn(List<String> values) {
            addCriterion("attribute_value0 not in", values, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0Between(String value1, String value2) {
            addCriterion("attribute_value0 between", value1, value2, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue0NotBetween(String value1, String value2) {
            addCriterion("attribute_value0 not between", value1, value2, "attributeValue0");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1IsNull() {
            addCriterion("attribute_value1 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1IsNotNull() {
            addCriterion("attribute_value1 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1EqualTo(String value) {
            addCriterion("attribute_value1 =", value, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1NotEqualTo(String value) {
            addCriterion("attribute_value1 <>", value, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1GreaterThan(String value) {
            addCriterion("attribute_value1 >", value, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value1 >=", value, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1LessThan(String value) {
            addCriterion("attribute_value1 <", value, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1LessThanOrEqualTo(String value) {
            addCriterion("attribute_value1 <=", value, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1Like(String value) {
            addCriterion("attribute_value1 like", value, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1NotLike(String value) {
            addCriterion("attribute_value1 not like", value, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1In(List<String> values) {
            addCriterion("attribute_value1 in", values, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1NotIn(List<String> values) {
            addCriterion("attribute_value1 not in", values, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1Between(String value1, String value2) {
            addCriterion("attribute_value1 between", value1, value2, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue1NotBetween(String value1, String value2) {
            addCriterion("attribute_value1 not between", value1, value2, "attributeValue1");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2IsNull() {
            addCriterion("attribute_value2 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2IsNotNull() {
            addCriterion("attribute_value2 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2EqualTo(String value) {
            addCriterion("attribute_value2 =", value, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2NotEqualTo(String value) {
            addCriterion("attribute_value2 <>", value, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2GreaterThan(String value) {
            addCriterion("attribute_value2 >", value, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value2 >=", value, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2LessThan(String value) {
            addCriterion("attribute_value2 <", value, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2LessThanOrEqualTo(String value) {
            addCriterion("attribute_value2 <=", value, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2Like(String value) {
            addCriterion("attribute_value2 like", value, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2NotLike(String value) {
            addCriterion("attribute_value2 not like", value, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2In(List<String> values) {
            addCriterion("attribute_value2 in", values, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2NotIn(List<String> values) {
            addCriterion("attribute_value2 not in", values, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2Between(String value1, String value2) {
            addCriterion("attribute_value2 between", value1, value2, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue2NotBetween(String value1, String value2) {
            addCriterion("attribute_value2 not between", value1, value2, "attributeValue2");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3IsNull() {
            addCriterion("attribute_value3 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3IsNotNull() {
            addCriterion("attribute_value3 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3EqualTo(String value) {
            addCriterion("attribute_value3 =", value, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3NotEqualTo(String value) {
            addCriterion("attribute_value3 <>", value, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3GreaterThan(String value) {
            addCriterion("attribute_value3 >", value, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value3 >=", value, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3LessThan(String value) {
            addCriterion("attribute_value3 <", value, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3LessThanOrEqualTo(String value) {
            addCriterion("attribute_value3 <=", value, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3Like(String value) {
            addCriterion("attribute_value3 like", value, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3NotLike(String value) {
            addCriterion("attribute_value3 not like", value, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3In(List<String> values) {
            addCriterion("attribute_value3 in", values, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3NotIn(List<String> values) {
            addCriterion("attribute_value3 not in", values, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3Between(String value1, String value2) {
            addCriterion("attribute_value3 between", value1, value2, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue3NotBetween(String value1, String value2) {
            addCriterion("attribute_value3 not between", value1, value2, "attributeValue3");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4IsNull() {
            addCriterion("attribute_value4 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4IsNotNull() {
            addCriterion("attribute_value4 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4EqualTo(String value) {
            addCriterion("attribute_value4 =", value, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4NotEqualTo(String value) {
            addCriterion("attribute_value4 <>", value, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4GreaterThan(String value) {
            addCriterion("attribute_value4 >", value, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value4 >=", value, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4LessThan(String value) {
            addCriterion("attribute_value4 <", value, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4LessThanOrEqualTo(String value) {
            addCriterion("attribute_value4 <=", value, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4Like(String value) {
            addCriterion("attribute_value4 like", value, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4NotLike(String value) {
            addCriterion("attribute_value4 not like", value, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4In(List<String> values) {
            addCriterion("attribute_value4 in", values, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4NotIn(List<String> values) {
            addCriterion("attribute_value4 not in", values, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4Between(String value1, String value2) {
            addCriterion("attribute_value4 between", value1, value2, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue4NotBetween(String value1, String value2) {
            addCriterion("attribute_value4 not between", value1, value2, "attributeValue4");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5IsNull() {
            addCriterion("attribute_value5 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5IsNotNull() {
            addCriterion("attribute_value5 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5EqualTo(String value) {
            addCriterion("attribute_value5 =", value, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5NotEqualTo(String value) {
            addCriterion("attribute_value5 <>", value, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5GreaterThan(String value) {
            addCriterion("attribute_value5 >", value, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value5 >=", value, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5LessThan(String value) {
            addCriterion("attribute_value5 <", value, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5LessThanOrEqualTo(String value) {
            addCriterion("attribute_value5 <=", value, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5Like(String value) {
            addCriterion("attribute_value5 like", value, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5NotLike(String value) {
            addCriterion("attribute_value5 not like", value, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5In(List<String> values) {
            addCriterion("attribute_value5 in", values, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5NotIn(List<String> values) {
            addCriterion("attribute_value5 not in", values, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5Between(String value1, String value2) {
            addCriterion("attribute_value5 between", value1, value2, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue5NotBetween(String value1, String value2) {
            addCriterion("attribute_value5 not between", value1, value2, "attributeValue5");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6IsNull() {
            addCriterion("attribute_value6 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6IsNotNull() {
            addCriterion("attribute_value6 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6EqualTo(String value) {
            addCriterion("attribute_value6 =", value, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6NotEqualTo(String value) {
            addCriterion("attribute_value6 <>", value, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6GreaterThan(String value) {
            addCriterion("attribute_value6 >", value, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value6 >=", value, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6LessThan(String value) {
            addCriterion("attribute_value6 <", value, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6LessThanOrEqualTo(String value) {
            addCriterion("attribute_value6 <=", value, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6Like(String value) {
            addCriterion("attribute_value6 like", value, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6NotLike(String value) {
            addCriterion("attribute_value6 not like", value, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6In(List<String> values) {
            addCriterion("attribute_value6 in", values, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6NotIn(List<String> values) {
            addCriterion("attribute_value6 not in", values, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6Between(String value1, String value2) {
            addCriterion("attribute_value6 between", value1, value2, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue6NotBetween(String value1, String value2) {
            addCriterion("attribute_value6 not between", value1, value2, "attributeValue6");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7IsNull() {
            addCriterion("attribute_value7 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7IsNotNull() {
            addCriterion("attribute_value7 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7EqualTo(String value) {
            addCriterion("attribute_value7 =", value, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7NotEqualTo(String value) {
            addCriterion("attribute_value7 <>", value, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7GreaterThan(String value) {
            addCriterion("attribute_value7 >", value, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value7 >=", value, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7LessThan(String value) {
            addCriterion("attribute_value7 <", value, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7LessThanOrEqualTo(String value) {
            addCriterion("attribute_value7 <=", value, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7Like(String value) {
            addCriterion("attribute_value7 like", value, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7NotLike(String value) {
            addCriterion("attribute_value7 not like", value, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7In(List<String> values) {
            addCriterion("attribute_value7 in", values, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7NotIn(List<String> values) {
            addCriterion("attribute_value7 not in", values, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7Between(String value1, String value2) {
            addCriterion("attribute_value7 between", value1, value2, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue7NotBetween(String value1, String value2) {
            addCriterion("attribute_value7 not between", value1, value2, "attributeValue7");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8IsNull() {
            addCriterion("attribute_value8 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8IsNotNull() {
            addCriterion("attribute_value8 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8EqualTo(String value) {
            addCriterion("attribute_value8 =", value, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8NotEqualTo(String value) {
            addCriterion("attribute_value8 <>", value, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8GreaterThan(String value) {
            addCriterion("attribute_value8 >", value, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value8 >=", value, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8LessThan(String value) {
            addCriterion("attribute_value8 <", value, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8LessThanOrEqualTo(String value) {
            addCriterion("attribute_value8 <=", value, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8Like(String value) {
            addCriterion("attribute_value8 like", value, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8NotLike(String value) {
            addCriterion("attribute_value8 not like", value, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8In(List<String> values) {
            addCriterion("attribute_value8 in", values, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8NotIn(List<String> values) {
            addCriterion("attribute_value8 not in", values, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8Between(String value1, String value2) {
            addCriterion("attribute_value8 between", value1, value2, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue8NotBetween(String value1, String value2) {
            addCriterion("attribute_value8 not between", value1, value2, "attributeValue8");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9IsNull() {
            addCriterion("attribute_value9 is null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9IsNotNull() {
            addCriterion("attribute_value9 is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9EqualTo(String value) {
            addCriterion("attribute_value9 =", value, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9NotEqualTo(String value) {
            addCriterion("attribute_value9 <>", value, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9GreaterThan(String value) {
            addCriterion("attribute_value9 >", value, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9GreaterThanOrEqualTo(String value) {
            addCriterion("attribute_value9 >=", value, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9LessThan(String value) {
            addCriterion("attribute_value9 <", value, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9LessThanOrEqualTo(String value) {
            addCriterion("attribute_value9 <=", value, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9Like(String value) {
            addCriterion("attribute_value9 like", value, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9NotLike(String value) {
            addCriterion("attribute_value9 not like", value, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9In(List<String> values) {
            addCriterion("attribute_value9 in", values, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9NotIn(List<String> values) {
            addCriterion("attribute_value9 not in", values, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9Between(String value1, String value2) {
            addCriterion("attribute_value9 between", value1, value2, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andAttributeValue9NotBetween(String value1, String value2) {
            addCriterion("attribute_value9 not between", value1, value2, "attributeValue9");
            return (Criteria) this;
        }

        public Criteria andBalanceIsNull() {
            addCriterion("balance is null");
            return (Criteria) this;
        }

        public Criteria andBalanceIsNotNull() {
            addCriterion("balance is not null");
            return (Criteria) this;
        }

        public Criteria andBalanceEqualTo(BigDecimal value) {
            addCriterion("balance =", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceNotEqualTo(BigDecimal value) {
            addCriterion("balance <>", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceGreaterThan(BigDecimal value) {
            addCriterion("balance >", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("balance >=", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceLessThan(BigDecimal value) {
            addCriterion("balance <", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("balance <=", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceIn(List<BigDecimal> values) {
            addCriterion("balance in", values, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceNotIn(List<BigDecimal> values) {
            addCriterion("balance not in", values, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("balance between", value1, value2, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("balance not between", value1, value2, "balance");
            return (Criteria) this;
        }

        public Criteria andBirthIsNull() {
            addCriterion("birth is null");
            return (Criteria) this;
        }

        public Criteria andBirthIsNotNull() {
            addCriterion("birth is not null");
            return (Criteria) this;
        }

        public Criteria andBirthEqualTo(Date value) {
            addCriterion("birth =", value, "birth");
            return (Criteria) this;
        }

        public Criteria andBirthNotEqualTo(Date value) {
            addCriterion("birth <>", value, "birth");
            return (Criteria) this;
        }

        public Criteria andBirthGreaterThan(Date value) {
            addCriterion("birth >", value, "birth");
            return (Criteria) this;
        }

        public Criteria andBirthGreaterThanOrEqualTo(Date value) {
            addCriterion("birth >=", value, "birth");
            return (Criteria) this;
        }

        public Criteria andBirthLessThan(Date value) {
            addCriterion("birth <", value, "birth");
            return (Criteria) this;
        }

        public Criteria andBirthLessThanOrEqualTo(Date value) {
            addCriterion("birth <=", value, "birth");
            return (Criteria) this;
        }

        public Criteria andBirthIn(List<Date> values) {
            addCriterion("birth in", values, "birth");
            return (Criteria) this;
        }

        public Criteria andBirthNotIn(List<Date> values) {
            addCriterion("birth not in", values, "birth");
            return (Criteria) this;
        }

        public Criteria andBirthBetween(Date value1, Date value2) {
            addCriterion("birth between", value1, value2, "birth");
            return (Criteria) this;
        }

        public Criteria andBirthNotBetween(Date value1, Date value2) {
            addCriterion("birth not between", value1, value2, "birth");
            return (Criteria) this;
        }

        public Criteria andEmailIsNull() {
            addCriterion("email is null");
            return (Criteria) this;
        }

        public Criteria andEmailIsNotNull() {
            addCriterion("email is not null");
            return (Criteria) this;
        }

        public Criteria andEmailEqualTo(String value) {
            addCriterion("email =", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotEqualTo(String value) {
            addCriterion("email <>", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThan(String value) {
            addCriterion("email >", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThanOrEqualTo(String value) {
            addCriterion("email >=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThan(String value) {
            addCriterion("email <", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThanOrEqualTo(String value) {
            addCriterion("email <=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLike(String value) {
            addCriterion("email like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotLike(String value) {
            addCriterion("email not like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailIn(List<String> values) {
            addCriterion("email in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotIn(List<String> values) {
            addCriterion("email not in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailBetween(String value1, String value2) {
            addCriterion("email between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotBetween(String value1, String value2) {
            addCriterion("email not between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andGenderIsNull() {
            addCriterion("gender is null");
            return (Criteria) this;
        }

        public Criteria andGenderIsNotNull() {
            addCriterion("gender is not null");
            return (Criteria) this;
        }

        public Criteria andGenderEqualTo(Integer value) {
            addCriterion("gender =", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotEqualTo(Integer value) {
            addCriterion("gender <>", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderGreaterThan(Integer value) {
            addCriterion("gender >", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderGreaterThanOrEqualTo(Integer value) {
            addCriterion("gender >=", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderLessThan(Integer value) {
            addCriterion("gender <", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderLessThanOrEqualTo(Integer value) {
            addCriterion("gender <=", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderIn(List<Integer> values) {
            addCriterion("gender in", values, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotIn(List<Integer> values) {
            addCriterion("gender not in", values, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderBetween(Integer value1, Integer value2) {
            addCriterion("gender between", value1, value2, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotBetween(Integer value1, Integer value2) {
            addCriterion("gender not between", value1, value2, "gender");
            return (Criteria) this;
        }

        public Criteria andIsEnabledIsNull() {
            addCriterion("is_enabled is null");
            return (Criteria) this;
        }

        public Criteria andIsEnabledIsNotNull() {
            addCriterion("is_enabled is not null");
            return (Criteria) this;
        }

        public Criteria andIsEnabledEqualTo(Boolean value) {
            addCriterion("is_enabled =", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledNotEqualTo(Boolean value) {
            addCriterion("is_enabled <>", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledGreaterThan(Boolean value) {
            addCriterion("is_enabled >", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_enabled >=", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledLessThan(Boolean value) {
            addCriterion("is_enabled <", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledLessThanOrEqualTo(Boolean value) {
            addCriterion("is_enabled <=", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledIn(List<Boolean> values) {
            addCriterion("is_enabled in", values, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledNotIn(List<Boolean> values) {
            addCriterion("is_enabled not in", values, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledBetween(Boolean value1, Boolean value2) {
            addCriterion("is_enabled between", value1, value2, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_enabled not between", value1, value2, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsLockedIsNull() {
            addCriterion("is_locked is null");
            return (Criteria) this;
        }

        public Criteria andIsLockedIsNotNull() {
            addCriterion("is_locked is not null");
            return (Criteria) this;
        }

        public Criteria andIsLockedEqualTo(Boolean value) {
            addCriterion("is_locked =", value, "isLocked");
            return (Criteria) this;
        }

        public Criteria andIsLockedNotEqualTo(Boolean value) {
            addCriterion("is_locked <>", value, "isLocked");
            return (Criteria) this;
        }

        public Criteria andIsLockedGreaterThan(Boolean value) {
            addCriterion("is_locked >", value, "isLocked");
            return (Criteria) this;
        }

        public Criteria andIsLockedGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_locked >=", value, "isLocked");
            return (Criteria) this;
        }

        public Criteria andIsLockedLessThan(Boolean value) {
            addCriterion("is_locked <", value, "isLocked");
            return (Criteria) this;
        }

        public Criteria andIsLockedLessThanOrEqualTo(Boolean value) {
            addCriterion("is_locked <=", value, "isLocked");
            return (Criteria) this;
        }

        public Criteria andIsLockedIn(List<Boolean> values) {
            addCriterion("is_locked in", values, "isLocked");
            return (Criteria) this;
        }

        public Criteria andIsLockedNotIn(List<Boolean> values) {
            addCriterion("is_locked not in", values, "isLocked");
            return (Criteria) this;
        }

        public Criteria andIsLockedBetween(Boolean value1, Boolean value2) {
            addCriterion("is_locked between", value1, value2, "isLocked");
            return (Criteria) this;
        }

        public Criteria andIsLockedNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_locked not between", value1, value2, "isLocked");
            return (Criteria) this;
        }

        public Criteria andLockedDateIsNull() {
            addCriterion("locked_date is null");
            return (Criteria) this;
        }

        public Criteria andLockedDateIsNotNull() {
            addCriterion("locked_date is not null");
            return (Criteria) this;
        }

        public Criteria andLockedDateEqualTo(Date value) {
            addCriterion("locked_date =", value, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLockedDateNotEqualTo(Date value) {
            addCriterion("locked_date <>", value, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLockedDateGreaterThan(Date value) {
            addCriterion("locked_date >", value, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLockedDateGreaterThanOrEqualTo(Date value) {
            addCriterion("locked_date >=", value, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLockedDateLessThan(Date value) {
            addCriterion("locked_date <", value, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLockedDateLessThanOrEqualTo(Date value) {
            addCriterion("locked_date <=", value, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLockedDateIn(List<Date> values) {
            addCriterion("locked_date in", values, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLockedDateNotIn(List<Date> values) {
            addCriterion("locked_date not in", values, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLockedDateBetween(Date value1, Date value2) {
            addCriterion("locked_date between", value1, value2, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLockedDateNotBetween(Date value1, Date value2) {
            addCriterion("locked_date not between", value1, value2, "lockedDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateIsNull() {
            addCriterion("login_date is null");
            return (Criteria) this;
        }

        public Criteria andLoginDateIsNotNull() {
            addCriterion("login_date is not null");
            return (Criteria) this;
        }

        public Criteria andLoginDateEqualTo(Date value) {
            addCriterion("login_date =", value, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateNotEqualTo(Date value) {
            addCriterion("login_date <>", value, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateGreaterThan(Date value) {
            addCriterion("login_date >", value, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateGreaterThanOrEqualTo(Date value) {
            addCriterion("login_date >=", value, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateLessThan(Date value) {
            addCriterion("login_date <", value, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateLessThanOrEqualTo(Date value) {
            addCriterion("login_date <=", value, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateIn(List<Date> values) {
            addCriterion("login_date in", values, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateNotIn(List<Date> values) {
            addCriterion("login_date not in", values, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateBetween(Date value1, Date value2) {
            addCriterion("login_date between", value1, value2, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginDateNotBetween(Date value1, Date value2) {
            addCriterion("login_date not between", value1, value2, "loginDate");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountIsNull() {
            addCriterion("login_failure_count is null");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountIsNotNull() {
            addCriterion("login_failure_count is not null");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountEqualTo(Integer value) {
            addCriterion("login_failure_count =", value, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountNotEqualTo(Integer value) {
            addCriterion("login_failure_count <>", value, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountGreaterThan(Integer value) {
            addCriterion("login_failure_count >", value, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("login_failure_count >=", value, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountLessThan(Integer value) {
            addCriterion("login_failure_count <", value, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountLessThanOrEqualTo(Integer value) {
            addCriterion("login_failure_count <=", value, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountIn(List<Integer> values) {
            addCriterion("login_failure_count in", values, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountNotIn(List<Integer> values) {
            addCriterion("login_failure_count not in", values, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountBetween(Integer value1, Integer value2) {
            addCriterion("login_failure_count between", value1, value2, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginFailureCountNotBetween(Integer value1, Integer value2) {
            addCriterion("login_failure_count not between", value1, value2, "loginFailureCount");
            return (Criteria) this;
        }

        public Criteria andLoginIpIsNull() {
            addCriterion("login_ip is null");
            return (Criteria) this;
        }

        public Criteria andLoginIpIsNotNull() {
            addCriterion("login_ip is not null");
            return (Criteria) this;
        }

        public Criteria andLoginIpEqualTo(String value) {
            addCriterion("login_ip =", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpNotEqualTo(String value) {
            addCriterion("login_ip <>", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpGreaterThan(String value) {
            addCriterion("login_ip >", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpGreaterThanOrEqualTo(String value) {
            addCriterion("login_ip >=", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpLessThan(String value) {
            addCriterion("login_ip <", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpLessThanOrEqualTo(String value) {
            addCriterion("login_ip <=", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpLike(String value) {
            addCriterion("login_ip like", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpNotLike(String value) {
            addCriterion("login_ip not like", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpIn(List<String> values) {
            addCriterion("login_ip in", values, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpNotIn(List<String> values) {
            addCriterion("login_ip not in", values, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpBetween(String value1, String value2) {
            addCriterion("login_ip between", value1, value2, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpNotBetween(String value1, String value2) {
            addCriterion("login_ip not between", value1, value2, "loginIp");
            return (Criteria) this;
        }

        public Criteria andMobileIsNull() {
            addCriterion("mobile is null");
            return (Criteria) this;
        }

        public Criteria andMobileIsNotNull() {
            addCriterion("mobile is not null");
            return (Criteria) this;
        }

        public Criteria andMobileEqualTo(String value) {
            addCriterion("mobile =", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotEqualTo(String value) {
            addCriterion("mobile <>", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileGreaterThan(String value) {
            addCriterion("mobile >", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileGreaterThanOrEqualTo(String value) {
            addCriterion("mobile >=", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLessThan(String value) {
            addCriterion("mobile <", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLessThanOrEqualTo(String value) {
            addCriterion("mobile <=", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLike(String value) {
            addCriterion("mobile like", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotLike(String value) {
            addCriterion("mobile not like", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileIn(List<String> values) {
            addCriterion("mobile in", values, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotIn(List<String> values) {
            addCriterion("mobile not in", values, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileBetween(String value1, String value2) {
            addCriterion("mobile between", value1, value2, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotBetween(String value1, String value2) {
            addCriterion("mobile not between", value1, value2, "mobile");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNull() {
            addCriterion("password is null");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNotNull() {
            addCriterion("password is not null");
            return (Criteria) this;
        }

        public Criteria andPasswordEqualTo(String value) {
            addCriterion("password =", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotEqualTo(String value) {
            addCriterion("password <>", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThan(String value) {
            addCriterion("password >", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("password >=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThan(String value) {
            addCriterion("password <", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThanOrEqualTo(String value) {
            addCriterion("password <=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLike(String value) {
            addCriterion("password like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotLike(String value) {
            addCriterion("password not like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordIn(List<String> values) {
            addCriterion("password in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotIn(List<String> values) {
            addCriterion("password not in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordBetween(String value1, String value2) {
            addCriterion("password between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotBetween(String value1, String value2) {
            addCriterion("password not between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNull() {
            addCriterion("phone is null");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNotNull() {
            addCriterion("phone is not null");
            return (Criteria) this;
        }

        public Criteria andPhoneEqualTo(String value) {
            addCriterion("phone =", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotEqualTo(String value) {
            addCriterion("phone <>", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThan(String value) {
            addCriterion("phone >", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("phone >=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThan(String value) {
            addCriterion("phone <", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThanOrEqualTo(String value) {
            addCriterion("phone <=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLike(String value) {
            addCriterion("phone like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotLike(String value) {
            addCriterion("phone not like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneIn(List<String> values) {
            addCriterion("phone in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotIn(List<String> values) {
            addCriterion("phone not in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneBetween(String value1, String value2) {
            addCriterion("phone between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotBetween(String value1, String value2) {
            addCriterion("phone not between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPointIsNull() {
            addCriterion("point is null");
            return (Criteria) this;
        }

        public Criteria andPointIsNotNull() {
            addCriterion("point is not null");
            return (Criteria) this;
        }

        public Criteria andPointEqualTo(Long value) {
            addCriterion("point =", value, "point");
            return (Criteria) this;
        }

        public Criteria andPointNotEqualTo(Long value) {
            addCriterion("point <>", value, "point");
            return (Criteria) this;
        }

        public Criteria andPointGreaterThan(Long value) {
            addCriterion("point >", value, "point");
            return (Criteria) this;
        }

        public Criteria andPointGreaterThanOrEqualTo(Long value) {
            addCriterion("point >=", value, "point");
            return (Criteria) this;
        }

        public Criteria andPointLessThan(Long value) {
            addCriterion("point <", value, "point");
            return (Criteria) this;
        }

        public Criteria andPointLessThanOrEqualTo(Long value) {
            addCriterion("point <=", value, "point");
            return (Criteria) this;
        }

        public Criteria andPointIn(List<Long> values) {
            addCriterion("point in", values, "point");
            return (Criteria) this;
        }

        public Criteria andPointNotIn(List<Long> values) {
            addCriterion("point not in", values, "point");
            return (Criteria) this;
        }

        public Criteria andPointBetween(Long value1, Long value2) {
            addCriterion("point between", value1, value2, "point");
            return (Criteria) this;
        }

        public Criteria andPointNotBetween(Long value1, Long value2) {
            addCriterion("point not between", value1, value2, "point");
            return (Criteria) this;
        }

        public Criteria andRegisterIpIsNull() {
            addCriterion("register_ip is null");
            return (Criteria) this;
        }

        public Criteria andRegisterIpIsNotNull() {
            addCriterion("register_ip is not null");
            return (Criteria) this;
        }

        public Criteria andRegisterIpEqualTo(String value) {
            addCriterion("register_ip =", value, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpNotEqualTo(String value) {
            addCriterion("register_ip <>", value, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpGreaterThan(String value) {
            addCriterion("register_ip >", value, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpGreaterThanOrEqualTo(String value) {
            addCriterion("register_ip >=", value, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpLessThan(String value) {
            addCriterion("register_ip <", value, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpLessThanOrEqualTo(String value) {
            addCriterion("register_ip <=", value, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpLike(String value) {
            addCriterion("register_ip like", value, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpNotLike(String value) {
            addCriterion("register_ip not like", value, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpIn(List<String> values) {
            addCriterion("register_ip in", values, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpNotIn(List<String> values) {
            addCriterion("register_ip not in", values, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpBetween(String value1, String value2) {
            addCriterion("register_ip between", value1, value2, "registerIp");
            return (Criteria) this;
        }

        public Criteria andRegisterIpNotBetween(String value1, String value2) {
            addCriterion("register_ip not between", value1, value2, "registerIp");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireIsNull() {
            addCriterion("safe_key_expire is null");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireIsNotNull() {
            addCriterion("safe_key_expire is not null");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireEqualTo(Date value) {
            addCriterion("safe_key_expire =", value, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireNotEqualTo(Date value) {
            addCriterion("safe_key_expire <>", value, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireGreaterThan(Date value) {
            addCriterion("safe_key_expire >", value, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireGreaterThanOrEqualTo(Date value) {
            addCriterion("safe_key_expire >=", value, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireLessThan(Date value) {
            addCriterion("safe_key_expire <", value, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireLessThanOrEqualTo(Date value) {
            addCriterion("safe_key_expire <=", value, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireIn(List<Date> values) {
            addCriterion("safe_key_expire in", values, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireNotIn(List<Date> values) {
            addCriterion("safe_key_expire not in", values, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireBetween(Date value1, Date value2) {
            addCriterion("safe_key_expire between", value1, value2, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyExpireNotBetween(Date value1, Date value2) {
            addCriterion("safe_key_expire not between", value1, value2, "safeKeyExpire");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueIsNull() {
            addCriterion("safe_key_value is null");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueIsNotNull() {
            addCriterion("safe_key_value is not null");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueEqualTo(String value) {
            addCriterion("safe_key_value =", value, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueNotEqualTo(String value) {
            addCriterion("safe_key_value <>", value, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueGreaterThan(String value) {
            addCriterion("safe_key_value >", value, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueGreaterThanOrEqualTo(String value) {
            addCriterion("safe_key_value >=", value, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueLessThan(String value) {
            addCriterion("safe_key_value <", value, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueLessThanOrEqualTo(String value) {
            addCriterion("safe_key_value <=", value, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueLike(String value) {
            addCriterion("safe_key_value like", value, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueNotLike(String value) {
            addCriterion("safe_key_value not like", value, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueIn(List<String> values) {
            addCriterion("safe_key_value in", values, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueNotIn(List<String> values) {
            addCriterion("safe_key_value not in", values, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueBetween(String value1, String value2) {
            addCriterion("safe_key_value between", value1, value2, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andSafeKeyValueNotBetween(String value1, String value2) {
            addCriterion("safe_key_value not between", value1, value2, "safeKeyValue");
            return (Criteria) this;
        }

        public Criteria andUsernameIsNull() {
            addCriterion("username is null");
            return (Criteria) this;
        }

        public Criteria andUsernameIsNotNull() {
            addCriterion("username is not null");
            return (Criteria) this;
        }

        public Criteria andUsernameEqualTo(String value) {
            addCriterion("username =", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotEqualTo(String value) {
            addCriterion("username <>", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameGreaterThan(String value) {
            addCriterion("username >", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameGreaterThanOrEqualTo(String value) {
            addCriterion("username >=", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLessThan(String value) {
            addCriterion("username <", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLessThanOrEqualTo(String value) {
            addCriterion("username <=", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLike(String value) {
            addCriterion("username like", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotLike(String value) {
            addCriterion("username not like", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameIn(List<String> values) {
            addCriterion("username in", values, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotIn(List<String> values) {
            addCriterion("username not in", values, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameBetween(String value1, String value2) {
            addCriterion("username between", value1, value2, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotBetween(String value1, String value2) {
            addCriterion("username not between", value1, value2, "username");
            return (Criteria) this;
        }

        public Criteria andZipCodeIsNull() {
            addCriterion("zip_code is null");
            return (Criteria) this;
        }

        public Criteria andZipCodeIsNotNull() {
            addCriterion("zip_code is not null");
            return (Criteria) this;
        }

        public Criteria andZipCodeEqualTo(String value) {
            addCriterion("zip_code =", value, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeNotEqualTo(String value) {
            addCriterion("zip_code <>", value, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeGreaterThan(String value) {
            addCriterion("zip_code >", value, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeGreaterThanOrEqualTo(String value) {
            addCriterion("zip_code >=", value, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeLessThan(String value) {
            addCriterion("zip_code <", value, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeLessThanOrEqualTo(String value) {
            addCriterion("zip_code <=", value, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeLike(String value) {
            addCriterion("zip_code like", value, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeNotLike(String value) {
            addCriterion("zip_code not like", value, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeIn(List<String> values) {
            addCriterion("zip_code in", values, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeNotIn(List<String> values) {
            addCriterion("zip_code not in", values, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeBetween(String value1, String value2) {
            addCriterion("zip_code between", value1, value2, "zipCode");
            return (Criteria) this;
        }

        public Criteria andZipCodeNotBetween(String value1, String value2) {
            addCriterion("zip_code not between", value1, value2, "zipCode");
            return (Criteria) this;
        }

        public Criteria andAreaIsNull() {
            addCriterion("area is null");
            return (Criteria) this;
        }

        public Criteria andAreaIsNotNull() {
            addCriterion("area is not null");
            return (Criteria) this;
        }

        public Criteria andAreaEqualTo(Long value) {
            addCriterion("area =", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotEqualTo(Long value) {
            addCriterion("area <>", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaGreaterThan(Long value) {
            addCriterion("area >", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaGreaterThanOrEqualTo(Long value) {
            addCriterion("area >=", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaLessThan(Long value) {
            addCriterion("area <", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaLessThanOrEqualTo(Long value) {
            addCriterion("area <=", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaIn(List<Long> values) {
            addCriterion("area in", values, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotIn(List<Long> values) {
            addCriterion("area not in", values, "area");
            return (Criteria) this;
        }

        public Criteria andAreaBetween(Long value1, Long value2) {
            addCriterion("area between", value1, value2, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotBetween(Long value1, Long value2) {
            addCriterion("area not between", value1, value2, "area");
            return (Criteria) this;
        }

        public Criteria andMemberRankIsNull() {
            addCriterion("member_rank is null");
            return (Criteria) this;
        }

        public Criteria andMemberRankIsNotNull() {
            addCriterion("member_rank is not null");
            return (Criteria) this;
        }

        public Criteria andMemberRankEqualTo(Long value) {
            addCriterion("member_rank =", value, "memberRank");
            return (Criteria) this;
        }

        public Criteria andMemberRankNotEqualTo(Long value) {
            addCriterion("member_rank <>", value, "memberRank");
            return (Criteria) this;
        }

        public Criteria andMemberRankGreaterThan(Long value) {
            addCriterion("member_rank >", value, "memberRank");
            return (Criteria) this;
        }

        public Criteria andMemberRankGreaterThanOrEqualTo(Long value) {
            addCriterion("member_rank >=", value, "memberRank");
            return (Criteria) this;
        }

        public Criteria andMemberRankLessThan(Long value) {
            addCriterion("member_rank <", value, "memberRank");
            return (Criteria) this;
        }

        public Criteria andMemberRankLessThanOrEqualTo(Long value) {
            addCriterion("member_rank <=", value, "memberRank");
            return (Criteria) this;
        }

        public Criteria andMemberRankIn(List<Long> values) {
            addCriterion("member_rank in", values, "memberRank");
            return (Criteria) this;
        }

        public Criteria andMemberRankNotIn(List<Long> values) {
            addCriterion("member_rank not in", values, "memberRank");
            return (Criteria) this;
        }

        public Criteria andMemberRankBetween(Long value1, Long value2) {
            addCriterion("member_rank between", value1, value2, "memberRank");
            return (Criteria) this;
        }

        public Criteria andMemberRankNotBetween(Long value1, Long value2) {
            addCriterion("member_rank not between", value1, value2, "memberRank");
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