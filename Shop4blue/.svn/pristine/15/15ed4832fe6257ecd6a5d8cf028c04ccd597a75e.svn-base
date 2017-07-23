package com.shop.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class XxPromotionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public XxPromotionExample() {
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

        public Criteria andOrdersIsNull() {
            addCriterion("orders is null");
            return (Criteria) this;
        }

        public Criteria andOrdersIsNotNull() {
            addCriterion("orders is not null");
            return (Criteria) this;
        }

        public Criteria andOrdersEqualTo(Integer value) {
            addCriterion("orders =", value, "orders");
            return (Criteria) this;
        }

        public Criteria andOrdersNotEqualTo(Integer value) {
            addCriterion("orders <>", value, "orders");
            return (Criteria) this;
        }

        public Criteria andOrdersGreaterThan(Integer value) {
            addCriterion("orders >", value, "orders");
            return (Criteria) this;
        }

        public Criteria andOrdersGreaterThanOrEqualTo(Integer value) {
            addCriterion("orders >=", value, "orders");
            return (Criteria) this;
        }

        public Criteria andOrdersLessThan(Integer value) {
            addCriterion("orders <", value, "orders");
            return (Criteria) this;
        }

        public Criteria andOrdersLessThanOrEqualTo(Integer value) {
            addCriterion("orders <=", value, "orders");
            return (Criteria) this;
        }

        public Criteria andOrdersIn(List<Integer> values) {
            addCriterion("orders in", values, "orders");
            return (Criteria) this;
        }

        public Criteria andOrdersNotIn(List<Integer> values) {
            addCriterion("orders not in", values, "orders");
            return (Criteria) this;
        }

        public Criteria andOrdersBetween(Integer value1, Integer value2) {
            addCriterion("orders between", value1, value2, "orders");
            return (Criteria) this;
        }

        public Criteria andOrdersNotBetween(Integer value1, Integer value2) {
            addCriterion("orders not between", value1, value2, "orders");
            return (Criteria) this;
        }

        public Criteria andBeginDateIsNull() {
            addCriterion("begin_date is null");
            return (Criteria) this;
        }

        public Criteria andBeginDateIsNotNull() {
            addCriterion("begin_date is not null");
            return (Criteria) this;
        }

        public Criteria andBeginDateEqualTo(Date value) {
            addCriterion("begin_date =", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateNotEqualTo(Date value) {
            addCriterion("begin_date <>", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateGreaterThan(Date value) {
            addCriterion("begin_date >", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateGreaterThanOrEqualTo(Date value) {
            addCriterion("begin_date >=", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateLessThan(Date value) {
            addCriterion("begin_date <", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateLessThanOrEqualTo(Date value) {
            addCriterion("begin_date <=", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateIn(List<Date> values) {
            addCriterion("begin_date in", values, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateNotIn(List<Date> values) {
            addCriterion("begin_date not in", values, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateBetween(Date value1, Date value2) {
            addCriterion("begin_date between", value1, value2, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateNotBetween(Date value1, Date value2) {
            addCriterion("begin_date not between", value1, value2, "beginDate");
            return (Criteria) this;
        }

        public Criteria andEndDateIsNull() {
            addCriterion("end_date is null");
            return (Criteria) this;
        }

        public Criteria andEndDateIsNotNull() {
            addCriterion("end_date is not null");
            return (Criteria) this;
        }

        public Criteria andEndDateEqualTo(Date value) {
            addCriterion("end_date =", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateNotEqualTo(Date value) {
            addCriterion("end_date <>", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateGreaterThan(Date value) {
            addCriterion("end_date >", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateGreaterThanOrEqualTo(Date value) {
            addCriterion("end_date >=", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateLessThan(Date value) {
            addCriterion("end_date <", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateLessThanOrEqualTo(Date value) {
            addCriterion("end_date <=", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateIn(List<Date> values) {
            addCriterion("end_date in", values, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateNotIn(List<Date> values) {
            addCriterion("end_date not in", values, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateBetween(Date value1, Date value2) {
            addCriterion("end_date between", value1, value2, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateNotBetween(Date value1, Date value2) {
            addCriterion("end_date not between", value1, value2, "endDate");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedIsNull() {
            addCriterion("is_coupon_allowed is null");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedIsNotNull() {
            addCriterion("is_coupon_allowed is not null");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedEqualTo(Boolean value) {
            addCriterion("is_coupon_allowed =", value, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedNotEqualTo(Boolean value) {
            addCriterion("is_coupon_allowed <>", value, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedGreaterThan(Boolean value) {
            addCriterion("is_coupon_allowed >", value, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_coupon_allowed >=", value, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedLessThan(Boolean value) {
            addCriterion("is_coupon_allowed <", value, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedLessThanOrEqualTo(Boolean value) {
            addCriterion("is_coupon_allowed <=", value, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedIn(List<Boolean> values) {
            addCriterion("is_coupon_allowed in", values, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedNotIn(List<Boolean> values) {
            addCriterion("is_coupon_allowed not in", values, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedBetween(Boolean value1, Boolean value2) {
            addCriterion("is_coupon_allowed between", value1, value2, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsCouponAllowedNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_coupon_allowed not between", value1, value2, "isCouponAllowed");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingIsNull() {
            addCriterion("is_free_shipping is null");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingIsNotNull() {
            addCriterion("is_free_shipping is not null");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingEqualTo(Boolean value) {
            addCriterion("is_free_shipping =", value, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingNotEqualTo(Boolean value) {
            addCriterion("is_free_shipping <>", value, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingGreaterThan(Boolean value) {
            addCriterion("is_free_shipping >", value, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_free_shipping >=", value, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingLessThan(Boolean value) {
            addCriterion("is_free_shipping <", value, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingLessThanOrEqualTo(Boolean value) {
            addCriterion("is_free_shipping <=", value, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingIn(List<Boolean> values) {
            addCriterion("is_free_shipping in", values, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingNotIn(List<Boolean> values) {
            addCriterion("is_free_shipping not in", values, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingBetween(Boolean value1, Boolean value2) {
            addCriterion("is_free_shipping between", value1, value2, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andIsFreeShippingNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_free_shipping not between", value1, value2, "isFreeShipping");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceIsNull() {
            addCriterion("maximum_price is null");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceIsNotNull() {
            addCriterion("maximum_price is not null");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceEqualTo(BigDecimal value) {
            addCriterion("maximum_price =", value, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceNotEqualTo(BigDecimal value) {
            addCriterion("maximum_price <>", value, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceGreaterThan(BigDecimal value) {
            addCriterion("maximum_price >", value, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("maximum_price >=", value, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceLessThan(BigDecimal value) {
            addCriterion("maximum_price <", value, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("maximum_price <=", value, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceIn(List<BigDecimal> values) {
            addCriterion("maximum_price in", values, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceNotIn(List<BigDecimal> values) {
            addCriterion("maximum_price not in", values, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("maximum_price between", value1, value2, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumPriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("maximum_price not between", value1, value2, "maximumPrice");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityIsNull() {
            addCriterion("maximum_quantity is null");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityIsNotNull() {
            addCriterion("maximum_quantity is not null");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityEqualTo(Integer value) {
            addCriterion("maximum_quantity =", value, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityNotEqualTo(Integer value) {
            addCriterion("maximum_quantity <>", value, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityGreaterThan(Integer value) {
            addCriterion("maximum_quantity >", value, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("maximum_quantity >=", value, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityLessThan(Integer value) {
            addCriterion("maximum_quantity <", value, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("maximum_quantity <=", value, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityIn(List<Integer> values) {
            addCriterion("maximum_quantity in", values, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityNotIn(List<Integer> values) {
            addCriterion("maximum_quantity not in", values, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityBetween(Integer value1, Integer value2) {
            addCriterion("maximum_quantity between", value1, value2, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMaximumQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("maximum_quantity not between", value1, value2, "maximumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceIsNull() {
            addCriterion("minimum_price is null");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceIsNotNull() {
            addCriterion("minimum_price is not null");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceEqualTo(BigDecimal value) {
            addCriterion("minimum_price =", value, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceNotEqualTo(BigDecimal value) {
            addCriterion("minimum_price <>", value, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceGreaterThan(BigDecimal value) {
            addCriterion("minimum_price >", value, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("minimum_price >=", value, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceLessThan(BigDecimal value) {
            addCriterion("minimum_price <", value, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("minimum_price <=", value, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceIn(List<BigDecimal> values) {
            addCriterion("minimum_price in", values, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceNotIn(List<BigDecimal> values) {
            addCriterion("minimum_price not in", values, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("minimum_price between", value1, value2, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumPriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("minimum_price not between", value1, value2, "minimumPrice");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityIsNull() {
            addCriterion("minimum_quantity is null");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityIsNotNull() {
            addCriterion("minimum_quantity is not null");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityEqualTo(Integer value) {
            addCriterion("minimum_quantity =", value, "minimumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityNotEqualTo(Integer value) {
            addCriterion("minimum_quantity <>", value, "minimumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityGreaterThan(Integer value) {
            addCriterion("minimum_quantity >", value, "minimumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("minimum_quantity >=", value, "minimumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityLessThan(Integer value) {
            addCriterion("minimum_quantity <", value, "minimumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("minimum_quantity <=", value, "minimumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityIn(List<Integer> values) {
            addCriterion("minimum_quantity in", values, "minimumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityNotIn(List<Integer> values) {
            addCriterion("minimum_quantity not in", values, "minimumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityBetween(Integer value1, Integer value2) {
            addCriterion("minimum_quantity between", value1, value2, "minimumQuantity");
            return (Criteria) this;
        }

        public Criteria andMinimumQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("minimum_quantity not between", value1, value2, "minimumQuantity");
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

        public Criteria andPointExpressionIsNull() {
            addCriterion("point_expression is null");
            return (Criteria) this;
        }

        public Criteria andPointExpressionIsNotNull() {
            addCriterion("point_expression is not null");
            return (Criteria) this;
        }

        public Criteria andPointExpressionEqualTo(String value) {
            addCriterion("point_expression =", value, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionNotEqualTo(String value) {
            addCriterion("point_expression <>", value, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionGreaterThan(String value) {
            addCriterion("point_expression >", value, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionGreaterThanOrEqualTo(String value) {
            addCriterion("point_expression >=", value, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionLessThan(String value) {
            addCriterion("point_expression <", value, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionLessThanOrEqualTo(String value) {
            addCriterion("point_expression <=", value, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionLike(String value) {
            addCriterion("point_expression like", value, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionNotLike(String value) {
            addCriterion("point_expression not like", value, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionIn(List<String> values) {
            addCriterion("point_expression in", values, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionNotIn(List<String> values) {
            addCriterion("point_expression not in", values, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionBetween(String value1, String value2) {
            addCriterion("point_expression between", value1, value2, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPointExpressionNotBetween(String value1, String value2) {
            addCriterion("point_expression not between", value1, value2, "pointExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionIsNull() {
            addCriterion("price_expression is null");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionIsNotNull() {
            addCriterion("price_expression is not null");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionEqualTo(String value) {
            addCriterion("price_expression =", value, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionNotEqualTo(String value) {
            addCriterion("price_expression <>", value, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionGreaterThan(String value) {
            addCriterion("price_expression >", value, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionGreaterThanOrEqualTo(String value) {
            addCriterion("price_expression >=", value, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionLessThan(String value) {
            addCriterion("price_expression <", value, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionLessThanOrEqualTo(String value) {
            addCriterion("price_expression <=", value, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionLike(String value) {
            addCriterion("price_expression like", value, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionNotLike(String value) {
            addCriterion("price_expression not like", value, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionIn(List<String> values) {
            addCriterion("price_expression in", values, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionNotIn(List<String> values) {
            addCriterion("price_expression not in", values, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionBetween(String value1, String value2) {
            addCriterion("price_expression between", value1, value2, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andPriceExpressionNotBetween(String value1, String value2) {
            addCriterion("price_expression not between", value1, value2, "priceExpression");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
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